package com.bitcamp.controller;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bitcamp.Service.MemberService;

import org.springframework.security.crypto.password.PasswordEncoder;
 
@Controller
public class MailController {
	
	@Autowired
    PasswordEncoder passwordEncoder;
	
	@Autowired
	private MemberService service;

	@Autowired
	private JavaMailSender mailSender;

	// mailForm
	@RequestMapping("/mailForm")
	public String mailForm() {
		return "templete.jsp?page=mailForm";
	}  
 
	// mailSending 코드
	@RequestMapping("/mailSending")
	public String mailSending(HttpServletRequest request) {
		
		String  pswd = "";
		StringBuffer sb = new StringBuffer();
		StringBuffer sc = new StringBuffer("!@#$%^&*-=?~");  // 특수문자 모음, {}[] 같은 비호감문자는 뺌

		// 대문자 4개를 임의 발생 
		sb.append((char)((Math.random() * 26)+65));  // 첫글자는 대문자, 첫글자부터 특수문자 나오면 안 이쁨

		for( int i = 0; i<3; i++) {
		   sb.append((char)((Math.random() * 26)+65));  // 아스키번호 65(A) 부터 26글자 중에서 택일
		} 

		// 소문자 4개를 임의발생
		for( int i = 0; i<4; i++) {
		    sb.append((char)((Math.random() * 26)+97)); // 아스키번호 97(a) 부터 26글자 중에서 택일
		}  

		// 숫자 2개를 임의 발생
		for( int i = 0; i<2; i++) {
		    sb.append((char)((Math.random() * 10)+48)); //아스키번호 48(1) 부터 10글자 중에서 택일
		}

		// 특수문자를 두개  발생시켜 랜덤하게 중간에 끼워 넣는다 
		sb.setCharAt(((int)(Math.random()*3)+1), sc.charAt((int)(Math.random()*sc.length()-1))); //대문자3개중 하나   
		sb.setCharAt(((int)(Math.random()*4)+4), sc.charAt((int)(Math.random()*sc.length()-1))); //소문자4개중 하나

		pswd = sb.toString();
		System.out.println("passwd = "+ pswd );
		
		String setfrom = "TestBitcamp@gmail.com";         
		String email  = request.getParameter("tomail");     // 받는 사람 이메일
		String pwd = passwordEncoder.encode(pswd);
		
		service.pwdChange(email, pwd);
   
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
 
			messageHelper.setFrom(setfrom);  // 보내는사람 생략하거나 하면 정상작동을 안함
			messageHelper.setTo(email);     // 받는사람 이메일
			messageHelper.setSubject("임시비밀번호입니다."); // 메일제목은 생략이 가능하다
			messageHelper.setText("임시비밀번호: " + pswd);  // 메일 내용
     
			mailSender.send(message);
		} catch(Exception e){
			System.out.println(e);
		}
   
		return "redirect:/login";
	}

} 

