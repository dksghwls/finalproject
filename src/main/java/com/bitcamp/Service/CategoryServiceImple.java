package com.bitcamp.Service;

import java.util.HashMap;
import java.util.List;
import java.util.jar.Attributes.Name;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bitcamp.DTO.CategoryDTO;
import com.bitcamp.DTO.MemberDTO;
import com.bitcamp.DTO.ProductDTO;
import com.bitcamp.DTO.payMemberDTO;
import com.bitcamp.DTO.paymentDTO;
import com.bitcamp.Mapper.CategoryMapper;

@Service
public class CategoryServiceImple implements CategoryService{

	@Autowired
	private CategoryMapper mapper;
	
	
	@Override
	public List<CategoryDTO> AllList() {
		return mapper.AllList();
	}


	@Override
	public List<CategoryDTO> allList() {
		
		return mapper.allList();
	}
	

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
		
		
		return mapper.list(o);
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
		
		
		return mapper.plist(o);
	}

	@Transactional
	public int addresult(CategoryDTO dto, String uploadpath) {
		  
		  mapper.addresult(dto);
		  
		  
		  HashMap<String, Object> hm=new HashMap<>();
		  hm.put("path", uploadpath);
		
	
		  return  mapper.addallresult(hm);
	}

	@Override
	public List<CategoryDTO> cpList(String search, String searchtxt, int startRow, int endRow, int cno) {
		
		HashMap<String, Object> o = new HashMap<>();
		o.put("search", search);
		o.put("searchtxt", searchtxt);
		o.put("startRow", startRow );
		o.put("endRow", endRow);
		o.put("cno", cno);
		
		return mapper.cpList(o);
	}
	@Override
	public int subpage(String search, String searchtxt, int cno) {
		
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("search", search);
		hm.put("searchtxt", searchtxt);
		hm.put("cno", cno);
		
		return mapper.subpage(hm);
	}


	@Override
	public List<CategoryDTO> adcpList(String search, String searchtxt, int startRow, int endRow, int cno) {
		
		HashMap<String, Object> o = new HashMap<>();
		o.put("search", search);
		o.put("searchtxt", searchtxt);
		o.put("startRow", startRow );
		o.put("endRow", endRow);
		o.put("cno", cno);
		
		return mapper.adcpList(o);
	}


	@Override
	public int adminsubCount(String search, String searchtxt, int cno) {
		
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("search", search);
		hm.put("searchtxt", searchtxt);
		hm.put("cno", cno);
		
		return mapper.adminsubCount(hm);
	}


	@Override
	public List<ProductDTO> paymentProduct(int pno) {
		
		return mapper.paymentProduct(pno);
	}



	@Override
	public int imgdel(int pno) {
		
		return mapper.imgdel(pno);
		
	}


	@Override
	public int payok(MemberDTO dto) {
		
		return mapper.payok(dto);
	}


	@Override
	public int payallok(paymentDTO pao) {
		
		return mapper.payallok(pao);
	}


	@Override
	public int stockadmin(int pno, int bcount) {
		
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("pno", pno);
		hm.put("bcount", bcount);
		
		return mapper.stockadmin(hm);
	}

	


}

