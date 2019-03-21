package com.movie.ctrl;


import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.movie.domain.GoodsPriceVO;
import com.movie.domain.GoodsVO;
import com.movie.domain.PayVO;
import com.movie.service.GoodsService;
import com.movie.service.MemberService;;

@Controller
@RequestMapping("/admin/*")
public class AdminController {
	@Inject
	private GoodsService gService;
	@Inject
	private MemberService mService;
	
	@RequestMapping("adminMain.do")
	public String adminMain() {
		return "admin/adminMain";
	}
	@RequestMapping("fundingInsert.do")
	public String fundingInsert() {
		return "funding/fundingInsert";
	}

}


