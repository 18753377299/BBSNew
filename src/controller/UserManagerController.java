package controller;

import java.util.ArrayList;

import net.sf.json.JSONArray;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import domain.Page;
import domain.User;
import service.UserManagerService;

@Controller
@RequestMapping("/bbsUser/")
public class UserManagerController {
	
	@Autowired 
	private UserManagerService userManagerService;
	
	
	//查询用户
	@RequestMapping("queryUser")
	@ResponseBody
	public String queryUser(Page page) {
//		page.setPage(1);
//		page.setRows(2);
		ArrayList<User> list = userManagerService.queryUser(page);
		JSONArray jsonArray = JSONArray.fromObject(list);
		return jsonArray.toString();
	}
	//修改用户
	@RequestMapping("updateUser")
	@ResponseBody
	public boolean updateUser(User user) {
		try {
//			user.setUserId(2);
//			user.setPassword("11111111");
//			user.setPermission("0");
			if (userManagerService.updateUser(user)) {
				return true;
			}else {
				return false;
			}
		} catch (Exception e) {
			return false;
		}
	}
	//删除用户
	@RequestMapping("deleteUser")
	@ResponseBody
	public boolean deleteUser(User user) {
		try {
//			user.setUserId(0);
			if (userManagerService.deleteUser(user)) {
				return true;
			}else {
				return false;
			}
		} catch (Exception e) {
			return false;
		}
	}
	
	//查询用户总数
	@RequestMapping("queryUserCount")
	@ResponseBody
	public int queryUserCount(){
		return userManagerService.queryUserCount();
	}
	
	//按用户ID查询
	@RequestMapping("queryByUserId")
	@ResponseBody
	public String queryByUserId(User user){
		user = userManagerService.queryByUserId(user);
		JSONArray jsonArray = JSONArray.fromObject(user);
		System.out.println("++++++++++++++++++"+jsonArray.toString());
		return jsonArray.toString();
	}

}
