package service;



import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import domain.User;
import mapper.UserMapper;

@Service
public class UserService {
	
	@Autowired
	private UserMapper userMapper;
	
//	public User login(User user) {
//		return userMapper.login(user);
//	}
	
	
	//校验输入的密码是否正确
	public boolean ajaxValidatePassword(User user){
		try {
			int count=userMapper.selectByUserIdAndPassword(user.getUserId(), user.getPassword());
			return count==0;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	//用户名是否注册校验
	public boolean ajaxValidateUsername(String username){
		try {
			int count=userMapper.ajaxValidateUsername(username);
			return  count==0;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	
	}
	//查询用户信息
	public  User find(User user){
		try {
			return userMapper.find(user);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}		
	}
	//编辑用户
	public void editMyInfo(User user,Integer userId){		
		try {
			
				userMapper.editMyInfo(user.getSex(),user.getAge(),
						user.getImage(),user.getEmail(),userId);
			
			
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	
	
	//注册功能
	public void regist(User user){
		try {
			Date date=new Date();
			SimpleDateFormat simpateDateFormat=new SimpleDateFormat("yy-MM-dd HH:mm:ss");			
		    String registTime=simpateDateFormat.format(date);
		    String  permission="0";
		    user.setRegistTime(registTime);
		    user.setPermission(permission);
			userMapper.add(user);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
		
	}
	
	//登录功能
	public User login(User user){
		try {
			return	userMapper.login(user);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}		
	}
	//修改密码
	public void updatePassword(int userId,String password,String newpass){
		try {
			 int count= userMapper.selectByUserIdAndPassword(userId,password);
			 if(count>0){
				 userMapper.updatePassword(newpass,userId);
			 }else{
				 throw new Exception("老密码错误！");
			 }	
			 
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	
	
	
	
}
