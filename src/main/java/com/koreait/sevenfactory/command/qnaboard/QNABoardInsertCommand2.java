package com.koreait.sevenfactory.command.qnaboard;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.sevenfactory.command.Command;
import com.koreait.sevenfactory.dao.SevenFactoryDAO;

public class QNABoardInsertCommand2 implements Command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		String mId = "nonmember";
		String nmName = request.getParameter("nmName");
		String qTitle = request.getParameter("qTitle");
		String qPw = request.getParameter("qPw");
		String qContent = request.getParameter("qContent");
		
		SevenFactoryDAO qDAO = sqlSession.getMapper(SevenFactoryDAO.class);
		qDAO.insertQNABoard2(mId,nmName, qTitle, qPw, qContent);

	}

}
