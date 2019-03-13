package com.movie.ctrl;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/movie/*")
public class MovieController {
	@GetMapping(value = "/getMovie",produces = { MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE })
	public void movie() {
		String clientId = "qaIfvFuA2ML2UDeEWxaE";//애플리케이션 클라이언트 아이디값";
		String clientSecret = "6MR8wmHlRk";//애플리케이션 클라이언트 시크릿값";
		try {
			String text = URLEncoder.encode("스파이더맨", "UTF-8");
			String apiURL = "https://openapi.naver.com/v1/search/movie?query="+ text; // json 결과
			//String apiURL = "https://openapi.naver.com/v1/search/blog.xml?query="+ text; // xml 결과
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection)url.openConnection();
			con.setRequestMethod("GET");
			con.setRequestProperty("X-Naver-Client-Id", clientId);
			con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
			int responseCode = con.getResponseCode();
			BufferedReader br;
			if(responseCode==200) { // 정상 호출
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else {  // 에러 발생
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			String inputLine;
			StringBuffer resp = new StringBuffer();
			while ((inputLine = br.readLine()) != null) {
				resp.append(inputLine);
			}	
			br.close();
			
			System.out.println(resp.toString());
			
			String origin_str = resp.toString();
	        System.out.println("내가원하는거 : "+ origin_str);
			 
	        JSONParser jsonparser = new JSONParser();
			JSONObject jsonObject = (JSONObject)jsonparser.parse(origin_str);
			JSONObject responseObject = (JSONObject)jsonObject.get("response");
			
			String email = (String) responseObject.get("email");
			String name = (String) responseObject.get("name");
			String id = (String) responseObject.get("id");
			
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
	}
}
