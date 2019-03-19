package com.movie.ctrl;


import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.movie.service.MemberService;

@Controller
@RequestMapping("/funding/*")
public class FundingController {
	@Inject
	private MemberService service;
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
		return "redirect:/coding.do";
	}

}
