package com.bitcamp.controller;

import static org.junit.Assert.assertEquals;
import static org.springframework.test.web.client.response.MockRestResponseCreators.withBadRequest;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.bitcamp.DTO.CategoryDTO;
import com.bitcamp.Service.CategoryService;
import com.bitcamp.Service.CategoryServiceImple;
import com.bitcamp.conf.DBConf;

@RunWith(SpringJUnit4ClassRunner.class)
/*@ContextConfiguration(classes=DBConf.class)*/
@ContextConfiguration(value="file:src\\main\\webapp\\WEB-INF\\spring\\root-context.xml")
public class DBTest {
	/*
	@Autowired
	private DataSource ds;
	*/
	
	/*@Autowired
	private SqlSessionFactoryBean fact;
	
	@Test
	public void test() {
		assertNotNull(fact);
	}
	*/
	
	@Resource(name="categoryServiceImple")
	private CategoryServiceImple  service;
	
	@Test
	public void t1()
	{
		CategoryDTO dto = new CategoryDTO();
		dto.setCno(1);
		dto.setPname("sd");
		dto.setOprice(3);
		dto.setDprice(4);
		dto.setContent("sdkj");
	    assertEquals(1,service.addresult(dto, "sd"));
		
	}
	
	
}
