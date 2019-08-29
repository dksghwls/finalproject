package com.bitcamp.Mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.bitcamp.DTO.ProductDTO;
import com.bitcamp.DTO.ReplyDTO;
import com.bitcamp.DTO.imgDTO;
@Mapper
public interface DetailMapper {

	public List<ProductDTO> detaillist(int pno);
    public imgDTO getimage(int pno);
	public int replyinsert2(HashMap<String, Object> o);
	public List<ReplyDTO> replylist(int pno);
}
