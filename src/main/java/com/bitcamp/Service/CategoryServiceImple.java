package com.bitcamp.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.DTO.CategoryDTO;
import com.bitcamp.Mapper.CategoryMapper;

@Service
public class CategoryServiceImple implements CategoryService{

	@Autowired
	private CategoryMapper mapper;
	
	
	@Override
	public List<CategoryDTO> AllList() {
		return mapper.AllList();
	}


	@Override
	public List<CategoryDTO> pList() {
		
		return mapper.pList();
	}
	@Override
	public List<CategoryDTO> allList() {
		
		return mapper.allList();
	}
	

	@Override
	public List<CategoryDTO> cpList(int cno) {
		
		return mapper.cpList(cno);
	}


	@Override
	public int addresult(CategoryDTO dto) {
		
		return mapper.addresult(dto);
	}


	


	

}
