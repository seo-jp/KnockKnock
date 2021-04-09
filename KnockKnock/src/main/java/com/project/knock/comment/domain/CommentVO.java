package com.project.knock.comment.domain;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CommentVO {

	private int re_idx;
	private int re_con_idx;
	private int re_user_idx;
	private Timestamp re_create;
	private String re_text;
}
