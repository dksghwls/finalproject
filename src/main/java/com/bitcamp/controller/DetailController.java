package com.bitcamp.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bitcamp.DTO.CategoryDTO;
import com.bitcamp.DTO.ProductDTO;
import com.bitcamp.DTO.ReplyDTO;
import com.bitcamp.DTO.imgDTO;
import com.bitcamp.Service.DetailService;

@Controller
public class DetailController {
  
	@Resource
	private DetailService service;
	
	
	@RequestMapping("/detail/{pno}")
	public String Detail(@PathVariable int pno,Model model,@RequestParam(required=false, defaultValue="0") int rno,@RequestParam(required=false) String rcontent,@RequestParam(required=false) String modifycontent,@RequestParam(required=false, defaultValue="0") int no)
	{
		
		if(rcontent!=null)
		{
			service.replyinsert2(no, pno, rcontent);
		}
		
		if(modifycontent!=null)
		{
			service.replymodify(rno, modifycontent);
		}
		
		
		
		List<ProductDTO> dto = service.detaillist(pno);
		
		 SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy-MM-dd");
		    Date time = new Date();
		    String start = format1.format(time);
		    String end = dto.get(0).getDeadline();

		    // 두날짜의 차이 구하기   
		    try {
		        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		        Date beginDate = formatter.parse(start);
		        Date endDate = formatter.parse(end);

		        long diff = endDate.getTime() - beginDate.getTime();
		        long diffDays = diff / (24 * 60 * 60 * 1000);

		        
		        
		        model.addAttribute("deadline", diffDays);
		        
		    } catch (Exception e) {
		        e.printStackTrace();
		    }
		
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
		
		System.out.println("댓글번호"+rno);
		return "redirect:/detail/"+pno;
		
	}
	@RequestMapping("/replydetail2/{rno}")
	public String replydetail(@PathVariable int rno, Model model) {
		
		
		ReplyDTO dto = service.replydetail2(rno);
		model.addAttribute("dto",dto);
		
		
		return "templete.jsp?page=replydetail";
		
		
	}
	
	
	
	@RequestMapping("/replyupdate2/{rno}")
	public String replyupdate(@PathVariable int rno, Model model) {
		
		ReplyDTO dto = service.replydetail2(rno);
		model.addAttribute("dto", dto);
	
		return "templete.jsp?page=replyupdate";
	}
	
	
}
