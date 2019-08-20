package com.bitcamp.Service;

import java.util.List;

import org.springframework.web.bind.annotation.RequestParam;

import com.bitcamp.DTO.CategoryDTO;
import com.bitcamp.DTO.MemberDTO;
import com.bitcamp.DTO.ProductDTO;
import com.bitcamp.DTO.ReviewDTO;


public interface MyPageService {

	public List<MemberDTO> memberlist(int no);

	public List<ProductDTO> productlist();

	public void modifylist(MemberDTO dto);

	public List<ReviewDTO> reviewlist(int no);

	public void deletelist(int no);

	public List<ProductDTO> adminAllList();

	public int totalCount(String search, String searchtxt);

	public List<ProductDTO> adpList(String search, String searchtxt, int startRow, int endRow, int no);

	public List<ProductDTO> adallList();

	public List<ProductDTO> adcpList(String search, String searchtxt, int startRow, int endRow, int cno, int no);

	public int ctotalCount(String search, String searchtxt);
	
	
}
