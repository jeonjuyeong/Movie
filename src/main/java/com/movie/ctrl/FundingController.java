package com.movie.ctrl;


import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
}
