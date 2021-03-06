package com.bitcamp.controller;

import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
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
	public String category(Model model
			,@RequestParam(required=false, defaultValue="1") int currPage
			,@RequestParam(required=false, defaultValue="") String search
			,@RequestParam(required=false, defaultValue="") String searchtxt)
	{
		
		List<CategoryDTO> clist = service.AllList();
		
		model.addAttribute("list", clist);
		
		/*Pattern p = Pattern.compile("(^[0-9]*$)"); // 
*/		
		if(search=="pno"||search.equals("pno")
				|| search=="cno"||search.equals("cno"))
		{
			/*Matcher m = p.matcher(searchtxt);
			if(!m.find())
			{
				searchtxt="";
				model.addAttribute("searchtxt", "");
				
			}
			else
			{*/
				model.addAttribute("searchtxt", searchtxt);
			/*}*/
		}
		
		
		int totalCount = service.totalCountcount(search, searchtxt);
		
		int pageSize=9;
		int blockSize=5;
		
		MakePage page = new MakePage(currPage, totalCount, pageSize, blockSize);
		List<CategoryDTO> plist = service.pList(search, searchtxt, page.getStartRow(), page.getEndRow());
		
		model.addAttribute("dto", plist );
		model.addAttribute("page", page);
		model.addAttribute("search", search);
		model.addAttribute("searchtxt", searchtxt);
		
		
		
		
		
		return "templete.jsp?page=AllCategory";
	}
	

	
	@RequestMapping("/AllCategory/{cno}")
	public String Cdetail(@PathVariable int cno
						,@RequestParam(required=false, defaultValue="1") int currPage
						,@RequestParam(required=false, defaultValue="") String search
						,@RequestParam(required=false, defaultValue="") String searchtxt 
						, Model model)
	{
		List<CategoryDTO> calist = service.allList();
		
		model.addAttribute("list", calist);
		
		/*Pattern p = Pattern.compile("(^[0-9]*$)");*/
		if(search=="pno"||search.equals("pno")
				|| search=="cno"||search.equals("cno"))
		{
		/*	Matcher m = p.matcher(searchtxt);
			if(!m.find())
			{
				searchtxt="";
				model.addAttribute("searchtxt", "");
				
			}
			else
			{*/
				model.addAttribute("searchtxt", searchtxt);
			/*}*/
		}
		
		int totalCount = service.subpage(search, searchtxt, cno);
		
		int pageSize=9;
		int blockSize=5;
		
		MakePage page = new MakePage(currPage, totalCount, pageSize, blockSize);
		List<CategoryDTO> pclist = service.cpList(search, searchtxt, page.getStartRow(), page.getEndRow(),cno);
		
		model.addAttribute("dto", pclist );
		model.addAttribute("page", page);
		model.addAttribute("search", search);
		model.addAttribute("searchtxt", searchtxt);
		model.addAttribute("cno", cno);
		
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
		
		
	/*	Pattern p = Pattern.compile("(^[0-9]*$)"); // 
*/		
		if(search=="pno"||search.equals("pno")
				|| search=="cno"||search.equals("cno"))
		{
			/*Matcher m = p.matcher(searchtxt);
			if(!m.find())
			{
				searchtxt="";
				model.addAttribute("searchtxt", "");
				
			}
			else
			{*/
				model.addAttribute("searchtxt", searchtxt);
			/*}*/
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
	@Transactional
	public String delete(@PathVariable int pno)
	{
		int result = service.delete(pno);
		int result2 = service.imgdel(pno);
		return "redirect:/adminproduct";
	}
	

	
	@RequestMapping("adminproduct/{cno}")
	public String adminselect(@PathVariable int cno
			,@RequestParam(required=false, defaultValue="1") int currPage
			,@RequestParam(required=false, defaultValue="") String search
			,@RequestParam(required=false, defaultValue="") String searchtxt 
			, Model model)
	{
		List<CategoryDTO> scalist = service.adallList();
		
		model.addAttribute("clist", scalist);
		
		
		/*Pattern p = Pattern.compile("(^[0-9]*$)"); // 
		*/
		if(search=="pno"||search.equals("pno")
				|| search=="cno"||search.equals("cno"))
		{
			/*Matcher m = p.matcher(searchtxt);
			if(!m.find())
			{
				searchtxt="";
				model.addAttribute("searchtxt", "");
				
			}
			else
			{*/
				model.addAttribute("searchtxt", searchtxt);
			/*}*/
		}
		
		
		int totalCount = service.adminsubCount(search, searchtxt ,cno);
		
		int pageSize=10;
		int blockSize=5;
		
		MakePage page = new MakePage(currPage, totalCount, pageSize, blockSize);
		
		List<CategoryDTO> spclist = service.adcpList(search, searchtxt, page.getStartRow(), page.getEndRow(),cno);
		
		model.addAttribute("list", spclist );
		model.addAttribute("page", page);
		model.addAttribute("search", search);
		model.addAttribute("searchtxt", searchtxt);
		
		return "templete.jsp?page=adminproduct";
		
	}
	
	

}
