package com.bitcamp.Service;

import java.util.List;

import com.bitcamp.DTO.ContactDTO;

public interface ContactService {
	public List<ContactDTO> contactlist();
	public int contactinsert(ContactDTO dto);
	public ContactDTO contactdetail(int no);
	public int contactdelete(int no);

	

	 

}
