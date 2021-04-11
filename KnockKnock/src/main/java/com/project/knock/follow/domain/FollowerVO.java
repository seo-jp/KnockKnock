package com.project.knock.follow.domain;

import java.sql.Timestamp;

import com.project.knock.comment.domain.CommentVO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class FollowerVO {
	private String fe_idx;// 팔로워 번호
	private String fe_user_id;// 유저 아이디
	private String fe_other_id;// 상대방 아이디
	private Timestamp fe_create;// 생성 날짜

}
