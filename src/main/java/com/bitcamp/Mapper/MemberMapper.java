package com.bitcamp.Mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.bitcamp.DTO.CategoryDTO;
import com.bitcamp.DTO.MemberDTO;

@Mapper
public interface MemberMapper {

	public int MemberInsert(MemberDTO dto);

	public int MemberAuthInsert(String email);
	
	public MemberDTO getMember(String email);

	public List<CategoryDTO> getList();
	
}
