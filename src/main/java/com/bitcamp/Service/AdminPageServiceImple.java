package com.bitcamp.Service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.DTO.CategoryDTO;
import com.bitcamp.DTO.MemberDTO;
import com.bitcamp.DTO.PersonDTO;
import com.bitcamp.DTO.ProductDTO;
import com.bitcamp.DTO.ReviewDTO;
import com.bitcamp.Mapper.AdminPageMapper;
import com.bitcamp.Mapper.MyPageMapper;

@Service
public class AdminPageServiceImple implements AdminPageService {

	@Autowired
	private AdminPageMapper adminMapper;

	@Override
	public List<PersonDTO> personlist(String search, String searchtxt, int startRow, int endRow) {
		
		HashMap<String, Object> o = new HashMap<>();
		o.put("search", search);
		o.put("searchtxt", searchtxt);
		o.put("startRow", startRow);
		o.put("endRow", endRow);

		return adminMapper.personlist(o);
	}

	@Override
	public int totalCount(String search, String searchtxt) {
		
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("search", search);
		hm.put("searchtxt", searchtxt);

		return adminMapper.totalCount(hm);
	}

	@Override
	public void memberdelete(int no) {
		
		adminMapper.memberdelete(no);
		
	}

	@Override
	public List<ProductDTO> categorylist() {
		
		return adminMapper.categorylist();
	}

	@Override
	public List<ProductDTO> orderlist(String search, String searchtxt, int startRow, int endRow) {
		
		HashMap<String, Object> o = new HashMap<>();
		o.put("search", search);
		o.put("searchtxt", searchtxt);
		o.put("startRow", startRow);
		o.put("endRow", endRow);

		return adminMapper.orderlist(o);
	}

	@Override
	public int ototalCount(String search, String searchtxt) {
		
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("search", search);
		hm.put("searchtxt", searchtxt);

		return adminMapper.ototalCount(hm);
		
	}

	@Override
	public List<ProductDTO> ocategorylist() {
	
		return adminMapper.ocategorylist();
	}

	@Override
	public int subototalCount(String search, String searchtxt) {
		
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("search", search);
		hm.put("searchtxt", searchtxt);

		return adminMapper.subototalCount(hm);
	}

	@Override
	public List<ProductDTO> suborderlist(String search, String searchtxt, int startRow, int endRow, int cno) {
		
		HashMap<String, Object> o = new HashMap<>();
		o.put("search", search);
		o.put("searchtxt", searchtxt);
		o.put("startRow", startRow );
		o.put("endRow", endRow);
		o.put("cno", cno);

		return adminMapper.suborderlist(o);
	}

	@Override
	public void smodifyresult(ProductDTO dto) {
		
		adminMapper.smodifyresult(dto);
		
	}

	

}