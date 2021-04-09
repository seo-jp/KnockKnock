package com.project.knock.keyword_record.domain;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class KeywordRecordVO {
	
	private int kr_idx;
	private int kr_key_idx;
	private int kr_con_idx;
	private int kr_user_idx;
	private Timestamp kr_create;
	
}
