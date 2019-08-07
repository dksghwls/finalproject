package com.bitcamp.Mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.bitcamp.DTO.CategoryDTO;

@Mapper
public interface CategoryMapper {

	public List<CategoryDTO> AllList();

	public List<CategoryDTO> pList();

	public List<CategoryDTO> cpList(int cno);

	public List<CategoryDTO> allList();
}
