package com.bitcamp.Mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.bitcamp.DTO.MemberDTO;
import com.bitcamp.DTO.ProductDTO;
import com.bitcamp.DTO.ReviewDTO;

@Mapper
public interface MyPageMapper {

	
	public List<MemberDTO> memberlist();

	public List<ProductDTO> productlist();

	public void modifylist(MemberDTO dto);

	public List<ReviewDTO> reviewlist();

	public void deletelist(int no);

	public List<ProductDTO> admincategorylist();

	public int totalCount(HashMap<String, Object> hm);

	public List<ProductDTO> list(HashMap<String, Object> o);

	public List<ProductDTO> adallList();

	public List<ProductDTO> adcpList(HashMap<String, Object> o);

	public int ctotalCount(HashMap<String, Object> hm);

}
