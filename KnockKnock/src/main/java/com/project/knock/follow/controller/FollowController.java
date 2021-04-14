package com.project.knock.follow.controller;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.knock.common.util.CommonUtil;
import com.project.knock.follow.service.FollowService;

@Controller
@RequestMapping("/follow")
public class FollowController {
	
	@Resource(name="followService")
	private FollowService followService;

	@Autowired
	private CommonUtil util; 

}
