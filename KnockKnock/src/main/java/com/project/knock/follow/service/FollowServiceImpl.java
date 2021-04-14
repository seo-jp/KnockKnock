package com.project.knock.follow.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.knock.follow.mapper.FollowMapper;

@Service("followService")
public class FollowServiceImpl implements FollowService {
	
	@Autowired(required=false)
	private FollowMapper followMapper;
}
