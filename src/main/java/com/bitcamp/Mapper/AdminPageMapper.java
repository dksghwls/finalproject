package com.bitcamp.Mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.bitcamp.DTO.CategoryDTO;
import com.bitcamp.DTO.MemberDTO;
import com.bitcamp.DTO.PersonDTO;
import com.bitcamp.DTO.ProductDTO;
import com.bitcamp.DTO.ReviewDTO;

@Mapper
public interface AdminPageMapper {

	public List<PersonDTO> personlist(HashMap<String, Object> o);

	public int totalCount(HashMap<String, Object> hm);

	public void memberdelete(int no);

	public List<ProductDTO> categorylist();

	public List<ProductDTO> orderlist(HashMap<String, Object> o);

	public int ototalCount(HashMap<String, Object> hm);

	public List<ProductDTO> ocategorylist();

	public int subototalCount(HashMap<String, Object> hm);

	public List<ProductDTO> suborderlist(HashMap<String, Object> o);

	public void smodifyresult(ProductDTO dto);

	
}
