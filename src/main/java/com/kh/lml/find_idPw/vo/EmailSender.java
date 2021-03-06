package com.kh.lml.find_idPw.vo;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;

	public class EmailSender  {
	     
	    @Autowired
	    protected JavaMailSender  mailSender;
	 
	    public void SendEmail(Email email) throws Exception {
	         
	        MimeMessage msg = mailSender.createMimeMessage();
	        try {
	        	msg.setSubject(email.getSubject());
		        msg.setText(email.getContent());
		        msg.setRecipients(MimeMessage.RecipientType.TO , InternetAddress.parse(email.getReciver()));
		        
	        }catch(MessagingException e) {
	        	System.out.println("MessagingException발생-EmailSender확인");
	        	e.printStackTrace();
	        }
	        try {
	        	mailSender.send(msg);
	        }catch(MailException e) {
	        	System.out.println("MailException발생-EmailSender확인");
	        	e.printStackTrace();
	        }
	    }
}

