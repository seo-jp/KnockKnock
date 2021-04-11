package com.project.knock.user.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.project.knock.user.domain.UserVO;

@Mapper
public interface UserMapper {
	
	int insertUser(UserVO user);

	int findUserid(String user_id);

}
