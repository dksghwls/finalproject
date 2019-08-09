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
	
	@RequestMapping(value="insertBoard")
	public String addresult(@RequestParam String pname
							,@RequestParam int dprice
							,@RequestParam int oprice
							,@RequestParam int cno
							,@RequestParam(required=false) String editor
								,CategoryDTO dto)
	{
		dto.setPname(pname);
		dto.setDprice(dprice);
		dto.setOprice(oprice);
		dto.setCno(cno);
		
		int result =  service.addresult(dto);
		
		
		return "redirect:/AllCategory";
		
	}
	
	@RequestMapping("delete/{pno}")
	public String delete(@PathVariable int pno)
	{
		int result = service.delete(pno);
		
		return "redirect:/AllCategory";
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
	
	
	@RequestMapping(value = "/Payment", method = RequestMethod.GET)
	public String payment()
	{
		return "templete.jsp?page=Payment";
	}

}
