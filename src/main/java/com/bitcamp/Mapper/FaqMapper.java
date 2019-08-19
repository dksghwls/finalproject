package com.bitcamp.Mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.bitcamp.DTO.FaqDTO;

@Mapper
public interface FaqMapper {

	public int faqcount(HashMap<String, Object> hm);
	public List<FaqDTO> faqlist(HashMap<String, Object> hm);
	public List<FaqDTO> shiplist(HashMap<String, Object> hm);
	public List<FaqDTO> orderlist(HashMap<String, Object> hm);
	public List<FaqDTO> cuslist(HashMap<String, Object> hm);	
	public int faqinsert(FaqDTO dto);
	public FaqDTO faqdetail(int no);
	public int faqdelete(int no);
	

	


	
	
}
