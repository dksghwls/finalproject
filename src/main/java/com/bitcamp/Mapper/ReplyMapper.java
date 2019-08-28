package com.bitcamp.Mapper;

import java.util.HashMap;
import java.util.List;

import com.bitcamp.DTO.ReplyDTO;

public interface ReplyMapper {

	public List<ReplyDTO> replylist();
    public int replyinsert(ReplyDTO dto);
    public int replyinsertresult(ReplyDTO dto);
    public ReplyDTO replydetail(int no);
    public int replydelete(int no);
    public ReplyDTO replymodify(int no);
    public int replymodifyresult(ReplyDTO dto);
	
	
	
	
}
