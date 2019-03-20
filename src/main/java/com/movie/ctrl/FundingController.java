package com.movie.ctrl;


import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.movie.domain.GoodsPriceVO;
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
	public String insertBoard(ArrayList<GoodsPriceVO> pvo,GoodsVO vo,@RequestParam("editor")String editor,@RequestParam("goodDate")int date) {
		System.err.println("저장할 내용 : " + editor);
		
		String target = "<img";
		int target_num = editor.indexOf(target);
		String result ="";
		if(target_num >=0) {
		result = editor.substring(target_num,(editor.substring(target_num).indexOf(">")+target_num)+1);
		}
		String[] week = {"일요일","월요일","화요일","수요일","목요일","금요일","토요일"};
		// Calendar 클래스 인스턴스 생성 
		Calendar cal = Calendar.getInstance(); 
		int y,m,d,w;	
		//-- 연, 월, 일, 요일
		y =cal.get(Calendar.YEAR);
		m = cal.get(Calendar.MONTH)+1; 
		d = cal.get(Calendar.DATE); 
		w = cal.get(Calendar.DAY_OF_WEEK); 
		// 현재 연, 월, 일, 요일 확인(가져오기 : get()) 
		System.out.printf("오늘 날짜 : %d-%d-%d %s\n",y,m,d,week[w-1]); 
		 cal.add(Calendar.DATE,date); 
		 String calS=cal.toString();
		 vo.setUntilDate(calS);
		System.out.println("\n========[확인결과]========"); 
		//System.out.printf("%d일 후 : %d-%d-%d %s\n",num,y,m,d,week[w-1]); 
		System.out.printf("%d일 후 : %tF %tA \n",date,cal,cal); 
		
		vo.setContent(editor);
		vo.setMainPic(result);
		gService.GoodsInsert(vo);
	
		gService.goodsPriceInsert(pvo);

		
		
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
