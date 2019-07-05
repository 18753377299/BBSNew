package controller;

import java.awt.Image;
import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;




import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import javax.swing.ImageIcon;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import domain.User;
import service.SequenceGenerator;
import service.UserService;
import util.CommonUtils;

@Controller
@RequestMapping(value="user")
public class UserController {
	
	@Autowired
	private UserService userService;
	
	
	@Autowired 
	private SequenceGenerator sequenceGenerator;
	
//	@RequestMapping("login")
//	@ResponseBody
//	public boolean login() {
//		User user = new User();
//		user.setUsername("yuzhaoxi");
//		user = userService.login(user);
//		System.out.println(user.getPassword());
//		return false;
//	} 
	//修改密码时检验密码是否原密码是否输入正确
	@RequestMapping(value="ajaxValidatePassword")
	public String ajaxValidatePassword(User formUser,HttpServletRequest request,HttpServletResponse response)
			throws IOException{
		User user =(User)request.getSession().getAttribute("user");		
		Integer  userId=user.getUserId();
		formUser.setUserId(userId);
		request.setAttribute("user",formUser);
		boolean b =userService.ajaxValidatePassword(user);		
		response.getWriter().print(b);
		return null;
	}
	
	//用户名是否注册校验
	@RequestMapping(value="ajaxValidateUsername")
	public String ajaxValidateUsername(User user,HttpServletResponse response)
	throws IOException{
		String username=user.getUsername();
		System.out.println("++++ajax校验");
		boolean b=userService.ajaxValidateUsername(username);
		System.out.println("++++ajax校验2");
		response.getWriter().print(b);	
		return  null;
	}
	//查询用户信息
	@RequestMapping(value="find")
	public String find(HttpServletRequest request){
//		User user =(User)request.getSession().getAttribute("user");
//		User formUser=userService.find(user);
//		request.setAttribute("user",formUser);
		return "pages/myInfo1";
	}
	//修改用户信息
	@RequestMapping(value="editMyInfo",method=RequestMethod.POST)
	 public String oneUpload(@RequestParam("image") MultipartFile file,
             HttpServletRequest request) throws IOException {
	String path= request.getSession().getServletContext().getRealPath("/upload");
	System.out.println("====="+path);
	File savepath =new File(path);
	if(!savepath.exists()){
		savepath.mkdirs();
	}
	String filename= "";
	SimpleDateFormat format=new SimpleDateFormat("yyyymmddHHmmssSSS");
	filename=filename+format.format(new Date());
	Random random=new Random();
	for(int i=0;i<3;i++){
		filename+=random.nextInt(9);
	}
	
	String originalFilename=file.getOriginalFilename();
	filename=filename+originalFilename;
	File savefile=new File(path+"/"+filename);
	if(!savefile.exists()){
	savefile.createNewFile();
	}
	file.transferTo(savefile);
	
	User formUser = CommonUtils.toBean(request.getParameterMap(), User.class);
	User user=(User)request.getSession().getAttribute("user");
	System.out.println("++++"+formUser.getUsername()+" "+formUser.getAge()+" "+formUser.getSex());
	// 1. 使用文件路径创建ImageIcon
	ImageIcon icon=new ImageIcon(savefile.getAbsolutePath());
	System.out.println(savefile.getAbsolutePath());
	// 2. 通过ImageIcon得到Image对象
	Image image=icon.getImage();
	//3.
	if(image.getHeight(null)>1000||image.getWidth(null)>1000){
		request.setAttribute("msg", "图片的尺寸过大！");
	}
	//把图片的路径设置给user对象
	formUser.setImage("upload/"+filename);
	System.out.println(formUser.getImage());
	userService.editMyInfo(formUser, user.getUserId());
	request.setAttribute("user", formUser);	
	return "pages/show";
	}

	 //修改密码
	@RequestMapping(value="updatePassword",method=RequestMethod.POST)
	public String updatePassword(HttpServletRequest request,HttpServletResponse response)
		throws ServletException,IOException{
			
		//获取所有的表单数据
		User formUser=CommonUtils.toBean(request.getParameterMap(), User.class);
		System.out.println("==="+formUser.getNewpass());
			
			
		User user=(User)request.getSession().getAttribute("user");

		if(user==null){
			request.setAttribute("msg", "您还没有登录，请登录后操作！");
			return "pages/loginAndRegist";
		}else{
			try {
				userService.updatePassword(user.getUserId(),formUser.getPassword(),formUser.getNewpass());
				request.setAttribute("msg", "修改密码成功！");
				return "pages/msg";
			} catch (Exception e) {
				request.setAttribute("user", formUser);
				return "pages/updatePassword1";
			}			
		}
			
	}
		
