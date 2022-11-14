package com.FirstProject.login.bo;
import java.security.NoSuchAlgorithmException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import com.FirstProject.common.SHA256;
import com.FirstProject.login.model.Mail;
import com.FirstProject.login.model.User;

@Service
public class SendEmail {
	
	@Autowired
	private UserBO userBo;
	
	@Autowired
	private JavaMailSender mailSender;

	public void setMailSender(JavaMailSender mailSender) {
		this.mailSender = mailSender;
	}


	//메일 내용 생성
	public Mail createMailAndChangePassword(User user) throws NoSuchAlgorithmException {
		
		String str = getTempPassword();
		Mail mail = new Mail();
		mail.setAddress(user.getUserEmail());
		mail.setTitle(user.getUserId() + "님의 그때그곳 임시비밀번호 안내 이메일 입니다.");
		mail.setMessage("안녕하세요. 그때그곳 임시번호 안내 관련 이메일 입니다." + "[" + user.getUserId() + "]" + "님의 임시번호는 "
		+ str + "입니다.");
		updataedPassword(str, user.getUserEmail());
		return mail;
	}
	
	//비밀번호 업데이트
	public void updataedPassword(String str, String userEmail) throws NoSuchAlgorithmException {
		
		
		SHA256 sha256 = new SHA256();
		String pw = sha256.encrypt(str);
		
		String userId = userBo.findUserByUserId(userEmail);
		userBo.updataUserPassword(userId, pw);
	}
	
	//랜덤함수로 임시비밀번호 구문 만들기
	public String getTempPassword() {
		
		char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F',
                'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' };

        String str = "";
        
        int idx = 0;
        for ( int i = 0; i <10; i++) {
        	
        	idx = (int)(charSet.length * Math.random());
        	str += charSet[idx];
        }
        
        return str;
	}
	
	
	//메일보내기
	public void mailSend(Mail mail) {
		System.out.println("전송 완료!");
		SimpleMailMessage message = new SimpleMailMessage();
		message.setTo(mail.getAddress());
		message.setFrom("kkh_0121@naver.com");
		message.setSubject(mail.getTitle());
		message.setText(mail.getMessage());
		mailSender.send(message);
	}
	
	
	
}
