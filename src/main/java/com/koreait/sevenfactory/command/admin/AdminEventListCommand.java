package com.koreait.sevenfactory.command.admin;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.sevenfactory.command.Command;
import com.koreait.sevenfactory.dao.SevenFactoryDAO;
import com.koreait.sevenfactory.dto.EventDTO;

public class AdminEventListCommand implements Command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		Map<String, Object> map = model.asMap();
	      HttpServletRequest request = (HttpServletRequest) map.get("request");
	      
	      SevenFactoryDAO sDAO = sqlSession.getMapper(SevenFactoryDAO.class);
	      

	      ArrayList<EventDTO> list = sDAO.selectEvent(); // 예약승인하기
	      System.out.println("list check" + list);
	      model.addAttribute("list",list);


	}
}
