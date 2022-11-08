package com.koreait.sevenfactory.command.member;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.koreait.sevenfactory.dao.SevenFactoryDAO;
import com.koreait.sevenfactory.dto.MemberDTO;

//서비스 지움
@Service
public class KakaoCommand {
	//implements Command
	
	@Autowired
	private SqlSession sqlSession;
	
	
	public String getAccessToken(String authorize_code) {
	
		String access_Token = "";
		String refresh_Token = "";
		String reqURL = "https://kauth.kakao.com/oauth/token";

		try {
			URL url = new URL(reqURL);

			HttpURLConnection conn = (HttpURLConnection) url.openConnection();

			// POST

			conn.setRequestMethod("POST");
			conn.setDoOutput(true);

			// POST 
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			sb.append("grant_type=authorization_code");
			sb.append("&client_id=60b4cbb2b4d98b3706d239765b492e8c"); 
			sb.append("&redirect_uri=http://localhost:8080/sevenfactory/loginKakao"); 
			sb.append("&code=" + authorize_code);
			bw.write(sb.toString());
			bw.flush();

			
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);

			
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body : " + result);

			
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);

			access_Token = element.getAsJsonObject().get("access_token").getAsString();
			refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();

			System.out.println("access_token : " + access_Token);
			System.out.println("refresh_token : " + refresh_Token);

			br.close();
			bw.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return access_Token;
	}

	public HashMap<String, Object> getUserInfo(String access_Token) {
		//
		HashMap<String, Object> userInfo = new HashMap<String,Object>();
		String reqURL = "https://kapi.kakao.com/v2/user/me";
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");

			//
			conn.setRequestProperty("Authorization", "Bearer " + access_Token);

			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);

			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body : " + result);

			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);
			
			String jid = element.getAsJsonObject().get("id").getAsString();
	         JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
	         JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
	         String nickname = properties.getAsJsonObject().get("nickname").getAsString();
	         String email="";
	         String birthday="";
	         
	         if(kakao_account.getAsJsonObject().get("has_email").getAsString() == "true") {
	            System.out.println("이메일 성공");
	            email = kakao_account.getAsJsonObject().get("email").getAsString(); 
	         }else {
	            email = "test@naver.com";
	         }
	         System.out.println("이메일 성공: " + email);
	         
	         if(kakao_account.getAsJsonObject().get("has_birthday").getAsString() == "true") {
	            System.out.println("생일 성공");
	            birthday = kakao_account.getAsJsonObject().get("birthday").getAsString();
	            
	         }else {
	            birthday = "20221004";
	         }
	         System.out.println("생일 성공 : " + birthday);
	         
	         
	         
	         userInfo.put("id", jid);
	         userInfo.put("nickname", nickname);
	         userInfo.put("email", email);
	         userInfo.put("birthday", birthday);
	         System.out.println("nickname" + nickname);
	         System.out.println("email" + email);
	         System.out.println("birthday" + birthday);

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return userInfo;
	}
	
	
	public void execute1(String name,String email,String id,SqlSession sqlSession, Model model) {

		Map<String, Object> map = model.asMap();
		

		MemberDTO mDTO = new MemberDTO();
	
		System.out.println(); 
		
		mDTO.setmId(id);
		mDTO.setmPw("123");
		mDTO.setmName(name);
		mDTO.setmEmail(email);
		mDTO.setmPhone("0000000000");
		mDTO.setmBirth("12345678");
		mDTO.setmAddr1("대전서구");
		mDTO.setmAddr2("인스빌리베라");
		mDTO.setmZipcode(Integer.parseInt("12345"));
		
		SevenFactoryDAO sDAO = sqlSession.getMapper(SevenFactoryDAO.class);
		sDAO.registor(mDTO);
		
	}

	public void execute1(String name, String email, String id, String birthday, SqlSession sqlSession, Model model) {
		Map<String, Object> map = model.asMap();
		MemberDTO mDTO = new MemberDTO();
		System.out.println(); 
		
		mDTO.setmId(id);
		mDTO.setmPw("123");
		mDTO.setmName(name);
		mDTO.setmEmail(email);
		mDTO.setmPhone("01011112222");
		mDTO.setmBirth(birthday);
		mDTO.setmAddr1("대전서구");
		mDTO.setmAddr2("인스빌리베라");
		mDTO.setmZipcode(Integer.parseInt("12345"));
		
		SevenFactoryDAO sDAO = sqlSession.getMapper(SevenFactoryDAO.class);
		sDAO.registor(mDTO);
		
	}
	
	

	
}
