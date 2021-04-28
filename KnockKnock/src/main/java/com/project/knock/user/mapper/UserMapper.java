package com.project.knock.user.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.project.knock.user.domain.UserKeyVO;
import com.project.knock.user.domain.UserVO;

@Mapper
public interface UserMapper {
	
	int insertUser(UserVO user);

	int findUserid(String user_id);

	String getIdwithE(String userInfo);

	String getIdwithT(String userInfo);

<<<<<<< HEAD
	UserVO selectId(String user_id);
=======
	UserKeyVO selectUserKey(int user_idx);
>>>>>>> mijin0414

}
