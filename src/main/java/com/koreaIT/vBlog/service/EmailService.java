package com.koreaIT.vBlog.service;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.koreaIT.vBlog.util.MailHandler;
import com.koreaIT.vBlog.vo.ResultData;

@Service
public class EmailService {

	private JavaMailSender javaMailSender;
	// JavaMailSender 타입 변수 javaMailSender (전역변수)
	
	@Value("${custom.emailFrom}")
	// Value 어노테이션, 초기값 설정
	
	private String emailFrom;
	@Value("${custom.emailFromName}")
	private String emailFromName;

	public EmailService(JavaMailSender javaMailSender) {
		// EmailService() 생성자 객체
		// JavaMailSender 타입 변수 javaMailSender에 (매개변수)
		// 전달받은(import) JavaMailSender 인터페이스 객체를 저장해서 사용 
		
		this.javaMailSender = javaMailSender;
		// 변수 javaMailSender에 매개변수 javaMailSender 저장 (JavaMailSender 인터페이스와 연결)
	}
	
	public ResultData send(String to, String subject, String text) {

		MailHandler mail;
		try {
			mail = new MailHandler(javaMailSender);
			mail.setFrom(emailFrom.replaceAll(" ", ""), emailFromName);
			mail.setTo(to);
			mail.setSubject(subject);
			mail.setText(text);
			mail.send();
		} catch (Exception e) {
			e.printStackTrace();
			return ResultData.from("F-1", "메일 발송 실패하였습니다.");
		}

		return ResultData.from("S-1", "메일이 발송되었습니다.");
	}
}