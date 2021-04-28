package com.project.knock.user.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.project.knock.user.domain.UserVO;

@Mapper
public interface UserMapper {
	
	int insertUser(UserVO user);

	int findUserid(String user_id);

	String getIdwithE(String userInfo);

	String getIdwithT(String userInfo);

	UserVO selectId(String user_id);

}
