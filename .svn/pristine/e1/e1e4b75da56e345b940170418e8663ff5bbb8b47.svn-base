package service;


import java.util.ArrayList;

import mapper.PostMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import domain.Page;
import domain.Post;

@Service
public class PostService {
	@Autowired
	private PostMapper postMapper;
	
	public ArrayList<Post> queryPostSql(Page page){
	   return postMapper.queryPostSql(page);
	}
	
}
