package com.bitcamp.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.DTO.MemberDTO;
import com.bitcamp.Mapper.MemberMapper;

@Service
public class MemberServiceImple implements MemberService {

	@Autowired
	private MemberMapper mapper;
	
	@Override
	public int MemberInsert(MemberDTO dto) {
		return mapper.MemberInsert(dto);
	}

}
