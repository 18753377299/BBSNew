package controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import domain.Page;
import domain.Post;
import domain.Section;
import domain.User;
import service.PostYService;
import service.SequenceGenerator;

@Controller
@RequestMapping("/bbsYPost/")
public class PostYController {

	@Autowired
	private PostYService postYService;
	@Autowired
	private SequenceGenerator sequenceGenerator;

	// 帖子查询
	@RequestMapping("queryPost")
	@ResponseBody
	public String queryPost(Page page, Section section) {
//		 page.setPage(1);
//		 page.setRows(5);
		// section.setSectionId(2);
		ArrayList<Post> list = postYService.queryPost(page, section);
		JSONArray jsonArray = JSONArray.fromObject(list);
		System.out.println(jsonArray.toString());
		return jsonArray.toString();
	}
	
	// 按sectionId查询帖子总数
	@RequestMapping("queryCountBySectionId")
	@ResponseBody
	public int queryCountBySectionId(Section section){
		return postYService.queryCountBySectionId(section);
	}

	// 精品帖子查询
	@RequestMapping("queryBestPost")
	@ResponseBody
	public String queryBestPost(Page page, Section section) {
		// page.setPage(1);
		// page.setRows(5);
		// section.setSectionId(1);
		ArrayList<Post> list = postYService.queryBestPost(page, section);
		JSONArray jsonArray = JSONArray.fromObject(list);
		System.out.println(jsonArray.toString());
		return jsonArray.toString();
	}

	// 删除帖子
	@RequestMapping("deletePost")
	@ResponseBody
	public boolean deletePost(Post post) {
		// post.setPostId(222);
		try {
			if (postYService.deletePost(post)) {
				System.out.println(post.getPostId());
				System.out.println(postYService.deletePost(post));
				return true;
			} else {
				return false;
			}
		} catch (Exception e) {
			return false;
		}
	}

	// 置顶帖子
	@RequestMapping("updatePost")
	@ResponseBody
	public boolean updatePost(Post post) {
//		post.setPostId(333);
//		post.setTopPost(1);
		try {
			if (postYService.updatePost(post)) {
				return true;
			} else {
				return false;
			}
		} catch (Exception e) {
			return false;
		}
	}
	
	@RequestMapping("queryByPostId")
	@ResponseBody
	public String queryByPostId(Post post){
		post = postYService.queryByPostId(post);
		JSONArray jsonArray = JSONArray.fromObject(post);
		System.out.println(jsonArray.toString());
		return jsonArray.toString();
	}

	// 精品贴设置
	@RequestMapping("updateBestPost")
	@ResponseBody
	public boolean updateBestPost(Post post) {
//		post.setPostId(333);
//		post.setBestPost(0);
		try {
			if (postYService.updateBestPost(post)) {
				return true;
			} else {
				return false;
			}
		} catch (Exception e) {
			return false;
		}
	}
	
	//回复帖子
	@RequestMapping(value="replyPost",method=RequestMethod.POST)
//	@ResponseBody
	public String  replyPost(Post post,User user){
		

		System.out.println(post.getTopic()+" "+post.getSectionId()+" "+post.getUsername()+" "+post.getParentId());
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		System.out.println(df.format(new Date()));// new Date()为获取当前系统时间
		String postTime = df.format(new Date());
		
		post.setParentId(post.getPostId());//回复的父ID
		post.setParentUserId(post.getUserId());//回复的父帖子userId
		post.setParentUsername(post.getUsername());//回复的父帖子username
		
		post.setPostId(sequenceGenerator.nextRechargeOrderSeq());//回复ID
		post.setUserId(user.getUserId());//回复的用户ID
		post.setUsername(user.getUsername());//回复的用户名
		post.setPostTime(postTime);//发表时间
		post.setContent(post.getContent());
		post.setSectionId(2);
		post.setTopic("电脑aaa");
		post.setBestPost(0);
		post.setTopPost(0);

		
		try {
			if (postYService.replyPost(post)) {
				System.out.println("回复成功！");
				return "index";
			}else {
				System.out.println("回复失败!");
				return "App/View/Home/reply";
			}
		} catch (Exception e) {
			System.out.println("我在异常页面！");
			throw new RuntimeException(e);
		}
	}
	
	
	//发表帖子
	@RequestMapping(value="addPost",method=RequestMethod.POST)
//	@ResponseBody
	public String  addPost(Post post,User user,HttpServletRequest request){
		System.out.println(post.getSectionId());
//		String aa="";
//		System.out.println("integer:"+Integer.valueOf(aa));
		User formUser=(User)request.getSession().getAttribute("user");
		Integer userId=formUser.getUserId();
		
		post.setBestPost(0);
		post.setTopPost(0);
		
		post.setParentUsername("");
		
		
			
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		System.out.println(df.format(new Date()));// new Date()为获取当前系统时间
		String postTime = df.format(new Date());
		try {
			post.setPostId(sequenceGenerator.nextRechargeOrderSeq());//帖子ID
			post.setTopic(post.getTopic());
			post.setContent(post.getContent());
			post.setSectionId(post.getSectionId());
			System.out.println("===sectionId="+post.getSectionId());
//			System.out.println("===sectionId2="+section.getSectionId());
			post.setUserId(userId);//发表帖子的用户ID
			post.setUsername(formUser.getUsername());//发表帖子的用户名
			post.setPostTime(postTime);//发表时间
		
			if (postYService.addPost(post)) {
				System.out.println("发表帖子");
				return "index";
			}else {
				System.out.println("插入不成功！");
				return "index";
			}
		} catch (Exception e) {
			System.out.println("我是异常");
			throw new RuntimeException(e);
		}
	}
	
	//查询自己的帖子
	@RequestMapping("queryPostByUserId")
	@ResponseBody
	public String queryPostByUserId(Page page,User user){
//		 page.setPage(1);
//		 page.setRows(5);
//		 user.setUserId(2323);
		ArrayList<Post> list = postYService.queryPostByUserId(page, user);
		JSONArray jsonArray = JSONArray.fromObject(list);
		System.out.println(jsonArray.toString());
		return jsonArray.toString();
	}
	
	//查看自己的回复
	@RequestMapping("queryHufuPostByUserId")
	@ResponseBody
	public String queryHufuPostByUserId(Page page,User user){
//		 page.setPage(1);
//		 page.setRows(5);
//		 user.setUserId(1212);
		ArrayList<Post> list = postYService.queryHufuPostByUserId(page, user);
		JSONArray jsonArray = JSONArray.fromObject(list);
		System.out.println(jsonArray.toString());
		return jsonArray.toString();
	}
	
	//删除自己的回复
	@RequestMapping("deleteHufuByUserId")
	@ResponseBody
	public boolean deleteHufuByUserId(User user){
		user.setUserId(1212);
		try {
			if (postYService.deleteHufuByUserId(user)) {
				return true;
			}else {
				return false;
			}			
		} catch (Exception e) {
			return false;
		}
	}
	
	//删除自己的帖子
	@RequestMapping("deleteOwnPost")
	@ResponseBody
	public boolean deleteOwnPost(Post post){
//		post.setPostId(333);
		try {
			if (postYService.deleteOwnPost(post)) {
				return true;
			}else {
				return false;
			}
		} catch (Exception e) {
			return false;
		}
	}

}
