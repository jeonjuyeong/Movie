package com.movie.ctrl;


import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.movie.service.MemberService;
import com.movie.domain.GoodsVO;
import com.movie.service.GoodsService;;

@Controller
@RequestMapping("/funding/*")
public class FundingController {
	@Inject
	private GoodsService Gservice;
	@Inject
	private MemberService Mservice;
	@RequestMapping("funding.do")
	public String funding() {
		return "funding/funding";
	}
	@RequestMapping("fundingInsert.do")
	public String fundingInsert() {
		return "funding/fundingInsert";
	}

	@RequestMapping(value = "/coding.do")
	public String coding() {
		return "coding";
	}

	@RequestMapping(value = "/insertBoard.do", method = RequestMethod.POST)
	public String insertBoard(String editor) {
		System.err.println("저장할 내용 : " + editor);
		
		GoodsVO vo = new GoodsVO();
		vo.setContent(editor);
		
		Gservice.GoodsInsert(vo);
		
		
		return "funding/funding";
	}

}
