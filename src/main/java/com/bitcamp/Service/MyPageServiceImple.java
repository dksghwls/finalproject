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
	public List<MemberDTO> memberlist(int no) {

		return myPageMapper.memberlist(no);
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
	public List<ReviewDTO> reviewlist(int no) {
		return myPageMapper.reviewlist(no);
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
	public int totalCount(String search, String searchtxt, int no) {

		HashMap<String, Object> hm = new HashMap<>();
		hm.put("search", search);
		hm.put("searchtxt", searchtxt);
		hm.put("no", no);

		return myPageMapper.totalCount(hm);

	}

	@Override
	public List<ProductDTO> adpList(String search, String searchtxt, int startRow, int endRow, int no) {

		HashMap<String, Object> o = new HashMap<>();
		o.put("search", search);
		o.put("searchtxt", searchtxt);
		o.put("startRow", startRow);
		o.put("endRow", endRow);
		o.put("no", no);

		return myPageMapper.list(o);
	}

	@Override
	public List<ProductDTO> adallList() {

		return myPageMapper.adallList();
	}

	@Override
	public List<ProductDTO> adcpList(String search, String searchtxt, int startRow, int endRow, int cno, int no) {

		HashMap<String, Object> o = new HashMap<>();
		o.put("search", search);
		o.put("searchtxt", searchtxt);
		o.put("startRow", startRow );
		o.put("endRow", endRow);
		o.put("cno", cno);
		o.put("no", no);
		
		return myPageMapper.adcpList(o);
	}

	@Override
	public int ctotalCount(String search, String searchtxt, int cno, int no) {
		
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("search", search);
		hm.put("searchtxt", searchtxt);
		hm.put("cno", cno);
		hm.put("no", no);

		return myPageMapper.ctotalCount(hm);
	}

	@Override
	public void deleteauth(String email) {
		
		myPageMapper.deleteauth(email);
		
	}

	@Override
	public ProductDTO cancelselect(int bno, int no) {
		
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("bno", bno);
		hm.put("no", no);
		
		return myPageMapper.cancelselect(hm);
	}

	@Override
	public void cancelinsert(ProductDTO dto) {
		
		myPageMapper.cancelinsert(dto);
		
	}

	@Override
	public void cancelpay(int bno) {
		
		myPageMapper.cancelpay(bno);
		
	}

	@Override
	public List<ProductDTO> calllist() {
		
		return myPageMapper.calllist();
	}

	@Override
	public int catotalCount(String search, String searchtxt, int no) {
		
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("search", search);
		hm.put("searchtxt", searchtxt);
		hm.put("no", no);

		return myPageMapper.catotalCount(hm);
		
	}

	@Override
	public List<ProductDTO> cancellist(String search, String searchtxt, int startRow, int endRow, int no) {
		
		HashMap<String, Object> o = new HashMap<>();
		o.put("search", search);
		o.put("searchtxt", searchtxt);
		o.put("startRow", startRow);
		o.put("endRow", endRow);
		o.put("no", no);

		return myPageMapper.cancellist(o);
	}

	@Override
	public List<ProductDTO> scalllist() {
		
		return myPageMapper.scalllist();
	}

	@Override
	public int scatotalCount(String search, String searchtxt, int no, int cno) {
		
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("search", search);
		hm.put("searchtxt", searchtxt);
		hm.put("no", no);
		hm.put("cno", cno);

		return myPageMapper.scatotalCount(hm);
	}

	@Override
	public List<ProductDTO> scancellist(String search, String searchtxt, int startRow, int endRow, int cno, int no) {
		
		HashMap<String, Object> o = new HashMap<>();
		o.put("search", search);
		o.put("searchtxt", searchtxt);
		o.put("startRow", startRow );
		o.put("endRow", endRow);
		o.put("cno", cno);
		o.put("no", no);
		
		return myPageMapper.scancellist(o);
	}

	@Override
	public void cancelproduct(int pno, int bcount) {
		
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("pno", pno);
		hm.put("bcount", bcount);
		
		myPageMapper.cancelproduct(hm);
		
	}

}
