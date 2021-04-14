package com.project.knock.follow.domain;

import java.sql.Timestamp;

import com.project.knock.comment.domain.CommentVO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class FollowingVO {
	private String fl_idx;// 팔로잉 번호
	private String fl_user_id;// 유저 아이디
	private String fl_other_id;// 상대방 아이디
	private Timestamp fl_create;// 생성 날짜
}
