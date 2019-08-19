package com.bitcamp.controller;

import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bitcamp.DTO.CategoryDTO;
import com.bitcamp.DTO.MakePage;
import com.bitcamp.Service.CategoryService;
import com.sun.istack.internal.logging.Logger;

@Controller
public class AllCategoryController {

	@Autowired
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
		List<CategoryDTO> clist = service.adminAllList();
		
		model.addAttribute("clist", clist);
		
		
		Pattern p = Pattern.compile("(^[0-9]*$)"); // 
		
		if(search=="pno"||search.equals("pno")
				|| search=="cno"||search.equals("cno"))
		{
			Matcher m = p.matcher(searchtxt);
			if(!m.find())
			{
				searchtxt="";
				model.addAttribute("searchtxt", "");
				
			}
			else
			{
				model.addAttribute("searchtxt", searchtxt);
			}
		}
		
		
		int totalCount = service.totalCount(search, searchtxt);
		
		int pageSize=10;
		int blockSize=5;
		
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
	
	@RequestMapping("update/{pno}")
	public String update(@PathVariable int pno, Model model)
	{
		CategoryDTO dto = service.update(pno);
		model.addAttribute("dto", dto);
		
		
		return "update";
	}
	@RequestMapping("/updateresult")
	public String updateresult(CategoryDTO dto)
	{
		
		
		int result = service.updateresult(dto);
		
		System.out.println(service);
		System.out.println(result);
		System.out.println("ok");
		return "redirect:/adminproduct";
	}
	
	
	
	@RequestMapping("adminproduct/{cno}")
	public String adminselect(@PathVariable int cno, Model model)
	{
		List<CategoryDTO> scalist = service.adallList();
		
		model.addAttribute("clist", scalist);
		
		List<CategoryDTO> spclist = service.adcpList(cno);
		
		model.addAttribute("list", spclist );
		
		return "templete.jsp?page=adminproduct";
		
	}
	
	
	@RequestMapping(value = "/Payment", method = RequestMethod.GET)
	public String payment()
	{
		return "templete.jsp?page=Payment";
	}

}
