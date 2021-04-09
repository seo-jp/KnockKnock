package com.project.knock.content.domain;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ContentVO {
	
	private int con_idx;
	private int con_user_idx;
	private int con_key_idx;
	private String con_text;
	private String con_video;
	private Timestamp con_create;
	
}
