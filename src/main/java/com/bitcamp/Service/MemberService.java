package com.bitcamp.Service;

import java.util.List;

import com.bitcamp.DTO.CategoryDTO;
import com.bitcamp.DTO.MemberDTO;

public interface MemberService {
	
	public int MemberInsert(MemberDTO dto);

	public int MemberAuthInsert(String email);

	public MemberDTO getMember(String email);

	public List<CategoryDTO> getList();

}
