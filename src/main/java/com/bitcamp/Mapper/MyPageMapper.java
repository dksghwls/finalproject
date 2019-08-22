package com.bitcamp.Mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.bitcamp.DTO.MemberDTO;
import com.bitcamp.DTO.ProductDTO;
import com.bitcamp.DTO.ReviewDTO;

@Mapper
public interface MyPageMapper {

	
	public List<MemberDTO> memberlist(int no);

	public List<ProductDTO> productlist();

	public void modifylist(MemberDTO dto);

	public List<ReviewDTO> reviewlist(int no);

	public void deletelist(int no);

	public List<ProductDTO> admincategorylist();

	public int totalCount(HashMap<String, Object> hm);

	public List<ProductDTO> list(HashMap<String, Object> o);

	public List<ProductDTO> adallList();

	public List<ProductDTO> adcpList(HashMap<String, Object> o);

	public int ctotalCount(HashMap<String, Object> hm);

	public void deleteauth(String email);

	public ProductDTO cancelselect(HashMap<String, Object> hm);

	public void cancelinsert(ProductDTO dto);

	public void cancelpay(int bno);

	public List<ProductDTO> cancellist(int no);

	

}
