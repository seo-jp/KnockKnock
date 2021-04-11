package com.project.knock.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.knock.user.domain.UserVO;
import com.project.knock.user.mapper.UserMapper;

@Service("userService")
public class UserServiceImpl implements UserService {
	
	@Autowired(required=false)
	private UserMapper userMapper;
	
	@Override
	public int insertUser(UserVO user) {
		return this.userMapper.insertUser(user);
	}
	
	@Override
	public int findUserid(String user_id) {
		return this.userMapper.findUserid(user_id);	
	}

}
