package com.bitcamp.Mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.bitcamp.DTO.FaqDTO;

@Mapper
public interface FaqMapper {

	public List<FaqDTO> faqlist();

	public int faqinsert(FaqDTO dto);

	
}
