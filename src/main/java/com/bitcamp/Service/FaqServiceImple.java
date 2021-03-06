package com.bitcamp.Service;

import java.util.HashMap;
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
	public int faqcount(String search, String keyword) {
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("search", search);
		hm.put("keyword", keyword);
		return mapper.faqcount(hm);
	}

	@Override
	public List<FaqDTO> faqlist(String search,String keyword,int startRow, int endRow) {
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("startRow", startRow);
		hm.put("endRow", endRow);
		hm.put("search", search);
		hm.put("keyword", keyword);

		return mapper.faqlist(hm);
	}

	@Override
	public List<FaqDTO> shiplist(int startRow, int endRow) {
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("startRow", startRow);
		hm.put("endRow", endRow);
		return mapper.shiplist(hm);
	}

	@Override
	public List<FaqDTO> orderlist(int startRow, int endRow) {
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("startRow", startRow);
		hm.put("endRow", endRow);
		return mapper.orderlist(hm);
	}

	@Override
	public List<FaqDTO> cuslist(int startRow, int endRow) {
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("startRow", startRow);
		hm.put("endRow", endRow);
		return mapper.cuslist(hm);
	}

	@Override
	public int faqinsert(FaqDTO dto) {

		return mapper.faqinsert(dto);
	}

	@Override
	public FaqDTO faqdetail(int no) {

		return mapper.faqdetail(no);
	}

	@Override
	public int faqdelete(int no) {

		return mapper.faqdelete(no);
	}

	@Override
	public int faqmodifyok(FaqDTO dto) {
		 
		return mapper.faqmodify(dto);
	}

}
