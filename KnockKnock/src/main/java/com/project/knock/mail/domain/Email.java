package com.project.knock.mail.domain;

import lombok.Data;

@Data
public class Email {
	
	private String subject;
	private String content;
	private String receiver;

}
