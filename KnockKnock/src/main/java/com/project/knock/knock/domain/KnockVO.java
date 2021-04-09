package com.project.knock.knock.domain;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class KnockVO {

	private int knock_idx;
	private int knock_user_idx;
	private int knock_con_idx;
	private int knock_re_idx;
	private char knock_type;
	private Timestamp knock_create;
	
}
