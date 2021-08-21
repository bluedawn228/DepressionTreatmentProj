package com.mulcam.project.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@Controller
public class SmallTalkImpl implements SmallTalk {
	
	@Override
	@GetMapping("/SmallTalk")
	public String smallTalk() {
		return "smalltalk";
	}
	
	@PostMapping("/SmallTalkPost")
	@Override
	public void SmallTalkPost(@RequestBody Map<String, Object> map) throws Exception{
		
		//구글의 json parser 라이브러리
		Gson gson 					= new Gson();
		
		//map 으로 받은 테이터를 Json String 형태로 변환
		JsonObject jobj = new JsonObject();
		jobj.addProperty("utext", map.get("utext").toString());
		jobj.addProperty("lang", map.get("lang").toString());
		String jsonValue = gson.toJson(jobj);
		
		System.out.println(jsonValue);
		// jsonPaserPser 클래스 객체를 만들고 해당 객체에 param의 id 오브젝트 -> 문자열 파싱 -> jsonElement 파싱
	   
		
		String inputLine = null;
		StringBuffer outResult = new StringBuffer();
		String sendUrl = "https://wsapi.simsimi.com/190410/talk";
		String apiKey = "jzqqmBLbWld7UBip8m1Pt9mJLhb8odWhcwtlcuf0";
		
		try {
			System.out.println("REST API Start");
			URL url = new URL(sendUrl);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setDoOutput(true);
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Content-Type", "application/json");
			conn.setRequestProperty("Accept-Charset", "UTF-8");
			conn.setRequestProperty("x-api-key", apiKey);
			conn.setConnectTimeout(10000);
			conn.setReadTimeout(10000);
			
			OutputStream os = conn.getOutputStream();
			os.write(jsonValue.getBytes("UTF-8"));
			os.flush();
			
			//리턴결과 읽기
			BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
			while ((inputLine = in.readLine()) != null ) {
				outResult.append(inputLine);
			}
			
			conn.disconnect();
			System.out.println("REST API End");
			
		} catch(Exception e) {
			e.printStackTrace();

		} //try
		
		System.out.println(outResult.toString());
		//return outResult.toString();
	} // method

} // class
