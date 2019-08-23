package com.bitcamp.Mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.bitcamp.DTO.CategoryDTO;

@Mapper
public interface CategoryMapper {

	public List<CategoryDTO> AllList();

	public List<CategoryDTO> pList();

	public List<CategoryDTO> cpList(int cno);

	public List<CategoryDTO> allList();

	public int addresult(CategoryDTO dto);

	public int delete(int pno);

	//public int addimg(String imgname);

	public List<CategoryDTO> adplist();

	public int totalCount(HashMap<String, Object> o);

	public List<CategoryDTO> list(HashMap<String, Object> o);

	public CategoryDTO update(int pno);

	public int updateresult(CategoryDTO dto);

	public List<CategoryDTO> admincategorylist();

	public List<CategoryDTO> adallList();

	public List<CategoryDTO> adcpList(int cno);

	public int totalCountcount(HashMap<String, Object> o);

	public List<CategoryDTO> plist(HashMap<String, Object> o);

	public int addallresult(HashMap<String, Object> hm);
}
