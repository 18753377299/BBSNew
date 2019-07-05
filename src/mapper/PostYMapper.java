package mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectProvider;
import org.apache.ibatis.annotations.Update;

import domain.Page;
import domain.Post;
import domain.Section;
import domain.User;

public interface PostYMapper {
	
	//帖子查询
	@SelectProvider(type = PostYProvider.class, method = "queryPostSql")
	ArrayList<Post> queryPost(Page page,Section section);
	
	//精品帖子查询
	@SelectProvider(type = PostYProvider.class, method = "queryBestPostSql")
	ArrayList<Post> queryBestPost(Page page,Section section);
	
	//删除帖子
	@Delete("DELETE FROM B_POST WHERE POSTID = #{postId} OR PARENTID = #{postId}")
	boolean deletePost(Post post);
	
	//置顶帖子
	@Update("UPDATE B_POST SET TOPPOST = #{topPost},BESTPOST = #{bestPost} WHERE POSTID = #{postId}")
	boolean updatePost(Post post);
	
	//精品贴设置
	@Update("UPDATE B_POST SET BESTPOST = #{bestPost} WHERE POSTID = #{postId}")
	boolean updateBestPost(Post post);
	
	//发表帖子
	@Insert("INSERT INTO B_POST (POSTID,TOPIC,CONTENT,POSTTIME,BESTPOST,TOPPOST,SECTIONID,USERID,USERNAME) VALUES(#{postId},#{topic},#{content},#{postTime},#{bestPost},#{topPost},#{sectionId},#{userId},#{username})")
	boolean addPost(Post post);
	//回复帖子
	@Insert("INSERT INTO B_POST (POSTID,TOPIC,CONTENT,POSTTIME,PARENTID,BESTPOST,TOPPOST,SECTIONID,USERID,USERNAME,PARENTUSERID,PARENTUSERNAME) VALUES(#{postId},#{topic},#{content},#{postTime},#{parentId},#{bestPost},#{topPost},#{sectionId},#{userId},#{username},#{parentUserId},#{parentUsername})")
	boolean replyPost(Post post);
	
	//查询自己的帖子
	@SelectProvider(type = PostYProvider.class, method = "queryByUserIdSql")
	ArrayList<Post> queryPostByUserId(Page page,User user);
	
	//查看自己的回复
	@SelectProvider(type = PostYProvider.class, method = "queryHufuPostByUserId")
	ArrayList<Post> queryHufuPostByUserId(Page page,User user);
	
	//删除自己的回复
	@Delete("DELETE FROM B_POST WHERE PARENTID IS NOT NULL AND USERID = #{userId}")
	boolean deleteHufuByUserId(User user);
	
	//删除自己的帖子
	@Delete("DELETE FROM B_POST WHERE POSTID = #{postId} OR PARENTID = #{postId}")
	boolean deleteOwnPost(Post post);
	
	//查询帖子总数By版块ID
	@SelectProvider(type = PostYProvider.class, method = "queryCountBySectionIdsql")
	int queryCountBySectionId(Section section);
	
	//查询帖子By帖子ID
	@Select("SELECT * FROM B_POST WHERE POSTID = #{postId}")
	Post queryByPostId(Post post);
	

}
