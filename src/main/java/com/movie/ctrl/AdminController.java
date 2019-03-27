package com.movie.ctrl;


import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.movie.domain.GoodsVO;
import com.movie.domain.MemberVO;
import com.movie.domain.PayVO;
import com.movie.service.AdminService;;

@Controller
@RequestMapping("/admin/*")
public class AdminController {
	@Inject
	private AdminService service;
	
	@RequestMapping("adminMain.do")
	public String adminMain(Model model) {
		List<MemberVO> mVO =service.memberList();
		List<GoodsVO> gVO = service.goodsList();
		List<PayVO> pVO = service.payList();
		 model.addAttribute("mVO",mVO);
		 model.addAttribute("gVO",gVO);
		 model.addAttribute("pVO",pVO);
		return "admin/adminMain";
	}
	
	@RequestMapping("memberDelete")
	public String memberDelete(String id){
		service.memberDelete(id);
		return "admin/adminMain";
	}
	@RequestMapping("goodsDelete")
	public String goodsDelete(int num){
		service.goodsDlelete(num);
		return "admin/adminMain";
	}
	@RequestMapping("fundingInsert.do")
	public String fundingInsert() {
		return "funding/fundingInsert";
	}

}


