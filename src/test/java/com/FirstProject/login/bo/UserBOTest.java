package com.FirstProject.login.bo;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;

import com.FirstProject.login.model.User;


@SpringBootTest
class UserBOTest {
	
	@Autowired
	UserBO userBo;
	
	@Transactional   // 실질적으로 행동했다가 다시 롤백해주는 어노테이션이라 붙이는것이 좋다 (특히나 db쪽 insert 테스트 경우)
	@Test
	void 유저추가테스트() {
		User user = new User();
		userBo.getUserIdByUserEmail(user);
	}
	
	
	@Test
	void 유저가져오기() {
		User user = new User();
		User user2  = userBo.getUserIdByUserEmail(user);
		assertNotNull(user2);
	}
}
