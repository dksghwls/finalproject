package com.bitcamp.Service;

import com.bitcamp.DTO.MemberDTO;

public interface MemberService {
	
	public int MemberInsert(MemberDTO dto);

	public int MemberAuthInsert(String email);

	public MemberDTO getMember(MemberDTO dto);

}
