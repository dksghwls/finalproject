package com.bitcamp.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bitcamp.DTO.ReplyDTO;
import com.bitcamp.Service.ReplyService;

@Controller
public class ReplyController {
    @Autowired
	private ReplyService replyservice;
	
	@RequestMapping("/reply")
	public String Reply()
	{
	return "templete.jsp?page=detail";
}
	@RequestMapping("/replylist")
	public String replylist(Model model)
	{
		List<ReplyDTO> list = replyservice.replylist();
		model.addAttribute("rlist",list);
		
		return "/replylist";
		
		 
	}
	@RequestMapping("/replyinsert")
	public String replyinsert(ReplyDTO dto )
	{
		  return "templete.jsp?page=replyinsert";
		
	}
	@RequestMapping("/replyinsertresult")
	public String replyinsertresult(ReplyDTO dto, Model model)
	{
		int result = replyservice.replyinsert(dto);
	    model.addAttribute("dto", dto);	
	    System.out.println("°ªÈ®ÀÎ"+dto.getRcontent());
		return "/replydetail";
		
		
	}
	@RequestMapping("/replydetail/{no}")
	public String replydetail(@PathVariable int no, Model model, @RequestParam(required=false, defaultValue="1")String rcontent)
	{
		ReplyDTO dto = replyservice.replydetail(no);
		model.addAttribute("dto", dto);
		return "templete.jsp?page=replydetail";
		
	}
	@RequestMapping("/replydelete/{no}")
	public String replydelete(@PathVariable int no, Model model) 
	{
		int result = replyservice.replydelete(no);
		return "redirect:/replylist";
		
	}
	@RequestMapping("/replymodify/{no}")
	public String replymodify(@PathVariable int no, Model model)
	{
		ReplyDTO dto = replyservice.replydetail(no);
		model.addAttribute("dto", dto);
		
		return "templete.jsp?page=replymodify";
		
		
	}
	@RequestMapping("/replymodifyok")
	public String replymodiok(ReplyDTO dto)
	{
		int result = replyservice.replymodifyresult(dto);
		
		return "redirect:/replylist";
		
		
	}
	
	
}
