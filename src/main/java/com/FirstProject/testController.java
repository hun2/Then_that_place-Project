package com.FirstProject;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.FirstProject.login.bo.UserBO;
import com.FirstProject.login.model.User;

@Controller
public class testController {

	@Autowired
	private UserBO userBo;
	
	@RequestMapping("/test")
	public String test(Model model) {
		int startNum = 0;
		int EndNum = 0;
		List<User> user = userBo.getTest(startNum, EndNum);
		model.addAttribute("user", user);
		return "test";
	}
	
	@RequestMapping("/tests")
	@ResponseBody
	public Map<String, Object> test2(int page) {
		Map<String,Object> result = new HashMap<>();
		int items_per_page = 3; 
		int endNum = items_per_page;
		int startNum = page * items_per_page - (items_per_page - 1);
		List<User> user = userBo.getTest(startNum, endNum);
		
		result.put("user", user);
		
		return result;
	}
}
