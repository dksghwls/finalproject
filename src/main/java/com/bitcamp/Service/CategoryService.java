package com.bitcamp.Service;

import java.util.List;

import com.bitcamp.DTO.CategoryDTO;

public interface CategoryService {

	public List<CategoryDTO> AllList();

	public List<CategoryDTO> pList();

	public List<CategoryDTO> cpList(int cno);

	public List<CategoryDTO> allList();

	public int addresult(CategoryDTO dto);

	public int delete(int pno);

	//public int addimg(String imgname);

	public int totalCount(String search, String searchtxt);

	public List<CategoryDTO> adpList(String search, String searchtxt, int startRow, int endRow);

	
}
