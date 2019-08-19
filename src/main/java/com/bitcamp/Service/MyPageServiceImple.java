package com.bitcamp.Service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.DTO.CategoryDTO;
import com.bitcamp.DTO.MemberDTO;
import com.bitcamp.DTO.ProductDTO;
import com.bitcamp.DTO.ReviewDTO;
import com.bitcamp.Mapper.MyPageMapper;

@Service
public class MyPageServiceImple implements MyPageService {

	@Autowired
	private MyPageMapper myPageMapper;

	@Override
	public List<MemberDTO> memberlist() {

		return myPageMapper.memberlist();
	}

	@Override
	public List<ProductDTO> productlist() {
		return myPageMapper.productlist();
	}

	@Override
	public void modifylist(MemberDTO dto) {
		myPageMapper.modifylist(dto);
	}

	@Override
	public List<ReviewDTO> reviewlist() {
		return myPageMapper.reviewlist();
	}

	@Override
	public void deletelist(int no) {
		myPageMapper.deletelist(no);

	}

	@Override
	public List<ProductDTO> adminAllList() {

		return myPageMapper.admincategorylist();
	}

	@Override
	public int totalCount(String search, String searchtxt) {

		HashMap<String, Object> hm = new HashMap<>();
		hm.put("search", search);
		hm.put("searchtxt", searchtxt);

		return myPageMapper.totalCount(hm);

	}

	@Override
	public List<ProductDTO> adpList(String search, String searchtxt, int startRow, int endRow) {

		HashMap<String, Object> o = new HashMap<>();
		o.put("search", search);
		o.put("searchtxt", searchtxt);
		o.put("startRow", startRow);
		o.put("endRow", endRow);

		/*
		 * System.out.println(startRow); System.out.println(endRow);
		 */

		return myPageMapper.list(o);
	}

	@Override
	public List<ProductDTO> adallList() {

		return myPageMapper.adallList();
	}

	@Override
	public List<ProductDTO> adcpList(String search, String searchtxt, int startRow, int endRow, int cno) {

		HashMap<String, Object> o = new HashMap<>();
		o.put("search", search);
		o.put("searchtxt", searchtxt);
		o.put("startRow", startRow );
		o.put("endRow", endRow);
		o.put("cno", cno);

		return myPageMapper.adcpList(o);
	}

	@Override
	public int ctotalCount(String search, String searchtxt) {
		
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("search", search);
		hm.put("searchtxt", searchtxt);

		return myPageMapper.ctotalCount(hm);
	}

}