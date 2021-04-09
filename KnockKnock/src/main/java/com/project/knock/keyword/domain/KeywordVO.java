package com.project.knock.keyword.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class KeywordVO {

	private int key_idx;
	private int key_ctg_idx;
	private String key_word;
	
}
