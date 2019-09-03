package com.bitcamp.Mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.bitcamp.DTO.CategoryDTO;
import com.bitcamp.DTO.MemberDTO;
import com.bitcamp.DTO.ProductDTO;
import com.bitcamp.DTO.payMemberDTO;

@Mapper
public interface CategoryMapper {

	public List<CategoryDTO> AllList();

	public List<CategoryDTO> pList();

	//public List<CategoryDTO> cpList(int cno);

	public List<CategoryDTO> allList();

	public int addresult(CategoryDTO dto);

	public int delete(int pno);

	public List<CategoryDTO> adplist();

	public int totalCount(HashMap<String, Object> o);

	public List<CategoryDTO> list(HashMap<String, Object> o);

	public List<CategoryDTO> admincategorylist();

	public List<CategoryDTO> adallList();

	public int totalCountcount(HashMap<String, Object> o);

	public List<CategoryDTO> plist(HashMap<String, Object> o);

	public int addallresult(HashMap<String, Object> hm);

	public void payok(MemberDTO dto);

	public int payallok(HashMap<String, Object> pm);

	public int subpage(HashMap<String, Object> hm);

	public List<CategoryDTO> cpList(HashMap<String, Object> o);

	public List<CategoryDTO> adcpList(HashMap<String, Object> o);

	public int adminsubCount(HashMap<String, Object> hm);

	public List<ProductDTO> paymentProduct(int pno);

	public List<CategoryDTO> imgTest();

	public int imgdel(int pno);

	
}
