package com.movie.ctrl;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;

import javax.inject.Inject;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.movie.domain.MemberVO;
import com.movie.service.MemberService;

@Controller
@RequestMapping("/member/*")
public class MemberController {

	@Inject
	private MemberService service;
	
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
	@PostMapping("/join")
	public String join(Model model,MemberVO vo) {
		service.memberInsert(vo);
		return "redirect:/";
	}
	
	@GetMapping("/idCheck")
	public void idCheck() {
		
	}
 @PostMapping("/idCheck")
 @ResponseBody
  public String idCheck( String id,Model model) {
	 String checking= "";
		System.out.println(id);
	 String check = service.idCheck(id);
		System.out.println(check);
		if(check==null) {
			checking="ok";
		}else{
			checking="no";
		}
		System.out.println(checking);
		return checking;
 	}
 //로그인
 @GetMapping("/login")
 @ResponseBody
	 public int login(String id, String password,Model model) {
		MemberVO vo = service.memberCheck(id, password);
		int check=0;
		if(vo.getId()==null) {
			check=0;
		}else if(password.equals(vo.getPassword())) {
			model.addAttribute("id",id);
			check=1;
		}else {
			check=-1;
				}
			return check;
	 }
}
