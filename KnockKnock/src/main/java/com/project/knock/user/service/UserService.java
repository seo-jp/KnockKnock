package com.project.knock.user.service;

import com.project.knock.user.domain.UserVO;

public interface UserService {

	int insertUser(UserVO user);

	int findUserid(String user_id);

}
