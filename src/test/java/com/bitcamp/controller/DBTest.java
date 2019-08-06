package com.bitcamp.controller;

import static org.junit.Assert.assertNotNull;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bitcamp.conf.DBConf;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes=DBConf.class)
public class DBTest {
	
	@Autowired
	private DataSource ds;
	
	/*
	@Autowired
	private SqlSessionFactoryBean fact;
	*/
	@Test
	public void test() {
		assertNotNull(ds);
	}
	
}
