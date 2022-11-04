package com.FirstProject.testBO;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.FirstProject.testDAO.TestDAO;

@Service
public class TestBO {

	
	@Autowired
	private TestDAO testDao;
	
	
	public List<String> test1() {
		
		return testDao.test1();
	}
}
