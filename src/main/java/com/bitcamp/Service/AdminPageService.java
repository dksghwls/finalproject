package com.bitcamp.Service;

import java.util.List;

import com.bitcamp.DTO.CategoryDTO;
import com.bitcamp.DTO.MemberDTO;
import com.bitcamp.DTO.PersonDTO;
import com.bitcamp.DTO.ProductDTO;
import com.bitcamp.DTO.ReviewDTO;


public interface AdminPageService {

	public List<MemberDTO> personlist(String search, String searchtxt, int startRow, int endRow);

	public int totalCount(String search, String searchtxt);

	public void memberdelete(int no);

	public List<ProductDTO> categorylist();

	public List<ProductDTO> orderlist(String search, String searchtxt, int startRow, int endRow);

	public int ototalCount(String search, String searchtxt);

	public List<ProductDTO> ocategorylist();

	public int subototalCount(String search, String searchtxt, int cno);

	public List<ProductDTO> suborderlist(String search, String searchtxt, int startRow, int endRow, int cno);

	public void smodifyresult(ProductDTO dto);

	public void updateno(int no);
	
}
