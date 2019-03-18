package com.movie.ctrl;


import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.movie.service.MemberService;

@Controller
@RequestMapping("/funding/popup/*")
public class PopupAction {
	@Inject
	private MemberService service;
	@RequestMapping("upload.do")
	public String photo_uploader() {
		return "file_uploader";
	}
	
}
