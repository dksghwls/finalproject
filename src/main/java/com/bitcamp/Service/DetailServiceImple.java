package com.bitcamp.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.DTO.ProductDTO;
import com.bitcamp.Mapper.DetailMapper;

@Service
public class DetailServiceImple implements DetailService {

	@Autowired
	private DetailMapper detailmapper;

	@Override
	public List<ProductDTO> detaillist(int pno) {
		
		return detailmapper.detaillist(pno);
	}
	
}
