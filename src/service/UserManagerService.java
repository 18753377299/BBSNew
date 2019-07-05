package service;

import java.util.ArrayList;

import mapper.UserManageMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import domain.Page;
import domain.User;

@Service
public class UserManagerService {
	
	@Autowired
	private UserManageMapper userManageMapper;
	
	
	//查询用户
	public ArrayList<User> queryUser(Page page) {
		return userManageMapper.queryUser(page);
	}
	
	//修改用户
	public boolean updateUser(User user) {
		return userManageMapper.updateUser(user);
	}
	
	//删除用户
	public boolean deleteUser(User user) {
		return userManageMapper.deleteUser(user);
	}
	
	//查询用户总数
	public int queryUserCount() {
		return userManageMapper.queryUserCount();
	}
	
	//按用户ID查询
	public User queryByUserId(User user){
		return userManageMapper.queryByUserId(user);
	}

}
