package com.movie.ctrl;


import java.util.HashMap;
import java.util.List;
import java.util.Properties;

import javax.inject.Inject;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.movie.domain.GoodsVO;
import com.movie.domain.MemberVO;
import com.movie.domain.getMyFundingVO;
import com.movie.service.GoodsService;
import com.movie.service.MemberService;

@Controller
@RequestMapping("/member/*")
public class MemberController {

	@Inject
	PasswordEncoder passwordEncoder;
	@Inject
	private MemberService service;
	@Inject
	private GoodsService gService;

	@GetMapping("/join")
	public void join() {
	}
	@GetMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "home";
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
	//회원가입
	@PostMapping("/join")
	public String join(Model model,MemberVO vo)  throws Exception{

		String encPassword = passwordEncoder.encode(vo.getPassword());
		vo.setPassword(encPassword);
		System.out.println("암호화된 비밀번호 : "+vo.getPassword());
		service.memberInsert(vo);
		return "redirect:/";
	}

	@GetMapping("/idCheck")
	public void idCheck() {

	}
	@PostMapping("/idCheck")
	@ResponseBody
	public String idCheck(@RequestParam("id")String id,Model model) {
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
	@PostMapping("/login")
	@ResponseBody
	public int login(@RequestParam("id")String id, @RequestParam("password")String password,Model model) {
		String pass = service.memberCheck(id, password);
		String encPassword = passwordEncoder.encode(password);

		boolean isMatch = passwordEncoder.matches(password,pass);
		System.out.println(pass+":저장된패스워드");
		System.out.println(isMatch+"암호화된 패스워드");
		int check=0;
		if(pass==null) {
			check=0;
		}else if(isMatch) {
			model.addAttribute("id",id);
			check=1;
		}else{
			check=-1;
		}

		return check;
	}
	//로그인성공->메인페이지로
	@GetMapping("/login")
	public String login(Model model,String word,String id,HttpSession session) {
		session.setAttribute("id", id);
		return "home";
	}
	//마이페이지(회원정보 모두 불러오기)
	@GetMapping("/mypage")
	public String mypage(String pageNum,Model model,HttpSession session) {
		//검색일때
		String id=session.getAttribute("id").toString();
		
		//페이징
		if(pageNum == null)pageNum = "1";
		int currentPage = Integer.parseInt(pageNum);
		int count = gService.fundingCount(id);
		int pageSize = 4;
			
		int totpage = count/pageSize+(count%pageSize==0?0:1);
		int blockpage =3; 
		int startpage=((currentPage-1)/blockpage)*blockpage+1;
		int endpage=startpage+blockpage-1;
		
		if(endpage > totpage) endpage=totpage;
		
		model.addAttribute("totpage", totpage);
		model.addAttribute("startpage", startpage);
		model.addAttribute("endpage", endpage);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("blockpage", blockpage);
		
		int number=count-(currentPage-1)*pageSize;
		model.addAttribute("number",number);
		model.addAttribute("count", count);
		model.addAttribute("sign","sign");
		
		int page2 =(currentPage-1)*4;
		
		List<getMyFundingVO> fundingList = gService.getMyFunding(id,page2);
		
	
		
		MemberVO vo = service.memberInfo(id);
		int myFunding = service.getAllFunding(id);
		
		List<GoodsVO>financingList = gService.getMyFinancing(id);

		
		
		model.addAttribute("financingList",financingList);
		model.addAttribute("vo",vo);
		model.addAttribute("myFunding",myFunding);
		model.addAttribute("fundingList",fundingList);
		session.setAttribute("id", id);
		
		
		
		

		return "member/mypage";
	}	
	
	@ResponseBody
	@PostMapping("/mypage")
	public String mypage2(String pageNum,Model model,HttpSession session) {
		//검색일때
		String id=session.getAttribute("id").toString();
		
		//페이징
		if(pageNum == null)pageNum = "1";
		int currentPage = Integer.parseInt(pageNum);
		int count = gService.fundingCount(id);
		int pageSize = 4;
			
		int totpage = count/pageSize+(count%pageSize==0?0:1);
		int blockpage =3; 
		int startpage=((currentPage-1)/blockpage)*blockpage+1;
		int endpage=startpage+blockpage-1;
		
		if(endpage > totpage) endpage=totpage;
		
		model.addAttribute("totpage", totpage);
		model.addAttribute("startpage", startpage);
		model.addAttribute("endpage", endpage);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("blockpage", blockpage);
		
		int number=count-(currentPage-1)*pageSize;
		model.addAttribute("number",number);
		model.addAttribute("count", count);
		model.addAttribute("sign","sign");
		
		int page2 =(currentPage-1)*4;
		
		List<getMyFundingVO> fundingList = gService.getMyFunding(id,page2);
		
	
		
	

		int myFunding = service.getAllFunding(id);
		
		

		model.addAttribute("myFunding",myFunding);
		model.addAttribute("fundingList",fundingList);
		session.setAttribute("id", id);
		
	
		return "member/myPageList";
	}

	
	@GetMapping("/myfunding")
	public String myFunding(String id,Model model,HttpSession session) {
		return "";

	}
	
	@GetMapping("findId")
	public String findId() {
		return "member/findId";
	}
	@ResponseBody
	@PostMapping("findId")
	public String findId(Model model,String name,String email) {		
		String id=service.findId(name,email);
		System.out.println("아이디는?"+id);
		return id;
	}
}





