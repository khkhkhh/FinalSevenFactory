package com.koreait.sevenfactory.command.seller;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.sevenfactory.command.Command;
import com.koreait.sevenfactory.dao.SevenFactoryDAO;



public class EventRequestCommand implements Command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		SevenFactoryDAO sDAO = sqlSession.getMapper(SevenFactoryDAO.class);
		String sId = request.getParameter("sId");
		System.out.println("확인1 : " + sId);
		String hName = sDAO.hotelNameBySid(sId);
		System.out.println("확인11 : " + hName);
		int hNo = sDAO.hnoByHname(hName);
		ArrayList<String> gName = sDAO.gnameByHno(hNo); //뷰로 보낼 방이름들
		System.out.println("gName : " + gName); 
		model.addAttribute("list", gName);
		model.addAttribute("sId",sId);
		
	}
}
