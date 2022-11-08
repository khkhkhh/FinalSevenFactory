package com.koreait.sevenfactory.command.qnaboard;

import java.util.ArrayList;
import java.util.Map;


import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.sevenfactory.command.Command;
import com.koreait.sevenfactory.dao.SevenFactoryDAO;
import com.koreait.sevenfactory.dto.ReplyDTO;

public class QNABoardViewCommand implements Command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		int qNo = Integer.parseInt(request.getParameter("qNo"));
		
		SevenFactoryDAO qDAO = sqlSession.getMapper(SevenFactoryDAO.class);
		SevenFactoryDAO reDAO = sqlSession.getMapper(SevenFactoryDAO.class);
		ArrayList<ReplyDTO> reList = reDAO.selectQNABoardReply(qNo);
		model.addAttribute("qDTO", qDAO.selectByqNo(qNo));
		model.addAttribute("reList", reList);

	}

}
