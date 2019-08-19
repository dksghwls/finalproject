package com.bitcamp.Service;

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
	public List<ContactDTO> contactlist() {
		 
		return mapper.contactlist();
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



	 
	
	
}