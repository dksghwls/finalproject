package com.bitcamp.Service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.DTO.ContactDTO;
import com.bitcamp.Mapper.ContactMapper;

@Service("contactservice")
public class ContactServiceImple implements ContactService {

	@Autowired
	private ContactMapper mapper;

	@Override
	public List<ContactDTO> contactlist(int startRow, int endRow) {
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("startRow", startRow);
		hm.put("endRow", endRow);
		return mapper.contactlist(hm);
	}
	@Override
	public int contactinsert(ContactDTO dto) {
	 
		return mapper.contactinsert(dto);
	}
	@Override
	public ContactDTO contactdetail(int no) {
		 
		return mapper.contactdetail(no);
	}
	@Override
	public int contactdelete(int no) {
		 
		return mapper.contactdelete(no);
	}
	@Override
	public int contactmodify(ContactDTO dto) {
		 
		return mapper.contactmodify(dto);
	}
	@Override
	public int contactcount() {
		 
		return mapper.count();
	}



	 
	
	
}
