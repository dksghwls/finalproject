package com.bitcamp.Mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.bitcamp.DTO.ContactDTO;

@Mapper
public interface ContactMapper {
	public List<ContactDTO> contactlist();
	public int contactinsert(ContactDTO dto);
	public ContactDTO contactdetail(int no);
	public int contactdelete(int no);
	public int contactmodify(ContactDTO dto);

	
 

}
