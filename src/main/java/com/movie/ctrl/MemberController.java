package com.movie.ctrl;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member/*")
public class MemberController {

	@GetMapping("/join")
	public void join() {
	}
	@GetMapping("/emailCheck")
	public String emailCheck(String email,Model model) {
		// TODO Auto-generated method stub
		System.out.println(email);
	
		//인증 랜덤 번호 생성 
		StringBuffer str = new StringBuffer();
		for(int i=0;i<7;i++) {
			int n = (int)(Math.random()*10);
			str.append(n);
		}
		String num = str.toString();
		
		try {
			String host = "smtp.naver.com";
			final String username = "junjy93";
			final String password = "jkl78569!";
			int port = 465;
			
			String subject = "HELLO WORD 인증번호입니다.";
			String content = "인증번호 [" +num+ "]";
			
			Properties props = System.getProperties();
			
			
			props.put("mail.smtp.host", host);
			props.put("mail.smtp.port", port);
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.ssl.enable", "true");
			props.put("mail.smtp.ssl.trust", host);
			
			Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
				protected javax.mail.PasswordAuthentication getPasswordAuthentication(){
					return new javax.mail.PasswordAuthentication(username, password);
				}
			});
			session.setDebug(true);
			
			Message mimeMessage = new MimeMessage(session);
			mimeMessage.setFrom(new InternetAddress("junjy93@naver.com"));
			mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(email));
			
			mimeMessage.setSubject(subject);
			mimeMessage.setText(content);
			
			Transport.send(mimeMessage);
			
			System.out.println("전송성공 email :" + email);
		} catch (AddressException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		model.addAttribute("num",num);
		model.addAttribute("email", email);
		return "member/emailCheck";
	}
}
