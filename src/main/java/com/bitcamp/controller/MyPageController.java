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
import com.bitcamp.DTO.MemberDTO;
import com.bitcamp.DTO.ProductDTO;
import com.bitcamp.DTO.ReviewDTO;
import com.bitcamp.Service.CategoryService;
import com.bitcamp.Service.MyPageService;


@Controller
public class MyPageController {

	@Autowired
	private MyPageService myPageService;
	
	@RequestMapping(value = "/mypage")
	public String myPage(Model model) {
		List<MemberDTO> mlist=myPageService.memberlist();
		model.addAttribute("mlist", mlist);
		
		return "templete.jsp?page=mypage";
	}
	
	/*
	 * @RequestMapping(value="/product") public String product(Model model) {
	 * List<ProductDTO> plist=myPageService.productlist();
	 * model.addAttribute("plist", plist);
	 * 
	 * return "templete.jsp?page=product"; }
	 */
	
	@RequestMapping(value="/product")
	public String list(@RequestParam(required=false, defaultValue="1") int currPage
						,@RequestParam(required=false, defaultValue="") String search
						,@RequestParam(required=false, defaultValue="") String searchtxt
						,Model model)
	{
		List<ProductDTO> clist = myPageService.adminAllList();
		
		model.addAttribute("clist", clist);
		
		
		//Pattern p = Pattern.compile("(^[0-9]*$)");
		
		if(search=="pname"||search.equals("pname")
				|| search=="bno"||search.equals("bno"))
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
		
		
		int totalCount = myPageService.totalCount(search, searchtxt);
		
		int pageSize=10;
		int blockSize=5;
		
		MakePage page = new MakePage(currPage, totalCount, pageSize, blockSize);
		
		List<ProductDTO> plist = myPageService.adpList(search, searchtxt, page.getStartRow(), page.getEndRow());
		
		
		model.addAttribute("plist",plist);
		model.addAttribute("page", page);
		model.addAttribute("search", search);
		model.addAttribute("searchtxt", searchtxt);
		
		return "templete.jsp?page=product";
		
	}
	
	@RequestMapping("product/{cno}")
	public String adminselect(@PathVariable int cno, @RequestParam(required=false, defaultValue="1") int currPage
			,@RequestParam(required=false, defaultValue="") String search
			,@RequestParam(required=false, defaultValue="") String searchtxt
			,Model model)
	{
		List<ProductDTO> scalist = myPageService.adallList();
		
		model.addAttribute("clist", scalist);
		
		//Pattern p = Pattern.compile("(^[0-9]*$)");
		
		if(search=="pname"||search.equals("pname")
				|| search=="bno"||search.equals("bno"))
		{
//			Matcher m = p.matcher(searchtxt);
//			if(!m.find())
//			{
//				searchtxt="";
//				model.addAttribute("searchtxt", "");
//				
//			}
//			else
//			{
				model.addAttribute("searchtxt", searchtxt);
			//}
		}
		
		int totalCount = myPageService.ctotalCount(search, searchtxt);
		
		int pageSize=10;
		int blockSize=5;
		
		MakePage page = new MakePage(currPage, totalCount, pageSize, blockSize);
		
		List<ProductDTO> spclist = myPageService.adcpList(search, searchtxt, page.getStartRow(), page.getEndRow(), cno);
		model.addAttribute("plist", spclist );
		
		return "templete.jsp?page=product";
		
	}
	
	@RequestMapping(value ="/infomodify")
	public String infomodify(Model model) {
		 List<MemberDTO> mlist=myPageService.memberlist();
		 model.addAttribute("mlist", mlist);
		
		return "templete.jsp?page=infomodify";
	}
	
	@RequestMapping(value ="/modifyresult")
	public String modifyresult(@RequestParam String nickname, @RequestParam String name, @RequestParam String addr, @RequestParam String detailaddr, @RequestParam String phone, Model model) {
		MemberDTO dto=new MemberDTO();
		dto.setNickname(nickname);
		dto.setName(name);
		dto.setAddr(addr);
		dto.setDetailaddr(detailaddr);
		dto.setPhone(phone);
		myPageService.modifylist(dto);
		
		return "redirect:/mypage";
	}
	
	@RequestMapping(value="/exit")
	public String exit(@RequestParam int no, Model model) {
		myPageService.deletelist(no);
		return "exit";
	}
	
	@RequestMapping(value="/home")
	public String home() {
		return "templete.jsp?page=home";
	}
	
	@RequestMapping(value="/cancel")
	public String cancel() {
		return "templete.jsp?page=mypage";
	}
	
	@RequestMapping(value="/review")
	public String review(Model model) {
		
		List<ReviewDTO> dlist=myPageService.reviewlist();
		model.addAttribute("dlist", dlist);

		return "templete.jsp?page=review";
	}

}


