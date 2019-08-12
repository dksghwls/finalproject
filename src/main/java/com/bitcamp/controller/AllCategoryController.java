package com.bitcamp.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bitcamp.DTO.CategoryDTO;
import com.bitcamp.DTO.MakePage;
import com.bitcamp.Service.CategoryService;

@Controller
public class AllCategoryController {

	@Resource
	private CategoryService service;
	
	
	@RequestMapping(value = "/AllCategory")
	public String category(Model model)
	{
		
		List<CategoryDTO> clist = service.AllList();
		
		model.addAttribute("list", clist);
		
		List<CategoryDTO> plist = service.pList();
		
		model.addAttribute("dto", plist );
		
		return "templete.jsp?page=AllCategory";
	}
	

	
	@RequestMapping("/AllCategory/{cno}")
	public String Cdetail(@PathVariable int cno, Model model)
	{
		List<CategoryDTO> calist = service.allList();
		
		model.addAttribute("list", calist);
		
		List<CategoryDTO> pclist = service.cpList(cno);
		
		model.addAttribute("dto", pclist );
		
		return "templete.jsp?page=AllCategory";
		
	}
	
	@RequestMapping(value="/adminproduct")
	public String list(@RequestParam(required=false, defaultValue="1") int currPage
						,@RequestParam(required=false, defaultValue="") String search
						,@RequestParam(required=false, defaultValue="") String searchtxt
						,Model model)
	{
		int totalCount = service.totalCount(search, searchtxt);
		
		int pageSize=5;
		int blockSize=10;
		
		MakePage page = new MakePage(currPage, totalCount, pageSize, blockSize);
		
		List<CategoryDTO> plist = service.adpList(search, searchtxt, page.getStartRow(), page.getEndRow());
		
		
		model.addAttribute("list",plist);
		model.addAttribute("page", page);
		model.addAttribute("search", search);
		model.addAttribute("searchtxt", searchtxt);
		
		return "templete.jsp?page=adminproduct";
		
	}
	
	@RequestMapping("delete/{pno}")
	public String delete(@PathVariable int pno)
	{
		int result = service.delete(pno);
		
		return "redirect:/adminproduct";
	}
	
	
	@RequestMapping(value = "/Payment", method = RequestMethod.GET)
	public String payment()
	{
		return "templete.jsp?page=Payment";
	}

}
