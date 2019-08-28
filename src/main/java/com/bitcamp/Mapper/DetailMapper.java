package com.bitcamp.Mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.bitcamp.DTO.ProductDTO;
@Mapper
public interface DetailMapper {

	public List<ProductDTO> detaillist(int pno);

	
	
}
