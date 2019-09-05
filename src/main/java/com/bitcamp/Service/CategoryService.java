package com.bitcamp.Service;

import java.util.List;

import com.bitcamp.DTO.CategoryDTO;
import com.bitcamp.DTO.MemberDTO;
import com.bitcamp.DTO.ProductDTO;
import com.bitcamp.DTO.payMemberDTO;
import com.bitcamp.DTO.paymentDTO;

public interface CategoryService {

	public List<CategoryDTO> AllList();

	public List<CategoryDTO> allList();

	public int delete(int pno);

	public int totalCount(String search, String searchtxt);

	public List<CategoryDTO> adpList(String search, String searchtxt, int startRow, int endRow);

	public List<CategoryDTO> adminAllList();

	public List<CategoryDTO> adallList();

	public int totalCountcount(String search, String searchtxt);

	public List<CategoryDTO> pList(String search, String searchtxt, int startRow, int endRow);

	public int addresult(CategoryDTO dto, String uploadpath);

	public int subpage(String search, String searchtxt, int cno);
	public List<CategoryDTO> cpList(String search, String searchtxt, int startRow, int endRow, int cno);

	
	public List<CategoryDTO> adcpList(String search, String searchtxt, int startRow, int endRow, int cno);
	public int adminsubCount(String search, String searchtxt, int cno);

	public List<ProductDTO> paymentProduct(int pno);

	public int imgdel(int pno);

	public int payok(MemberDTO dto);

	public int payallok(paymentDTO pao);

	public int stockadmin(int pno, int bcount);

	
}
