package com.bitcamp.Service;

import java.util.List;

import com.bitcamp.DTO.ProductDTO;
import com.bitcamp.DTO.ReplyDTO;
import com.bitcamp.DTO.imgDTO;

public interface DetailService {

	public List<ProductDTO> detaillist(int pno);
	public imgDTO getimage(int pno);
	public int replyinsert2(int no, int pno, String rcontent);
	public List<ReplyDTO> replylist(int pno);
	
	
}
