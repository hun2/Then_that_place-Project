package com.FirstProject;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@SpringBootApplication
public class FirstProjectApplication extends SpringBootServletInitializer {
//서버에 올릴때 springBootservlet 저게 필요함. 꼭 상속받아야함.
	public static void main(String[] args) {
		SpringApplication.run(FirstProjectApplication.class, args);
	}
	
	
	
}
