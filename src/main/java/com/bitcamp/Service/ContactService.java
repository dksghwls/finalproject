package com.bitcamp.Service;

import java.util.List;

import com.bitcamp.DTO.ContactDTO;

public interface ContactService {
	public List<ContactDTO> contactlist(int startRow, int endRow);
	public int contactinsert(ContactDTO dto);
	public ContactDTO contactdetail(int no);
	public int contactdelete(int no);
	public int contactmodify(ContactDTO dto);
	public int contactcount();
	public int recontentmodify(ContactDTO dto);

	

	 

}
