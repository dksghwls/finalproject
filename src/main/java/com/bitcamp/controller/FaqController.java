package com.bitcamp.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.annotation.RequestScope;

import com.bitcamp.DTO.FaqDTO;
import com.bitcamp.DTO.MakePage;
import com.bitcamp.Service.FaqService;

@Controller
public class FaqController {

	@Autowired
	private FaqService faqservice;

	@RequestMapping(value = "/helpcenter")
	public String helpcenter() {

		return "templete.jsp?page=helpcenter";
	}

	@RequestMapping("/faq")
	public String faqlist(@RequestParam(required = false, defaultValue = "1") int currPage
						,@RequestParam(required=false, defaultValue="")String search
						,@RequestParam(required=false, defaultValue="")String keyword,
						Model model) {
		
		System.out.println(keyword);
		
		int totalCount = faqservice.faqcount(search, keyword);
		System.out.println("totalCount: " + totalCount);

		int pageSize = 5;
		int blockSize = 5;

		MakePage page = new MakePage(currPage, totalCount, pageSize, blockSize);

		List<FaqDTO> list = faqservice.faqlist(search, keyword, page.getStartRow(), page.getEndRow());
		model.addAttribute("list", list);
		model.addAttribute("page", page);
		model.addAttribute("search",search);
		model.addAttribute("keyword",keyword);
		System.out.println("pagetest: " + page);

		List<FaqDTO> shiplist = faqservice.shiplist(page.getStartRow(), page.getEndRow());
		model.addAttribute("shiplist", shiplist);
		System.out.println("shiptest: " + shiplist);
		model.addAttribute("page", page);
		System.out.println("pagetest2: " + page);

		List<FaqDTO> orderlist = faqservice.orderlist(page.getStartRow(), page.getEndRow());
		model.addAttribute("orderlist", orderlist);
		System.out.println("ordertest: " + orderlist);
		model.addAttribute("page", page);
		System.out.println("pagetest3: " + page);

		List<FaqDTO> cuslist = faqservice.cuslist(page.getStartRow(), page.getEndRow());
		model.addAttribute("cuslist", cuslist);
		System.out.println("custest: " + cuslist);
		model.addAttribute("page", page);
		System.out.println("pagetest4: " + page);

		return "templete.jsp?page=faqlist";

	}

	@RequestMapping("/faqinsert")
	public String faqinsert(FaqDTO dto) {

		return "templete.jsp?page=faqinsertform";
	}

	@RequestMapping("/faqinsertok")
	public String faqinsertok(FaqDTO dto) {

		int result = faqservice.faqinsert(dto);
		System.out.println("resulttest: " + result);
		return "redirect:faq";
	}

	@RequestMapping("/faqdetail/{no}")
	public String faqdetail(@PathVariable int no, Model model) {

		FaqDTO dto = faqservice.faqdetail(no);
		model.addAttribute("dto", dto);
		return "templete.jsp?page=faqdetail";
	}

	@RequestMapping("/faqdelete/{no}")
	public String faqdelete(@PathVariable int no) {
		int result = faqservice.faqdelete(no);
		return "redirect:/faq";
	}
	
	@RequestMapping("/faqmodify/{no}")
	public String faqmodify(@PathVariable int no, Model model) {
		FaqDTO dto = faqservice.faqdetail(no);
		model.addAttribute("dto",dto);
		
		return "templete.jsp?page=faqmodify";
	}
	
	@RequestMapping("/faqmodifyok")
	public String faqmodifyok(FaqDTO dto) {
		int result = faqservice.faqmodifyok(dto);
		
		return "redirect:/faq";
	}
	
}
