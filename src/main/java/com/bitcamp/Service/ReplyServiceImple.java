package com.bitcamp.Service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.DTO.ReplyDTO;
import com.bitcamp.Mapper.ReplyMapper;

@Service
public class ReplyServiceImple implements ReplyService {
  
	@Autowired
	private ReplyMapper replymapper;
	
	@Override
	public List<ReplyDTO> replylist()
	{
		
	    
		
		return replymapper.replylist();
		
	}
	@Override
	public int replyinsert(ReplyDTO dto)
	{
	    
		
	    
	    
		return replymapper.replyinsert(dto);
	    	
	  
	}
	@Override
	public int replyinsertresult(ReplyDTO dto)
	{
		return replymapper.replyinsertresult(dto);
		
		
	}
	
	
	@Override
	public ReplyDTO replydetail(int no)
	{
		HashMap<String, Object> hm = new HashMap<>();
		
		return replymapper.replydetail(no);
		
		
	}
	@Override
	public int replydelete(int no)
	{
	   return replymapper.replydelete(no);
	   
		
	}
	@Override
	public ReplyDTO replymodify(int no)
	{
		return replymapper.replymodify(no);
		
		
	}
	@Override
	public int replymodifyresult(ReplyDTO dto)
	{
		return replymapper.replymodifyresult(dto);
		
	}
	
	
}
