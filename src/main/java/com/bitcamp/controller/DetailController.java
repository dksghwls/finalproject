package com.bitcamp.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bitcamp.DTO.ProductDTO;
import com.bitcamp.DTO.ReplyDTO;
import com.bitcamp.DTO.imgDTO;
import com.bitcamp.Service.DetailService;

@Controller
public class DetailController {
  
	@Resource
	private DetailService service;
	
	
	@RequestMapping("/detail/{pno}")
	public String Detail(@PathVariable int pno,Model model,@RequestParam(required=false) String rcontent,@RequestParam(required=false, defaultValue="0") int no)
	{
		System.out.println(pno);
		
		if(rcontent!=null)
		{
			service.replyinsert2(no, pno, rcontent);
		}
		
		
		List<ProductDTO> dto = service.detaillist(pno);
	
		imgDTO img = service.getimage(pno);
	    List<ReplyDTO> replylist = service.replylist(pno);
		
	    model.addAttribute("replylist", replylist);
	    
	    
	    
		model.addAttribute("dto", dto);
		model.addAttribute("img",img);
		
		
		
		
		return "templete.jsp?page=detail";
		
	}
	@RequestMapping("/replydelete2/{rno}")
	public String replydelete(@PathVariable int rno, @RequestParam int pno){
		int result = service.replydelete2(rno);
		
		System.out.println("´ñ±Û¹øÈ£"+rno);
		return "redirect:/detail/"+pno;
		
	}
	
	
	
	
	
	
	
	
	
}
