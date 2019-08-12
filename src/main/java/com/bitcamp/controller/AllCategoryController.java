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
	public String list(Model model)
	{
		List<CategoryDTO> plist = service.adpList();
		
		model.addAttribute("dto", plist );
		
		return "templete.jsp?page=adminproduct";
		
	}
	
	
	@RequestMapping(value="insertBoard")
	public String addresult(@RequestParam String pname
							,@RequestParam int dprice
							,@RequestParam int oprice
							,@RequestParam int cno
							,@RequestParam(required=false) String imgname
							,@RequestParam String content
							,@RequestParam String deadline
							,@RequestParam String regist
							,@RequestParam int stock
								,CategoryDTO dto)
	{
		dto.setPname(pname);
		dto.setDprice(dprice);
		dto.setOprice(oprice);
		dto.setCno(cno);
		dto.setImgname(imgname);
		dto.setContent(content);
		dto.setDeadline(deadline);
		dto.setRegist(regist);
		dto.setStock(stock);
		
		int result =  service.addresult(dto);
		
		int result2 = service.addimg(imgname);
		
		return "redirect:/adminproduct";
		
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
