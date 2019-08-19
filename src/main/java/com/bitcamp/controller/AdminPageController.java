package com.bitcamp.controller;

import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bitcamp.DTO.CategoryDTO;
import com.bitcamp.DTO.MakePage;
import com.bitcamp.DTO.MemberDTO;
import com.bitcamp.DTO.PersonDTO;
import com.bitcamp.DTO.ProductDTO;
import com.bitcamp.DTO.ReviewDTO;
import com.bitcamp.Service.AdminPageService;
import com.bitcamp.Service.CategoryService;
import com.bitcamp.Service.MyPageService;


@Controller
public class AdminPageController {

	@Resource
	private AdminPageService adminPageService;
	
	@RequestMapping(value="/adminpage")
	public String list(@RequestParam(required=false, defaultValue="1") int currPage
						,@RequestParam(required=false, defaultValue="") String search
						,@RequestParam(required=false, defaultValue="") String searchtxt
						,Model model)
	{
		
		
		//Pattern p = Pattern.compile("(^[0-9]*$)");
		
		if(search=="email"||search.equals("email")
				|| search=="nickname"||search.equals("nickname"))
		{
			//Matcher m = p.matcher(searchtxt);
			/*
			 * if(!m.find()) { searchtxt=""; model.addAttribute("searchtxt", "");
			 * 
			 * } else {
			 */
				model.addAttribute("searchtxt", searchtxt);
			//}
		}
		
		
		int totalCount = adminPageService.totalCount(search, searchtxt);
		
		int pageSize=10;
		int blockSize=5;
		
		MakePage page = new MakePage(currPage, totalCount, pageSize, blockSize);
		
		List<PersonDTO> plist = adminPageService.personlist(search, searchtxt, page.getStartRow(), page.getEndRow());
		
		
		model.addAttribute("plist",plist);
		model.addAttribute("page", page);
		model.addAttribute("search", search);
		model.addAttribute("searchtxt", searchtxt);
		
		System.out.println("plist.size() : " + plist.size());
		System.out.println("page : " + page);
		System.out.println("search : [" + search + "]");
		System.out.println("searchtxt : [" + searchtxt + "]");
		System.out.println("page.getStartRow() : [" + page.getStartRow() + "]");
		
		
		
		return "templete.jsp?page=adminpage";
		
	}
	
	@RequestMapping(value="/memberdelete")
	public String delete(@RequestParam int no, Model model)
	{
		adminPageService.memberdelete(no);
		
		return "deleteresult";
	}
	
	@RequestMapping(value="/goods")
	public String home() {
		return "templete.jsp?page=goods";
	}
	
	@RequestMapping(value="/order")
	public String order(@RequestParam(required=false, defaultValue="1") int currPage
						,@RequestParam(required=false, defaultValue="") String search
						,@RequestParam(required=false, defaultValue="") String searchtxt
						,Model model)
	{
		
		List<ProductDTO> clist = adminPageService.categorylist();
		
		model.addAttribute("clist", clist);
		
		//Pattern p = Pattern.compile("(^[0-9]*$)");
		
		if(search=="pname"||search.equals("pname")||search=="bno"||search.equals("bno")
				|| search=="nickname"||search.equals("nickname"))
		{
			//Matcher m = p.matcher(searchtxt);
			/*
			 * if(!m.find()) { searchtxt=""; model.addAttribute("searchtxt", "");
			 * 
			 * } else {
			 */
				model.addAttribute("searchtxt", searchtxt);
			//}
		}
		
		
		int totalCount = adminPageService.ototalCount(search, searchtxt);
		
		int pageSize=10;
		int blockSize=5;
		
		MakePage page = new MakePage(currPage, totalCount, pageSize, blockSize);
		
		List<ProductDTO> olist = adminPageService.orderlist(search, searchtxt, page.getStartRow(), page.getEndRow());
		
		
		model.addAttribute("olist",olist);
		model.addAttribute("page", page);
		model.addAttribute("search", search);
		model.addAttribute("searchtxt", searchtxt);
		
		return "templete.jsp?page=order";
		
	}
	
	@RequestMapping(value="order/{cno}")
	public String order(@PathVariable int cno, @RequestParam(required=false, defaultValue="1") int currPage
						,@RequestParam(required=false, defaultValue="") String search
						,@RequestParam(required=false, defaultValue="") String searchtxt
						,Model model)
	{
		
		List<ProductDTO> clist = adminPageService.ocategorylist();
		
		model.addAttribute("clist", clist);
		
		//Pattern p = Pattern.compile("(^[0-9]*$)");
		
		if(search=="pname"||search.equals("pname")||search=="bno"||search.equals("bno")
				|| search=="nickname"||search.equals("nickname"))
		{
			//Matcher m = p.matcher(searchtxt);
			/*
			 * if(!m.find()) { searchtxt=""; model.addAttribute("searchtxt", "");
			 * 
			 * } else {
			 */
				model.addAttribute("searchtxt", searchtxt);
			//}
		}
		
		
		int totalCount = adminPageService.subototalCount(search, searchtxt);
		
		int pageSize=10;
		int blockSize=5;
		
		MakePage page = new MakePage(currPage, totalCount, pageSize, blockSize);
		
		List<ProductDTO> olist = adminPageService.suborderlist(search, searchtxt, page.getStartRow(), page.getEndRow(), cno);
		
		
		model.addAttribute("olist",olist);
		model.addAttribute("page", page);
		model.addAttribute("search", search);
		model.addAttribute("searchtxt", searchtxt);
		
		return "templete.jsp?page=order";
		
	}
	
	@RequestMapping("shippingmodify/{bno}")
	public String shippingmodify(@PathVariable int bno, Model model) {
		
		model.addAttribute("bno", bno);
		
		return "templete.jsp?page=shippingmodify";
	}
	
	@RequestMapping(value="/smodifyresult")
	public String smodifyresult(@RequestParam int bno, @RequestParam String shipping, Model model) {
		
		ProductDTO dto=new ProductDTO();
		dto.setBno(bno);
		dto.setShipping(shipping);
		
		adminPageService.smodifyresult(dto);
		
		return "redirect:/order";
	}
	
	/*
	 * @RequestMapping(value ="/modifyresult") public String
	 * modifyresult(@RequestParam String nickname, @RequestParam String
	 * name, @RequestParam String addr, @RequestParam String
	 * detailaddr, @RequestParam String phone, Model model) { MemberDTO dto=new
	 * MemberDTO(); dto.setNickname(nickname); dto.setName(name); dto.setAddr(addr);
	 * dto.setDetailaddr(detailaddr); dto.setPhone(phone);
	 * myPageService.modifylist(dto);
	 * 
	 * return "redirect:/mypage"; }
	 */
	
}