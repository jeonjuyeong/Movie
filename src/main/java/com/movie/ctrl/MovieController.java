package com.movie.ctrl;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
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
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/movie/*")
public class MovieController {
	@GetMapping(value = "/getMovie",produces = { MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE })
	public String movie(Model model,@RequestParam("movieRankName")ArrayList<String> movieRankName,@RequestParam("movieRankAcc")ArrayList<String> movieRankAcc) {
		String clientId = "qaIfvFuA2ML2UDeEWxaE";//애플리케이션 클라이언트 아이디값";
		String clientSecret = "6MR8wmHlRk";//애플리케이션 클라이언트 시크릿값";
		try {
			SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy");

			Date time1= new Date();
			String today = format1.format(time1);
			int todayY = Integer.parseInt(today);

			for(int i=0;i<movieRankName.size();i++) {
				String text = URLEncoder.encode(movieRankName.get(1), "UTF-8");
				String apiURL = "https://openapi.naver.com/v1/search/movie?query="+text;
				apiURL += "&yearfrom="+todayY; // json 결과
				apiURL += "&yearto="+todayY; // json 결과
				//String apiURL = "https://openapi.naver.com/v1/search/blog.xml?query="+ text; // xml 결과
				URL url = new URL(apiURL);
				HttpURLConnection con = (HttpURLConnection)url.openConnection();
				con.setRequestMethod("GET");
				con.setRequestProperty("X-Naver-Client-Id", clientId);
				con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
				int responseCode = con.getResponseCode();
				BufferedReader br;
				if(responseCode==200) { // 정상 호출
					br = new BufferedReader(new InputStreamReader(con.getInputStream(),"UTF-8"));
				} else {  // 에러 발생
					br = new BufferedReader(new InputStreamReader(con.getErrorStream(),"UTF-8"));
				}
				String inputLine;
				StringBuffer resp = new StringBuffer();
				while ((inputLine = br.readLine()) != null) {
					resp.append(inputLine);
				}	
				br.close();

				System.out.println(resp.toString());
				String origin_str = resp.toString();
				try {
					JSONParser jsonParser = new JSONParser();
					JSONObject jsonObject;
					jsonObject = (JSONObject) jsonParser.parse(origin_str);

					JSONArray jsonArray = (JSONArray)jsonObject.get("items");

					for(int i=0;i<jsonArray.size();i++) {
						//JSON name으로 추출
						JSONObject objectInArray = (JSONObject) jsonArray.get(i);

						String title = (String) jsonObject.get("title");
						String image = (String) jsonObject.get("image");
						String subtitle = (String) jsonObject.get("subtitle");
						String pubDate = (String) jsonObject.get("pubDate");
						String director = (String) jsonObject.get("director");
						String actor = (String) jsonObject.get("actor");
						String userRating = (String) jsonObject.get("userRating");
					}
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

			}//여기까지 for문
			/*
			 * model.addAttribute("title",title); model.addAttribute("image",image);
			 * model.addAttribute("subtitle",subtitle);
			 * model.addAttribute("pubDate",pubDate);
			 * model.addAttribute("director",director); model.addAttribute("actor",actor);
			 * model.addAttribute("userRating",userRating);
			 */

			/*HttpSession session = request.getSession();
			session.setAttribute("name", name);
			session.setAttribute("id",id);
			session.setAttribute("email", email);
			request.setAttribute("sign", "sign");

			RequestDispatcher rd = request.getRequestDispatcher("/api/getMovie.jsp");

			rd.forward(request, response);*/
		} catch (Exception e) {
			System.out.println(e);
		}
		return "";
	}
}
