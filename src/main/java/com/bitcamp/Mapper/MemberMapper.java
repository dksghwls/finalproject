package com.bitcamp.Mapper;

import org.apache.ibatis.annotations.Mapper;

import com.bitcamp.DTO.MemberDTO;

@Mapper
public interface MemberMapper {

	public int MemberInsert(MemberDTO dto);
	
}
