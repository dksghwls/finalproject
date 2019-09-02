package com.bitcamp.Service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.DTO.ProductDTO;
import com.bitcamp.DTO.ReplyDTO;
import com.bitcamp.DTO.imgDTO;
import com.bitcamp.Mapper.DetailMapper;

@Service
public class DetailServiceImple implements DetailService {

	@Autowired
	private DetailMapper detailmapper;

	@Override
	public List<ProductDTO> detaillist(int pno) {
		
		return detailmapper.detaillist(pno);
	}
	
	@Override
	public imgDTO getimage(int pno) {
		return detailmapper.getimage(pno);		
	}

	@Override
	public int replyinsert2(int no, int pno, String rcontent){
		HashMap<String, Object> o = new HashMap<>();
		o.put("no", no);
		o.put("pno", pno);
		o.put("rcontent", rcontent);
		
		return detailmapper.replyinsert2(o);
	}
	
	@Override
	public List<ReplyDTO> replylist(int pno){
		
		
		
		
		return detailmapper.replylist(pno);
	}
	@Override
	public int replydelete2(int rno) {
		
		return detailmapper.replydelete2(rno);
		
	}
	@Override
	public ReplyDTO replydetail2(int rno) {
		
		return detailmapper.replydetail2(rno);
		
	}
	@Override
	public int replyupdate2(ReplyDTO dto) {
		
		return detailmapper.replyupdate2(dto);
		
	}
	
	
	
}
