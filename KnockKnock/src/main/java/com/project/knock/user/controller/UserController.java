package com.project.knock.user.controller;

import java.util.Random;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.knock.common.util.CommonUtil;
import com.project.knock.mail.domain.Email;
import com.project.knock.mail.service.EmailSender;
import com.project.knock.user.domain.UserVO;
import com.project.knock.user.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Resource(name="userService")
	private UserService userService;
	
	@Inject
	BCryptPasswordEncoder pwdEncoder;
	
	@Autowired
	private EmailSender emailSender;

	@Autowired
	private CommonUtil util; 

    @GetMapping("/main") //test
    public String joinForm(Model m) {
    	
    	return "user_test";
    }
    
    
    @PostMapping(value="/join", produces="application/json")
    public ResponseEntity<Integer> joinUser(@ModelAttribute("user") UserVO user) throws Exception{
    	
    	String originPwd = user.getUser_pwd();
    	String user_pwd = pwdEncoder.encode(originPwd);
    	user.setUser_pwd(user_pwd); 

    	int result = this.userService.insertUser(user); 
    	
    	if(result==0) {
    		return new ResponseEntity<Integer>(HttpStatus.NO_CONTENT);
    	}
    	
    	return new ResponseEntity<Integer>(result,HttpStatus.OK);
    }
    

    @PostMapping(value="/checkId", produces="application/json")
    public ResponseEntity<Integer> checkUserid(Model model,
    		               @RequestParam(value="user_id", required =false)String user_id) throws Exception{
    	
    	int result = this.userService.findUserid(user_id);
    	if(result==1) {
    		return new ResponseEntity<Integer>(HttpStatus.NO_CONTENT);
    	}
    	
    	return new ResponseEntity<Integer>(result,HttpStatus.OK);
    }
    
    
    @PostMapping(value="/login", produces="application/json")
    public ResponseEntity<String> loginUser(HttpSession ses,
    		             @RequestParam(value="user_id", required =false)String user_id,
    		             @RequestParam(value="user_pwd", required =false)String user_pwd) throws Exception{
    	
    	if(user_id==null||user_id.trim().isEmpty()||user_pwd==null||user_pwd.trim().isEmpty()) {
    		return new ResponseEntity<String>(HttpStatus.NO_CONTENT);
    	}else {
    		String result ="";
    		UserVO user = this.userService.loginCheck(user_id,user_pwd);
    		if(user==null) {
    			result = "{\"msg\": \"아이디 및 비밀번호가 일치하지 않습니다.\"}";	
    		}else{
    			ses.setAttribute("loginUser",user);
    			result = "{\"msg\": null}";		
    		} 
    		return new ResponseEntity<String>(result,HttpStatus.OK);
    	}	
    }
    
    @GetMapping(value="/findId", produces="application/json")
    public ResponseEntity<String> findUserid(
    		  @RequestParam(value="userInfo", required =false)String userInfo){
    	
    	if(!userInfo.contains("@")&&!userInfo.contains("-")) {
    		return new ResponseEntity<String>(HttpStatus.NO_CONTENT);
    	}
    	
    	String data ="";
    	String result ="";
        if(userInfo.contains("@")) {//이메일이라묜
        	System.out.println("data="+userInfo);
        	data= this.userService.getIdwithE(userInfo);
        	
        }else if(userInfo.contains("-")){
        	data= this.userService.getIdwithT(userInfo);
        }
        if (data==null) {
        	result = "{\"msg\": \"해당 연락처의 아이디가 없습니다.\"}";	
        }else {
        	result = "{\"msg\": \""+ data +"\"}";
        }
    	return new ResponseEntity<String>(result,HttpStatus.OK);
    	
    }

    
    @PostMapping(value="/mail", produces="application/json")
    public ResponseEntity<Integer> findPwd (
    		@RequestParam(value="user_id", required =false)String user_id,
    		@RequestParam(value="user_email", required =false)String user_email) throws Exception {    	
    	int result=0;
    	
    	if(user_id==null||user_id.trim().isEmpty()||user_email==null||user_email.trim().isEmpty()) {
    		return new ResponseEntity<Integer>(HttpStatus.NO_CONTENT);
    	}else {
    		result = this.userService.findPwd(user_id,user_email);
    		if(result==1) {
    			Email email = new Email();
    			
    			StringBuffer temp = new StringBuffer();
    			Random r = new Random();
    			for(int i=0;i<=8;i++) {
    				int rIndex = r.nextInt(2);
    				if(rIndex==0) {
    					temp.append((char)((int)(r.nextInt(26))+97));
    				}else {
    					temp.append((r.nextInt(10)));
    				}
    			}
    			
    			email.setReceiver(user_email);
    			email.setContent("새로운 비밀번호는 "+temp+"입니다.");
    			email.setSubject("새로운 비밀번호를 보내드립니다.");
    			
    			emailSender.SendEmail(email);
    		}    		
    	}

    	return new ResponseEntity<Integer>(result,HttpStatus.OK);
    }
    
    

}
