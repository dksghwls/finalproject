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

	public List<MemberDTO> personlist(HashMap<String, Object> o);

	public int totalCount(HashMap<String, Object> hm);

	public void memberdelete(int no);

	public List<ProductDTO> categorylist();

	public List<ProductDTO> orderlist(HashMap<String, Object> o);

	public int ototalCount(HashMap<String, Object> hm);

	public List<ProductDTO> ocategorylist();

	public int subototalCount(HashMap<String, Object> hm);

	public List<ProductDTO> suborderlist(HashMap<String, Object> o);

	public void smodifyresult(ProductDTO dto);

	public void updateno(int no);

	public List<ProductDTO> ccategorylist();

	public int ctotalCount(HashMap<String, Object> hm);

	public List<ProductDTO> ordercancel(HashMap<String, Object> o);

	public List<ProductDTO> subccategorylist();

	public int subctotalCount(HashMap<String, Object> hm);

	public List<ProductDTO> subordercancel(HashMap<String, Object> o);

	
}
