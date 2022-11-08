package com.koreait.sevenfactory.command.seller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.sevenfactory.command.Command;
import com.koreait.sevenfactory.dao.SevenFactoryDAO;

public class SellerReservationApprovalCommand implements Command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		// TODO Auto-generated method stub
		Map<String, Object> map = model.asMap();
	    HttpServletRequest request = (HttpServletRequest) map.get("request");
	    
	    int rNo = Integer.parseInt(request.getParameter("rNo"));
	    
	    SevenFactoryDAO sDAO = sqlSession.getMapper(SevenFactoryDAO.class);
	     sDAO.reservationapproval(rNo);
	     
	}

}
