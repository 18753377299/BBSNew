package service;

import java.util.ArrayList;

import mapper.PostYMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import domain.Page;
import domain.Post;
import domain.Section;
import domain.User;

@Service
public class PostYService {

	@Autowired
	private PostYMapper postYMapper;

	//帖子查询
	public ArrayList<Post> queryPost(Page page, Section section) {
		return postYMapper.queryPost(page, section);
	}

	//精品帖子查询
	public ArrayList<Post> queryBestPost(Page page, Section section) {
		return postYMapper.queryBestPost(page, section);
	}

	//删除帖子
	public boolean deletePost(Post post) {
		return postYMapper.deletePost(post);
	}

	//置顶帖子
	public boolean updatePost(Post post) {
		return postYMapper.updatePost(post);
	}

	//精品贴设置
	public boolean updateBestPost(Post post) {
		return postYMapper.updateBestPost(post);
	}

	//发表帖子
	public boolean addPost(Post post) {
		return postYMapper.addPost(post);
	}
	
	//回复帖子
	public boolean replyPost(Post post) {
		return postYMapper.replyPost(post);
	}

	//查询自己的帖子
	public ArrayList<Post> queryPostByUserId(Page page, User user) {
		return postYMapper.queryPostByUserId(page, user);
	}

	//查看自己的回复
	public ArrayList<Post> queryHufuPostByUserId(Page page, User user) {
		return postYMapper.queryHufuPostByUserId(page, user);
	}

	//删除自己的回复
	public boolean deleteHufuByUserId(User user) {
		return postYMapper.deleteHufuByUserId(user);
	}

	//删除自己的帖子
	public boolean deleteOwnPost(Post post) {
		return postYMapper.deleteOwnPost(post);
	}
	
	//按sectionId查询帖子总数
	public int queryCountBySectionId(Section section) {
		return postYMapper.queryCountBySectionId(section);
	}
	
	//按帖子Id查询帖子
	public Post queryByPostId(Post post) {
		return postYMapper.queryByPostId(post);
	}

}
