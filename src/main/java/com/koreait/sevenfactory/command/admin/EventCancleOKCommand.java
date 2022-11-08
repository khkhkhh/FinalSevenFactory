package com.koreait.sevenfactory.command.admin;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.sevenfactory.command.Command;
import com.koreait.sevenfactory.dao.SevenFactoryDAO;

public class EventCancleOKCommand implements Command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {


		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");

		
		int eNo = Integer.parseInt(request.getParameter("eNo"));
		System.out.println("eno : " + eNo);
		SevenFactoryDAO sDAO = sqlSession.getMapper(SevenFactoryDAO.class);

		sDAO.adminEventCancleOK(eNo); // 예약승인하기
		

	}
}
