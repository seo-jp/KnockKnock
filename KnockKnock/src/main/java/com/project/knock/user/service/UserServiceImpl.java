package com.project.knock.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.knock.user.domain.UserKeyVO;
import com.project.knock.user.domain.UserVO;
import com.project.knock.user.mapper.UserMapper;

@Service("userService")
public class UserServiceImpl implements UserService {

	@Autowired(required = false)
	private UserMapper userMapper;

	@Override
	public int insertUser(UserVO user) {
		return this.userMapper.insertUser(user);
	}

	@Override
	public int findUserid(String user_id) {
		return this.userMapper.findUserid(user_id);
	}

	@Override
	public UserVO loginCheck(String user_id, String user_pwd) {
		UserVO user = this.userMapper.loginCheck(user_id);
		if (user != null) {
			if (user_pwd.equals(user.getUser_id())) {
				return user;
			} else {
              return null;//
			}
		}else {
			return null;
		}
	}
	
	@Override
	public String getIdwithE(String userInfo) {
		return this.userMapper.getIdwithE(userInfo);
	}
	
	@Override
	public String getIdwithT(String userInfo) {
		return this.userMapper.getIdwithT(userInfo);
	}

	@Override
	public UserKeyVO selectUserKey(int user_idx) {
		return this.userMapper.selectUserKey(user_idx);
	}
}
