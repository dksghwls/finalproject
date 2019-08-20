package com.bitcamp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HelpMapController {

	@RequestMapping(value="/map",method=RequestMethod.POST)
	public String helpmap() {
		
		return "templete.jsp?page=helpmap";
	}
}
