package com.koreait.sevenfactory.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.koreait.sevenfactory.command.Command;
import com.koreait.sevenfactory.command.HotelListCommand;
import com.koreait.sevenfactory.command.reviewboard.MainReviewCommand;

@Controller
public class HotelController {
	@Autowired 
	private SqlSession sqlSession;
	private Command command;
	

	@RequestMapping("/")
	public String goMainPage(HttpServletRequest request,Model model) {
		command = new MainReviewCommand();
		command.execute(sqlSession, model);
		command = new HotelListCommand();
		command.execute(sqlSession, model);
		return "index";
	}
	@RequestMapping("main") 
	public String goMainPage2(HttpServletRequest request,Model model) {
		command = new MainReviewCommand();
		command.execute(sqlSession, model);
		command = new HotelListCommand();
		command.execute(sqlSession, model);
		return "index";
	}
	@RequestMapping("main2") 
	public String goMainPage3(HttpServletRequest request,Model model) {

		return "noticeBoard/noticeBoardInsertPage";
	}
	

	

}
