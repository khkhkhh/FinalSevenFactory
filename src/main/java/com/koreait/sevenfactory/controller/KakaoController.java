package com.koreait.sevenfactory.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.koreait.sevenfactory.command.Command;
import com.koreait.sevenfactory.command.HotelListCommand;
import com.koreait.sevenfactory.command.member.KakaoCommand;
import com.koreait.sevenfactory.dao.SevenFactoryDAO;
import com.koreait.sevenfactory.dto.MemberDTO;

@Controller
public class KakaoController {
	@Autowired
	private KakaoCommand KakaoCommand;
	
	@Autowired
	private SqlSession sqlSession;
	private Command command;
	@RequestMapping(value = "loginKakao", method = RequestMethod.GET)
	public String home(@RequestParam(value = "code", required = false) String code, HttpServletRequest request,
			Model model) throws Exception {
		command = new HotelListCommand();
		command.execute(sqlSession, model);
		System.out.println("code : " + code);
		String access_Token = KakaoCommand.getAccessToken(code);
		HashMap<String, Object> userInfo = KakaoCommand.getUserInfo(access_Token);
		System.out.println("###access_Token#### : " + access_Token);
		System.out.println("###nickname#### : " + userInfo.get("nickname"));
		System.out.println("###email#### : " + userInfo.get("email"));
		System.out.println("###id#### : " + userInfo.get("id"));
		String name = (String) userInfo.get("nickname");
		String email = (String) userInfo.get("email");
		String id = (String) userInfo.get("id");
		String birthday = (String) userInfo.get("birthday");
		if (name == null || email == null || id == null) {
			return "redirect:/";
		} else {
			SevenFactoryDAO sDAO = sqlSession.getMapper(SevenFactoryDAO.class);
			MemberDTO db = sDAO.selectBymId(id);
			if (db == null) {
				// 회원가입
				KakaoCommand = new KakaoCommand();
				KakaoCommand.execute1(name, email, id,birthday,sqlSession, model);
				MemberDTO mDTO = sDAO.kakaologin(id, name, email,birthday);
				JSONObject obj = new JSONObject();

				if (mDTO != null) {
					if (mDTO.getmIsWithDrawal() != 0) {
						obj.put("result", "DELETED");
					} else {
						HttpSession session = request.getSession();
						session.setAttribute("loginDTO", mDTO);
						obj.put("result", "YES");
					}
				} else {
					obj.put("result", "NO");

				}
			} else {
				// 로그인
				MemberDTO mDTO = sDAO.kakaologin(id, name, email);
				JSONObject obj = new JSONObject();

				if (mDTO != null) {
					if (mDTO.getmIsWithDrawal() != 0) {
						obj.put("result", "DELETED");
					} else {
						HttpSession session = request.getSession();
						session.setAttribute("loginDTO", mDTO);
						obj.put("result", "YES");
					}
				} else {
					obj.put("result", "NO");

				}
			}
		}
		return "index";
	}

}
