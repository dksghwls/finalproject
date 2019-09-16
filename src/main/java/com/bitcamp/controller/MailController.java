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
 
	// mailSending �ڵ�
	@RequestMapping("/mailSending")
	public String mailSending(HttpServletRequest request) {
		
		String  pswd = "";
		StringBuffer sb = new StringBuffer();
		StringBuffer sc = new StringBuffer("!@#$%^&*-=?~");  // Ư������ ����, {}[] ���� ��ȣ�����ڴ� ��

		// �빮�� 4���� ���� �߻� 
		sb.append((char)((Math.random() * 26)+65));  // ù���ڴ� �빮��, ù���ں��� Ư������ ������ �� �̻�

		for( int i = 0; i<3; i++) {
		   sb.append((char)((Math.random() * 26)+65));  // �ƽ�Ű��ȣ 65(A) ���� 26���� �߿��� ����
		} 

		// �ҹ��� 4���� ���ǹ߻�
		for( int i = 0; i<4; i++) {
		    sb.append((char)((Math.random() * 26)+97)); // �ƽ�Ű��ȣ 97(a) ���� 26���� �߿��� ����
		}  

		// ���� 2���� ���� �߻�
		for( int i = 0; i<2; i++) {
		    sb.append((char)((Math.random() * 10)+48)); //�ƽ�Ű��ȣ 48(1) ���� 10���� �߿��� ����
		}

		// Ư�����ڸ� �ΰ�  �߻����� �����ϰ� �߰��� ���� �ִ´� 
		sb.setCharAt(((int)(Math.random()*3)+1), sc.charAt((int)(Math.random()*sc.length()-1))); //�빮��3���� �ϳ�   
		sb.setCharAt(((int)(Math.random()*4)+4), sc.charAt((int)(Math.random()*sc.length()-1))); //�ҹ���4���� �ϳ�

		pswd = sb.toString();
		System.out.println("passwd = "+ pswd );
		
		String setfrom = "TestBitcamp@gmail.com";         
		String email  = request.getParameter("tomail");     // �޴� ��� �̸���
		String pwd = passwordEncoder.encode(pswd);
		
		service.pwdChange(email, pwd);
   
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
 
			messageHelper.setFrom(setfrom);  // �����»�� �����ϰų� �ϸ� �����۵��� ����
			messageHelper.setTo(email);     // �޴»�� �̸���
			messageHelper.setSubject("�ӽú�й�ȣ�Դϴ�."); // ���������� ������ �����ϴ�
			messageHelper.setText("�ӽú�й�ȣ: " + pswd);  // ���� ����
     
			mailSender.send(message);
		} catch(Exception e){
			System.out.println(e);
		}
   
		return "redirect:/login";
	}

} 

