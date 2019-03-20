package com.movie.ctrl;


import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.movie.domain.GoodsVO;
import com.movie.service.GoodsService;
import com.movie.service.MemberService;;

@Controller
@RequestMapping("/funding/*")
public class FundingController {
	@Inject
	private GoodsService gService;
	@Inject
	private MemberService mService;
	@RequestMapping("funding.do")
	public String funding() {
		return "redirect:getList.do";
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
	public String insertBoard(String editor,GoodsVO gvo) {
		System.err.println("저장할 내용 : " + editor);
		
		String target = "<img";
		int target_num = editor.indexOf(target);
		String result ="";
		if(target_num >=0) {
		result = editor.substring(target_num,(editor.substring(target_num).indexOf(">")+target_num)+1);
		}
		
		gvo.setMainPic(result);
		
		gService.GoodsInsert(gvo);
		
		
		return "funding/funding";
	}
	@RequestMapping(value = "/getList.do")
	public String getList(Model model) {
		
		List<GoodsVO> glist = gService.getList();
		model.addAttribute("glist",glist);
		
		return "funding/funding";
	}
	@RequestMapping(value = "/goodsView.do")
	public String goodsView(@RequestParam("num")int num,Model model) {
		
		GoodsVO gVO = gService.goodsDetail(num);
		model.addAttribute("gVO",gVO);
		
		return "funding/fundingView";
	}
}
