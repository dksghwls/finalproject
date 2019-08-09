package com.bitcamp.Service;

import java.util.List;

import com.bitcamp.DTO.CategoryDTO;

public interface CategoryService {

	public List<CategoryDTO> AllList();

	public List<CategoryDTO> pList();

	public List<CategoryDTO> cpList(int cno);

	public List<CategoryDTO> allList();

	public int addresult(CategoryDTO dto);

}
