package com.project.knock.content.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping; 
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.project.knock.content.service.ContentService;
import com.project.knock.user.domain.UserKeyVO;
import com.project.knock.user.domain.UserVO;
import com.project.knock.user.service.UserService;

@RestController
@RequestMapping("/content")
public class ContentController {
	
	@Inject
	private ContentService contentService;
	
	@Inject
	private UserService userService;
	
	//게시글 작성 페이지
	@GetMapping(value="/write", produces="application/json")
	public ResponseEntity writecontent(Model model, HttpSession session) throws Exception{
		//UserVO loginUser=(UserVO) session.getAttribute("loinUser");
		UserVO loginUser=new UserVO();
		loginUser.setUser_idx(1);
		UserKeyVO uKey=this.userService.selectUserKey(loginUser.getUser_idx());		
		return new ResponseEntity(uKey, HttpStatus.OK);
	}
	
	//게시글 틍록처리
	@PostMapping(value="/insert")
	public ResponseEntity insertBoard() throws Exception{
		
		return new ResponseEntity(HttpStatus.OK);
	}
	
	
	
//	@GetMapping(value="/user/{userid}")
//	public ResponseEntity myFeed(@PathVariable String userid) throws Exception{	
//		return new ResponseEntity(HttpStatus.OK);
//	}
	
	//myfeed (otherfeed)
	@GetMapping(value="/user", produces="application/json")
	public ResponseEntity myFeed()
			throws Exception{
		//user, content, comment, tag, userkey, knock(content,comment), following, follower, messgage
		
		return new ResponseEntity(HttpStatus.OK);
	}
	
}
