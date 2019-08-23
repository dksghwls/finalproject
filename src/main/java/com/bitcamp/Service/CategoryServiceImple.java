package com.bitcamp.Service;

import java.util.HashMap;
import java.util.List;
import java.util.jar.Attributes.Name;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bitcamp.DTO.CategoryDTO;
import com.bitcamp.Mapper.CategoryMapper;

@Service
public class CategoryServiceImple implements CategoryService{

	@Autowired
	private CategoryMapper mapper;
	
	
	@Override
	public List<CategoryDTO> AllList() {
		return mapper.AllList();
	}


/*	@Override
	public List<CategoryDTO> pList() {
		
		return mapper.pList();
	}*/
	@Override
	public List<CategoryDTO> allList() {
		
		return mapper.allList();
	}
	

	@Override
	public List<CategoryDTO> cpList(int cno) {
		
		return mapper.cpList(cno);
	}


	/*@Override
	public int addresult(CategoryDTO dto) {
		
		return mapper.addresult(dto);
	}
*/

	@Override
	public int delete(int pno) {
		
		return mapper.delete(pno);
	}


	@Override
	public int totalCount(String search, String searchtxt) {
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("search", search);
		hm.put("searchtxt", searchtxt);
		
		return mapper.totalCount(hm);
	}


	@Override
	public List<CategoryDTO> adpList(String search, String searchtxt, int startRow, int endRow) {
		
		HashMap<String, Object> o = new HashMap<>();
		o.put("search", search);
		o.put("searchtxt", searchtxt);
		o.put("startRow", startRow );
		o.put("endRow", endRow);
		
		System.out.println(startRow);
		System.out.println(endRow);
		
		return mapper.list(o);
	}


	@Override
	public CategoryDTO update(int pno) {
		
		return mapper.update(pno);
	}


	@Override
	public int updateresult(CategoryDTO dto) {
		
		return mapper.updateresult(dto);
	}


	@Override
	public List<CategoryDTO> adminAllList() {
		
		return mapper.admincategorylist();
	}


	@Override
	public List<CategoryDTO> adallList() {
		
		return mapper.adallList();
	}


	@Override
	public List<CategoryDTO> adcpList(int cno) {
		
		return mapper.adcpList(cno);
	}


	@Override
	public int totalCountcount(String search, String searchtxt) {
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("search", search);
		hm.put("searchtxt", searchtxt);
		return mapper.totalCountcount(hm);
	}


	@Override
	public List<CategoryDTO> pList(String search, String searchtxt, int startRow, int endRow) {
		HashMap<String, Object> o = new HashMap<>();
		o.put("search", search);
		o.put("searchtxt", searchtxt);
		o.put("startRow", startRow );
		o.put("endRow", endRow);
		
		System.out.println(startRow);
		System.out.println(endRow);
		
		return mapper.plist(o);
	}

	@Transactional
	public int addresult(CategoryDTO dto, String uploadpath) {
		  
		  mapper.addresult(dto);
		  
		  
		  HashMap<String, Object> hm=new HashMap<>();
		  hm.put("path", uploadpath);
		 
		  return  mapper.addallresult(hm);
	}


	/*@Override
	public int addimg(String imgname) {
		
		return mapper.addimg(imgname);
	}*/


}

