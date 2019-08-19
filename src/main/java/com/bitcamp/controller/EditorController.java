package com.bitcamp.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitcamp.DTO.CategoryDTO;
import com.bitcamp.Service.CategoryService;
import com.sun.istack.internal.logging.Logger;

@Controller
public class EditorController {

	@Autowired
	private CategoryService service;
	
	@RequestMapping(value = "/coding", method = RequestMethod.GET)
	public String coding()
	{
		return "coding";
	}
	@RequestMapping("/file_uploader_html5") 
	public void file_uploader_html5(HttpServletRequest request, HttpServletResponse response){
		try {
			String sFileInfo ="";
			
			String filename = request.getHeader("file-name"); 
			
			String filename_ext = filename.substring(filename.lastIndexOf(".")+1);
			
			filename_ext = filename_ext.toLowerCase(); 
			
			String[] allow_file = {"jpg","png","bmp","gif"}; 
			
			int cnt = 0; 
			for(int i=0; i<allow_file.length; i++)
			{ if(filename_ext.equals(allow_file[i])){ cnt++; } } 
			
			if(cnt == 0)
			{ PrintWriter print = response.getWriter();
			print.print("NOTALLOW_"+filename);
			print.flush();
			print.close();
			} else { 
				
				String dftFilePath = request.getSession().getServletContext().getRealPath("/");
				
				String filePath = dftFilePath + "resources" + File.separator + "editor" + File.separator +"multiupload" + File.separator;
				File file = new File(filePath); 
				if(!file.exists())
				{ 
					file.mkdirs();
				}
				String realFileNm = "";
				SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
				String today= formatter.format(new java.util.Date());
				realFileNm = today+UUID.randomUUID().toString() + filename.substring(filename.lastIndexOf("."));
				String rlFileNm = filePath + realFileNm;
				
				InputStream is = request.getInputStream(); OutputStream os=new FileOutputStream(rlFileNm);
				int numRead;
				byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
				while((numRead = is.read(b,0,b.length)) != -1){ os.write(b,0,numRead);
				} if(is != null) {
					is.close();
				} os.flush(); os.close(); 
				
				sFileInfo += "&bNewLine=true"; 
				
				sFileInfo += "&sFileName="+ filename;
				sFileInfo += "&sFileURL="+"/resources/editor/multiupload/"+realFileNm;
				PrintWriter print = response.getWriter();
				print.print(sFileInfo);
				print.flush();
				print.close();
		
				}	
			} 
		
		catch (Exception e)
		{ 
				e.printStackTrace(); }
		
	}

	@RequestMapping("insertBoard")
	public String addresult(CategoryDTO dto)
	{
		
		int result = service.addresult(dto);
		
		return "redirect:/adminproduct";
	}
	

}