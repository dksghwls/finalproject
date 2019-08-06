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
	@RequestMapping(value = "/coding", method = RequestMethod.GET)
	public String coding()
	{
		return "coding";
	}
	
	
	
	@RequestMapping(value = "/insertBoard", method = RequestMethod.POST)
	    public String insertBoard(String editor) {
	        System.err.println("저장할 내용 : " + editor);
	        return "templete.jsp?page=AllCategory";
	    }
	
	 // 다중파일업로드
	    @RequestMapping(value = "/file_uploader_html5.do",
	                  method = RequestMethod.POST)
	    @ResponseBody
	    public String multiplePhotoUpload(HttpServletRequest request) {
	        // 파일정보
	        StringBuffer sb = new StringBuffer();
	        try {
	            // 파일명을 받는다 - 일반 원본파일명
	            String oldName = request.getHeader("file-name");
	            // 파일 기본경로 _ 상세경로
	            String filePath = "C:\\bitcamp\\prj\\prj\\src\\main\\webapp\\resources\\photoUpload";
	            String saveName = sb.append(new SimpleDateFormat("yyyyMMddHHmmss")
	                          .format(System.currentTimeMillis()))
	                          .append(UUID.randomUUID().toString())
	                          .append(oldName.substring(oldName.lastIndexOf("."))).toString();
	            InputStream is = request.getInputStream();
	            OutputStream os = new FileOutputStream(filePath + saveName);
	            int numRead;
	            byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
	            while ((numRead = is.read(b, 0, b.length)) != -1) {
	                os.write(b, 0, numRead);
	            }
	            os.flush();
	            os.close();
	            // 정보 출력
	            sb = new StringBuffer();
	            sb.append("&bNewLine=true")
	              .append("&sFileName=").append(oldName)
	              .append("&sFileURL=").append("http://localhost:8080/Spring/resources/photoUpload/")
	        .append(saveName);
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return sb.toString();
	    }
	
	
	@RequestMapping(value = "/Payment", method = RequestMethod.GET)
	public String payment()
	{
		return "templete.jsp?page=Payment";
	}
}
