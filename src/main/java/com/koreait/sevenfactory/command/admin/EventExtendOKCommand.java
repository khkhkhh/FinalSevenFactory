package com.koreait.sevenfactory.command.admin;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.sevenfactory.command.Command;
import com.koreait.sevenfactory.dao.SevenFactoryDAO;

public class EventExtendOKCommand implements Command {
	@Override
	public void execute(SqlSession sqlSession, Model model) {

		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		System.out.println("123123123123");
		int eNo = Integer.parseInt(request.getParameter("eNo"));
		System.out.println("eNo : " + eNo);
		SevenFactoryDAO sDAO = sqlSession.getMapper(SevenFactoryDAO.class);
		String eUpdate = sDAO.selectUpdateByeNo(eNo);
		System.out.println("안녕 인재형요 : " + eUpdate);
		
		model.addAttribute("eNo", eNo);

		sDAO.adminEventExtendOK(eNo,eUpdate); // 예약승인하기

	}

	
}
