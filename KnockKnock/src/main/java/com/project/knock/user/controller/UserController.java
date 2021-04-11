package com.project.knock.user.controller;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.knock.common.util.CommonUtil;
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
	private CommonUtil util; 

    @GetMapping("/joinF") //test�슜 �굹以묒뿉 吏��슱爰�
    public String joinForm(Model m) {
    	
    	return "user_test";
    }
    
    @ResponseBody
    @PostMapping(value="/join", produces="application/json")
    public int joinUser(@ModelAttribute("user") UserVO user){
    	
    	String originPwd = user.getUser_pwd();
    	String user_pwd = pwdEncoder.encode(originPwd);
    	user.setUser_pwd(user_pwd);
    	
    	System.out.println("user="+user);

    	int result = this.userService.insertUser(user);
    	
    	System.out.println("result="+result);
    	return result;
    }
    
    @CrossOrigin("*")
    @RequestMapping(value="/idCheck", produces="application/json")
    public int checkUserid(@RequestParam(value="user_id", required =false)String user_id){
    	
    	int result = this.userService.findUserid(user_id);
    	
    	return result;
    }

}
