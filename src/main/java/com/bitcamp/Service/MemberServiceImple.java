package com.bitcamp.Service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.DTO.CategoryDTO;
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

	@Override
	public int MemberAuthInsert(String email) {
		return mapper.MemberAuthInsert(email);
	}

	@Override
	public MemberDTO getMember(String email) {
		return mapper.getMember(email);
	}

	@Override
	public List<CategoryDTO> getList() {
		return mapper.getList();
	}

	@Override
	public int pwdChange(String email, String pwd) {
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("email", email);
		hm.put("pwd", pwd);
		return mapper.pwdChange(hm);
	}



}
