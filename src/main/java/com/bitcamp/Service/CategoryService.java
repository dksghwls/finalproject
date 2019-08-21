package com.bitcamp.Service;

import java.util.List;

import com.bitcamp.DTO.CategoryDTO;

public interface CategoryService {

	public List<CategoryDTO> AllList();

	//public List<CategoryDTO> pList();

	public List<CategoryDTO> cpList(int cno);

	public List<CategoryDTO> allList();

	public int addresult(CategoryDTO dto);

	public int delete(int pno);

	//public int addimg(String imgname);

	public int totalCount(String search, String searchtxt);

	public List<CategoryDTO> adpList(String search, String searchtxt, int startRow, int endRow);

	public CategoryDTO update(int pno);

	public int updateresult(CategoryDTO dto);

	public List<CategoryDTO> adminAllList();

	public List<CategoryDTO> adallList();

	public List<CategoryDTO> adcpList(int cno);

	public int totalCountcount(String search, String searchtxt);

	public List<CategoryDTO> pList(String search, String searchtxt, int startRow, int endRow);

	
}
