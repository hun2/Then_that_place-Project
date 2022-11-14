package com.FirstProject.common;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class FileManagerServices {

	public static final String FILE_UPLOAD_PATH = "C:\\Users\\김기훈\\Desktop\\then_that_place\\images/";

	public String saveFile(String userId, MultipartFile file) {

		// uid와 파일을 파라미터로 던져준다.
		// 파일 디렉토리 예 ) kihun_20221024/exmple.png
		// 예) 아이디_올린시간/파일명. 파일명은 앵간하면 영어로.

		// 파일 경로 설정
		String directoryName = userId + "_" + System.currentTimeMillis() + "/"; // test_20221106 까지 쓴것.
		String filePath = FILE_UPLOAD_PATH + directoryName; // C:\\Users\\김기훈\\Desktop\\then_that_place\\images/test20_20221024/"
		
		
		//파일 저장 설정
		File directory = new File(filePath);
		if(directory.mkdir() == false) {
			return null;
		}
		
		//파일 업로드 byte 단위 설정
		try {
			byte[] bytes = file.getBytes();
			Path path = Paths.get(filePath + file.getOriginalFilename());
			Files.write(path, bytes);
		} catch (IOException e) {
			e.printStackTrace();
			return null;
			
		}
		//성공시 이미지 url path 를 리턴
			
		return "/images/" + directoryName + file.getOriginalFilename();
		
	}
}
