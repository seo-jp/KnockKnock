package com.project.knock.tag.domain;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class TagVO {

	private int tag_idx;
	private int tag_con_idx;
	private int tag_user_idx;
	private String tag_name;
	private Timestamp tag_create;
	
}
