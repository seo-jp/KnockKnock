package com.project.knock.mail.service;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.project.knock.mail.domain.Email;

@Service
public class EmailSender {
	
	@Autowired
	protected JavaMailSender mailSender;
	
	public void SendEmail(Email email) throws Exception{
		
		MimeMessage msg = mailSender.createMimeMessage();
		try {		
			msg.setSubject(email.getSubject());
			msg.setText(email.getContent());
			msg.setRecipients(MimeMessage.RecipientType.TO, InternetAddress.parse(email.getReceiver()));
		}catch(MessagingException e) {
			System.out.println("MessagingException");
			e.printStackTrace();
		}
		
		try {
			mailSender.send(msg);
		}catch(MailException e) {
			System.out.println("Messaging ¹ß»ý");
			e.printStackTrace();
		}
	}

}
