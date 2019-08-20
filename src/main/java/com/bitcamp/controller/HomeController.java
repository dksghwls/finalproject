package com.bitcamp.controller;

import java.security.Principal;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitcamp.DTO.MemberDTO;
import com.bitcamp.Service.MemberService;

@Controller
public class HomeController {
	
	@Autowired
    PasswordEncoder passwordEncoder;
	
	@Autowired
	private MemberService service;
	
	@RequestMapping(value = "/")
	public String home(HttpSession session) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
	    String email = authentication.getName();
	    System.out.println(email == null);
	    if(email != "anonymousUser") {
	    	MemberDTO user = service.getMember(email);
		    session.setAttribute("user", user);
	    }
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
	
	@RequestMapping("/userCheck")
	@ResponseBody
	public String userCheck(String email) {
		System.out.println(email);
		MemberDTO user = service.getMember(email);
		String result = null;
		if(user != null) {
			result = "1";
		}
		return result;
	}
	
}
