package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import domain.Page;
import domain.Post;
import service.PostService;
import util.CommonUtils;

@Controller
@RequestMapping(value="post")
public class PostController {
	
	@Autowired
	private PostService postService;
	
	@RequestMapping(value="find")
	public String  find(HttpServletRequest request,Page page){
//	    Post formPost=CommonUtils.toBean(request.getParameterMap(), Post.class);
//	    Page formPage=CommonUtils.toBean(request.getParameterMap(), Page.class);
	  	ArrayList<Post> list=new ArrayList<Post>();
	  	page.setPage(1);
	  	page.setRows(2);
	    list=	postService.queryPostSql(page);
//	    JSONArray jsonArray=JSONArray.fromObject(list);		
	    request.setAttribute("list", list);
		return "msg";
	}
}
