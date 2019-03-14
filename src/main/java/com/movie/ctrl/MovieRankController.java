package com.movie.ctrl;

import java.awt.List;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/main/*")
public class MovieRankController {
	@GetMapping(value = "/getMovieRank",produces = { MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE })
	public String movie(Model model,RedirectAttributes redirectAttributes) {
		SimpleDateFormat format1 = new SimpleDateFormat ( "yyyyMMdd");
		
		Date time1= new Date();
		String today = format1.format(time1);
		int todayS = Integer.parseInt(today);
		String targetDt = todayS-1+"";			//조회일자
		String itemPerPage ="10"; 		//결과row수
		String multiMovieYn = "";		//“Y” : 다양성 영화 “N” : 상업영화 (default : 전체)
		String repNationCd = "";			//“K: : 한국영화 “F” : 외국영화 (default : 전체)
		String wideAreaCd = "";				//“0105000000” 로서 조회된 지역코드
		
		// 발급키
		String key = "430156241533f1d058c603178cc3ca0e";
		String apiURL= "http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json";
		apiURL +="?key="+key;
		apiURL +="&targetDt="+targetDt; apiURL +="&itemPerPage="+itemPerPage; 
		apiURL +="&multiMovieYn="+multiMovieYn; 
		apiURL +="&repNationCd="+repNationCd; 
		apiURL +="&wideAreaCd="+wideAreaCd;
		 
		System.out.println("apiURL="+apiURL);
		
		 StringBuffer res = null;
		    try {
		      URL url = new URL(apiURL);
		      HttpURLConnection con = (HttpURLConnection)url.openConnection();
		      con.setRequestMethod("GET");
		      int responseCode = con.getResponseCode();
		      BufferedReader br;
		      if(responseCode==200) {
		        br = new BufferedReader(new InputStreamReader(con.getInputStream(),"UTF-8"));
		      } else {  
		        br = new BufferedReader(new InputStreamReader(con.getErrorStream(),"UTF-8"));
		      }
		      String inputLine;
		      res = new StringBuffer();
		      while ((inputLine = br.readLine()) != null) {
		        res.append(inputLine);
		      }
		      br.close();
		      if(responseCode==200) {
		    	  System.out.println(res.toString());
		      }
		    } catch (Exception e) {
		      System.out.println(e);
		    }
		  String origin_str = res.toString();
		  JSONParser jsonParser = new JSONParser();
		  //
		  //JSON데이터를 넣어 JSON Object 로 만들어 준다.
          JSONObject jsonObject;
          JSONObject responseObject;
          ArrayList<String> movieRankName = new ArrayList<String>();
          ArrayList<String> movieRankAcc = new ArrayList<String>();
		try {
			jsonObject = (JSONObject) jsonParser.parse(origin_str);
			responseObject = (JSONObject)jsonObject.get("boxOfficeResult");
			
			JSONArray jsonArray = (JSONArray)responseObject.get("dailyBoxOfficeList");
			
			for(int i=0;i<jsonArray.size();i++) {
	              //JSON name으로 추출
				JSONObject objectInArray = (JSONObject) jsonArray.get(i);
	              movieRankName.add(objectInArray.get("movieNm").toString());
	              movieRankAcc.add(objectInArray.get("salesAcc").toString());

	          }
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
           
          
    
		/*
		 * System.out.println("요기서 토큰파싱합시다:" + res.toString()); String origin_str =
		 * res.toString(); //우루루 다 있는거 이중에서 토큰 파싱하자
		 * 
		 * String token=""; JSONParser jsonparser = new JSONParser();
		 */
		redirectAttributes.addAttribute("movieRankName", movieRankName);
		redirectAttributes.addAttribute("movieRankAcc", movieRankAcc);
		return "redirect:/main/getMovie";
	}
	
}
