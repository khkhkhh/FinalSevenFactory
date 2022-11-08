package com.koreait.sevenfactory.command.reviewboard;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.sevenfactory.command.Command;
import com.koreait.sevenfactory.dao.SevenFactoryDAO;

public class ReviewBoardReplyInsertCommand implements Command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		String mId = request.getParameter("mId");
		String reContent = request.getParameter("reContent");
		int rNo = Integer.parseInt(request.getParameter("rNo"));
		
		SevenFactoryDAO reDAO = sqlSession.getMapper(SevenFactoryDAO.class);
		reDAO.insertReviewBoardReply(mId, reContent, rNo);

	}

}
