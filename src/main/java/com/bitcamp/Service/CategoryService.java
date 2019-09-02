package com.bitcamp.Service;

import java.util.List;

import com.bitcamp.DTO.CategoryDTO;
import com.bitcamp.DTO.MemberDTO;
import com.bitcamp.DTO.ProductDTO;
import com.bitcamp.DTO.payMemberDTO;
import com.bitcamp.DTO.paymentDTO;

public interface CategoryService {

	public List<CategoryDTO> AllList();

	//public List<CategoryDTO> pList();

	//public List<CategoryDTO> cpList(int cno);

	public List<CategoryDTO> allList();

	//public int addresult(CategoryDTO dto);

	public int delete(int pno);

	//public int addimg(String imgname);

	public int totalCount(String search, String searchtxt);

	public List<CategoryDTO> adpList(String search, String searchtxt, int startRow, int endRow);

	public CategoryDTO update(int pno);

	public int updateresult(CategoryDTO dto);

	public List<CategoryDTO> adminAllList();

	public List<CategoryDTO> adallList();

	public int totalCountcount(String search, String searchtxt);

	public List<CategoryDTO> pList(String search, String searchtxt, int startRow, int endRow);

	public int addresult(CategoryDTO dto, String uploadpath);

	public int payok(MemberDTO dto, paymentDTO pao);

	public int subpage(String search, String searchtxt, int cno);
	public List<CategoryDTO> cpList(String search, String searchtxt, int startRow, int endRow, int cno);

	
	public List<CategoryDTO> adcpList(String search, String searchtxt, int startRow, int endRow, int cno);
	public int adminsubCount(String search, String searchtxt, int cno);

	public List<ProductDTO> paymentProduct(int pno);

	public List<CategoryDTO> imgTest();

	public int imgdel(int pno);

	
}
