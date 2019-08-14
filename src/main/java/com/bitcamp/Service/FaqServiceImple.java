package com.bitcamp.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.DTO.FaqDTO;
import com.bitcamp.Mapper.FaqMapper;

@Service("faqservice")
public class FaqServiceImple implements FaqService {

	@Autowired
	private FaqMapper mapper;

	@Override
	public List<FaqDTO> faqlist() {
		 
		return mapper.faqlist();
	}

	@Override
	public int faqinsert(FaqDTO dto) {
		 
		return mapper.faqinsert(dto);
	}
}
