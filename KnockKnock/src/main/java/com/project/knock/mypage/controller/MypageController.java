package com.project.knock.mypage.controller;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.knock.common.util.CommonUtil;
import com.project.knock.mypage.service.MypageService;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	
	@Resource(name="mypageService")
	private MypageService mypageService;

	@Autowired
	private CommonUtil util; 
}
