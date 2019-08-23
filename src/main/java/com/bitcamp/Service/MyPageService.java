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

	public int totalCount(String search, String searchtxt, int no);

	public List<ProductDTO> adpList(String search, String searchtxt, int startRow, int endRow, int no);

	public List<ProductDTO> adallList();

	public List<ProductDTO> adcpList(String search, String searchtxt, int startRow, int endRow, int cno, int no);

	public int ctotalCount(String search, String searchtxt, int cno, int no);

	public void deleteauth(String email);

	public ProductDTO cancelselect(int bno, int no);

	public void cancelinsert(ProductDTO dto);

	public void cancelpay(int bno);

	public List<ProductDTO> calllist();

	public int catotalCount(String search, String searchtxt, int no);

	public List<ProductDTO> cancellist(String search, String searchtxt, int startRow, int endRow, int no);

	public List<ProductDTO> scalllist();

	public int scatotalCount(String search, String searchtxt, int no, int cno);

	public List<ProductDTO> scancellist(String search, String searchtxt, int startRow, int endRow, int cno, int no);
	
	
}
