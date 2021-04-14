package com.project.knock.user.domain;

import java.sql.Timestamp;

import com.project.knock.follow.domain.FollowingVO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserKeyVO {
	private int uk_idx;// 유저 키워드 번호
	private int uk_key_id;// 키워드 번호
	private String uk_user_id;// 유저 아이디
	private int uk_id;// 유저 키워드 위치 번호
	private String uk_text;
	private String uk_photo;

}
