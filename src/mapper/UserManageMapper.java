package mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectProvider;
import org.apache.ibatis.annotations.Update;

import domain.Page;
import domain.User;

public interface UserManageMapper {
	
	//查询用户
	@SelectProvider(type = UserManageProvider.class, method = "queryUserSql")
	ArrayList<User> queryUser(Page page);
	
	//修改用户
	@Update("UPDATE B_USER SET PASSWORD = #{password}, PERMISSION = #{permission} WHERE USERID = #{userId}")
	boolean updateUser(User user);
	
	//删除用户
	@Delete("DELETE FROM B_USER WHERE USERID = #{userId}")
	boolean deleteUser(User user);
	
	//查询用户总数
	@Select("SELECT COUNT(*) FROM B_USER")
	int queryUserCount();
	
	//按用户ID查询用户
	@Select("SELECT * FROM B_USER WHERE USERID = #{userId}")
	User queryByUserId(User user);
}
