package com.FirstProject;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.FirstProject.testBO.TestBO;

@Controller
public class testController {

	
	@RequestMapping("/test")
	public String test() {
		
		return "test";
	}
	
	@Autowired
	private TestBO testBo;
	
	@RequestMapping("/test2")
	@ResponseBody
	public List<String> test1(){
		
		List<String> test = testBo.test1();
		return  test;
	}
	
}
