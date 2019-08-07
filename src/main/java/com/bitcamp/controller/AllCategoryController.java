package com.bitcamp.controller;

import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class AllCategoryController {

	@RequestMapping(value = "/AllCategory", method = RequestMethod.GET)
	public String category() {
		return "templete.jsp?page=AllCategory";
	}
	
	@RequestMapping(value = "/Payment", method = RequestMethod.GET)
	public String payment()
	{
		return "templete.jsp?page=Payment";
	}
}
