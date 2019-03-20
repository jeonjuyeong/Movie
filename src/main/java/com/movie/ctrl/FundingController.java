package com.movie.ctrl;


import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	public String insertBoard(String editor) {
		System.err.println("저장할 내용 : " + editor);
		
		String target = "<img";
		int target_num = editor.indexOf(target);
		String result ="";
		if(target_num >=0) {
		result = editor.substring(target_num,(editor.substring(target_num).indexOf(">")+target_num)+1);
		}
		
		GoodsVO vo = new GoodsVO();
		vo.setContent(editor);
		vo.setMainPic(result);
		
		gService.GoodsInsert(vo);
		
		
		return "funding/funding";
	}
	@RequestMapping(value = "/getList.do")
	public String getList(Model model) {
		
		List<GoodsVO> glist = gService.getList();
		model.addAttribute("glist",glist);
		
		return "funding/funding";
	}
}
