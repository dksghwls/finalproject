package com.bitcamp.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bitcamp.DTO.MemberDTO;
import com.bitcamp.Service.MemberService;

@Controller
public class HomeController {
	
	@Inject
    PasswordEncoder passwordEncoder;
	
	@Autowired
	private MemberService service;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "templete.jsp?page=home";
	}
	
	@RequestMapping("/join")
	public String join() {
		return "templete.jsp?page=join";
	}
	
	@RequestMapping("/joinOK")
	@Transactional
	public String joinOK(MemberDTO dto) {
		
		String pwd = passwordEncoder.encode(dto.getPwd());
		dto.setPwd(pwd);
		
		service.MemberInsert(dto);
		service.MemberAuthInsert(dto.getEmail());
		
		return "templete.jsp?page=login";
	}
	
	@RequestMapping("/login")
	public String login() {
		return "templete.jsp?page=login";
	}
	
	@RequestMapping("/logout")
	public String logout() {
		return "redirect:/";
	}
	
}
