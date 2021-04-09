package com.project.knock.search_record.domain;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class SearchRecordVO {
	
	private int sr_idx;
	private int sr_user_idx;
	private String sr_search;
	private Timestamp sr_create;
	
}
