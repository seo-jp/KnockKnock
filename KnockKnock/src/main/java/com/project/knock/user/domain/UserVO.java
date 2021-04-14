package com.project.knock.user.domain;

import java.sql.Date;

import java.sql.Timestamp;

import com.project.knock.follow.domain.FollowingVO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserVO {
	private int user_idx;
	private String user_id;
	private String user_pwd;
	private String user_name;
	private String user_tel;
	private String user_email;
	private Date user_birth;
	private String user_photo;
	private Timestamp user_create;
	private char user_mstate;

}


