package com.movie.ctrl;


import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.movie.domain.GoodsPriceVO;
import com.movie.domain.GoodsVO;
import com.movie.domain.PayVO;
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
	public String insertBoard(GoodsVO gvo,String editor,@RequestParam("goodDate")int date,Model model) {
		
		System.err.println("저장할 내용 : " + editor);
		
		String target = "<img";
		int target_num = editor.indexOf(target);
		String result ="";
		if(target_num >=0) {
		result = editor.substring(target_num,(editor.substring(target_num).indexOf(">")+target_num)+1);
		}
		
		// Calendar 클래스 인스턴스 생성 
		Calendar cal = Calendar.getInstance(); 
		int y,m,d;	
		//-- 연, 월, 일, 요일
		y =cal.get(Calendar.YEAR);
		m = cal.get(Calendar.MONTH)+1; 
		d = cal.get(Calendar.DATE); 
		// 현재 연, 월, 일, 요일 확인(가져오기 : get()) 
		System.out.printf("오늘 날짜 : %d-%d-%d \n",y,m,d); 
		 cal.add(Calendar.DATE,date); 
		 
		System.out.println("\n========[확인결과]========"); 
		//System.out.printf("%d일 후 : %d-%d-%d %s\n",num,y,m,d,week[w-1]); 
		System.out.printf("%d일 후 : %tF %tA \n",date,cal,cal); 
	
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		String strDate = sdf.format(cal.getTime());

		gvo.setContent(editor);
		gvo.setMainPic(result);
		gvo.setUntilDate(strDate);
		
		gService.GoodsInsert(gvo);
	
		System.out.println(gvo.getPrice().length);
		for(int i=0;i<gvo.getProduct().length;i++) {
			GoodsPriceVO pvo = new GoodsPriceVO();
			pvo.setPrice(gvo.getPrice()[i]);
			pvo.setProduct(gvo.getProduct()[i]);
			gService.goodsPriceInsert(pvo);
		}
		
		List<GoodsVO> glist = gService.getList(0);
		model.addAttribute("glist",glist);
		return "redirect:getList.do";
	}
	@RequestMapping(value = "/updateBoard.do", method = RequestMethod.POST)
	public String updateBoard(GoodsVO gvo,String editor,Model model) {
		
		String target = "<img";
		int target_num = editor.indexOf(target);
		String result ="";
		if(target_num >=0) {
		result = editor.substring(target_num,(editor.substring(target_num).indexOf(">")+target_num)+1);
		}
		
		gvo.setContent(editor);
		gvo.setMainPic(result);
		
		gService.GoodsUpdate(gvo);
	
		
		gService.goodsPriceDelete(gvo.getNum());
		for(int i=0;i<gvo.getProduct().length;i++) {
			GoodsPriceVO pvo = new GoodsPriceVO();
			pvo.setGoodsnum(gvo.getNum());
			pvo.setPrice(gvo.getPrice()[i]);
			pvo.setProduct(gvo.getProduct()[i]);
			gService.goodsPriceReInsert(pvo);
		}
		
		List<GoodsVO> glist = gService.getList(0);
		model.addAttribute("glist",glist);
		return "redirect:getList.do";
	}
	@RequestMapping(value = "/getList.do")
	public String getList(Model model,Integer page) {
		int count= gService.getListCnt();
		int pageCnt =count/6;
		if(page==null) {
			page=1;
		}
		int currentPage =page;
		int pageSize = 6;
		
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
		
		int page2 =(page-1)*6;
		List<GoodsVO> glist = gService.getList(page2);
		model.addAttribute("glist",glist);
		model.addAttribute("pageCnt",pageCnt);
		
		return "funding/funding";
		
	}
	
	
	
	@RequestMapping(value = "/goodsView.do")
	public String goodsView(@RequestParam("num")int num,Model model) {
		
		GoodsVO gVO = gService.goodsDetail(num);
		ArrayList<GoodsPriceVO> voArr=gService.goodsPriceDetal(num);
		model.addAttribute("pList",voArr);
		model.addAttribute("gVO",gVO);
		
		return "funding/fundingView";
	}
	@PostMapping("/fundPay")
	public String fundPay(PayVO vo,String priceSelect,Model model) {
		String[] arr;
		arr = priceSelect.split(":");
		 vo.setPrice(Integer.parseInt(arr[0]));
		 gService.goodsCurrentUpdate(vo);
		 gService.goodsPayInsert(vo);
		 System.out.println("가격:"+arr[0]);
		return "redirect:getList.do";
		
		
	}
	
	
	@GetMapping("/gVOUpdate.do")
	public String gVOUpdate(int num,Model model) {	
		GoodsVO gvo = gService.goodsDetail(num);
		List<GoodsPriceVO> plist = gService.getGoodsPrice(num);
		model.addAttribute("gvo", gvo);
		model.addAttribute("plist", plist);
		return "funding/fundingUpdate";
		
		
	}
	
}


