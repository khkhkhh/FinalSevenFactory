package com.koreait.sevenfactory.command.member;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.sevenfactory.command.Command;
import com.koreait.sevenfactory.dao.SevenFactoryDAO;

public class AdminReservationCancelCommand implements Command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		int rNo = Integer.parseInt(request.getParameter("rNo")); 
		
		SevenFactoryDAO sDAO = sqlSession.getMapper(SevenFactoryDAO.class);
		
		sDAO.adminReservationCancel(rNo); // 예약취소하기
	}

}
