package com.project.knock.user.service;

import com.project.knock.user.domain.UserVO;

public interface UserService {

	int insertUser(UserVO user);

	int findUserid(String user_id);

	UserVO loginCheck(String user_id, String user_pwd);

	String getIdwithE(String userInfo);

	String getIdwithT(String userInfo);

	int findPwd(String user_id, String user_email);

}
