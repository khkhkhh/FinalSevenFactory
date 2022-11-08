package com.koreait.sevenfactory.command.qnaboard;

import java.util.Map;


import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.sevenfactory.command.Command;
import com.koreait.sevenfactory.dao.SevenFactoryDAO;

public class QNABoardUpdateCommand implements Command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		String qTitle = request.getParameter("qTitle");
		String qContent = request.getParameter("qContent");
		int qNo = Integer.parseInt(request.getParameter("qNo"));
		
		SevenFactoryDAO qDAO = sqlSession.getMapper(SevenFactoryDAO.class);
		qDAO.updateQNABoard(qTitle, qContent, qNo);
		
		model.addAttribute("qNo", qNo);
		
	}

}