	//注册功能的实现
	@RequestMapping(value="regist",method=RequestMethod.POST)
	public String regist(HttpServletRequest request,HttpServletResponse response) 
		throws ServletException,IOException{
		System.out.println("++++++regist");
		User formUser=CommonUtils.toBean(request.getParameterMap(), User.class);
		Integer userId= sequenceGenerator.nextRechargeOrderSeq();		
		formUser.setUserId(userId);
		request.setAttribute("user", formUser);
		//邮箱校验
		String email=formUser.getEmail();
		if(email==null||email.trim().isEmpty()){
			request.setAttribute("msg", "邮箱不能为空！");
			return "pages/loginAndRegist";
		}
//		}else if(!email.matches("^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\\.[a-zA-Z0-9_-]{2,3}){1,2})$")){
//			request.setAttribute("msg", "邮箱格式不正确!");
//			return "regist";
//		}
		//验证码校验
		String vCode=(String)request.getSession().getAttribute("vCode");
		String verifyCode=formUser.getVerifyCode();
		if(verifyCode==null||verifyCode.trim().isEmpty()){
			request.setAttribute("msg", "验证码不能为空！");
			return "pages/loginAndRegist";
		}else if(!verifyCode.equalsIgnoreCase(vCode)){
			request.setAttribute("msg", "验证码错误");	
			return "pages/loginAndRegist";
		}	
		
		userService.regist(formUser);
		request.setAttribute("msg","恭喜你，注册成功，请进行登陆");
		request.setAttribute("user", formUser);	
		return "pages/msg";
	}
	//登录功能的实现
	@RequestMapping("login")
	public String login(HttpServletRequest request,HttpServletResponse response)
		throws ServletException,IOException{
		User formUser=CommonUtils.toBean(request.getParameterMap(), User.class);
		System.out.println("+++"+formUser.getUsername());
		
		User user= userService.login(formUser);
		//校验验证码
		String vCode=(String)request.getSession().getAttribute("vCode");
		String verifyCode=formUser.getVerifyCode();
		if(verifyCode==null||verifyCode.trim().isEmpty()){
			request.setAttribute("msg", "验证码不能为空！");
			return "pages/loginAndRegist";
		}else if(!verifyCode.equalsIgnoreCase(vCode)){
			request.setAttribute("msg", "验证码错误!");
			request.setAttribute("user", formUser);
			return "pages/loginAndRegist";
		}	
		if(user==null){
			request.setAttribute("msg", "用户名或密码错误!");
			request.setAttribute("user", formUser);
			return "pages/loginAndRegist";
		}else{
			request.getSession().setAttribute("user", user);
			//获取用户名到cookie中
			String loginname=user.getUsername();
			loginname=URLDecoder.decode(loginname,"UTF-8");
			Cookie cookie=new Cookie("loginname", loginname);
			cookie.setMaxAge(60*60*24*10);
			response.addCookie(cookie);
			
			//进入主页面		
			return "index";
		}
		
	}
	    //管理员登录功能的实现
		@RequestMapping("adminLogin")
		public String adminLogin(HttpServletRequest request,HttpServletResponse response)
			throws ServletException,IOException{
			User formUser=CommonUtils.toBean(request.getParameterMap(), User.class);
			System.out.println("+++"+formUser.getUsername());
			
			    User user= userService.login(formUser);
				request.getSession().setAttribute("user", user);
				String permission=user.getPermission();
				System.out.println("permission"+permission);
				//获取用户名到cookie中
				String loginname=user.getUsername();
				loginname=URLDecoder.decode(loginname,"UTF-8");
				Cookie cookie=new Cookie("loginname", loginname);
				cookie.setMaxAge(60*60*24*10);
				response.addCookie(cookie);
				if(permission.equals("1")){
					//进入主页面		
					return "aaa/Views/Index";
				}else{
					request.setAttribute("msg","您不具备管理员的权限");
					return "aaa/login";
				}
							
		}
	//退出功能	
	@RequestMapping(value="quit")
	public String quit(HttpServletRequest request,HttpServletResponse response)
		throws ServletException,IOException{
		System.out.println("我在退出页面");
		request.getSession().invalidate();
		return "pages/loginAndRegist";
	}
	//admin退出功能	
		@RequestMapping(value="adminQuit")
		public String adminQuit(HttpServletRequest request,HttpServletResponse response)
			throws ServletException,IOException{
			System.out.println("退出页面");
			request.getSession().invalidate();
			return "aaa/login";
		}

}
