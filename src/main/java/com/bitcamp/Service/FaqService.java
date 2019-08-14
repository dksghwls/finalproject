package com.bitcamp.Service;

import java.util.List;

import com.bitcamp.DTO.FaqDTO;

public interface FaqService {

	public List<FaqDTO> faqlist();

	public int faqinsert(FaqDTO dto);

}
