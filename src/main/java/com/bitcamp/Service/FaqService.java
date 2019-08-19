package com.bitcamp.Service;

import java.util.List;

import com.bitcamp.DTO.FaqDTO;

public interface FaqService {

	public int faqcount();
	public List<FaqDTO> faqlist(int startRow, int endRow);
	public List<FaqDTO> shiplist(int startRow, int endRow);
	public List<FaqDTO> orderlist(int startRow, int endRow);
	public List<FaqDTO> cuslist(int startRow, int endRow);
	public int faqinsert(FaqDTO dto);
	public FaqDTO faqdetail(int no);
	public int faqdelete(int no);
	
	
	
}
