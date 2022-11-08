package com.koreait.sevenfactory.command.admin;


import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.sevenfactory.command.Command;
import com.koreait.sevenfactory.dao.SevenFactoryDAO;
import com.koreait.sevenfactory.dto.EventDTO;


public class AdminEventCommand implements Command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		SevenFactoryDAO sDAO = sqlSession.getMapper(SevenFactoryDAO.class);
		String sId = request.getParameter("sId");
		System.out.println("확인1 : " + sId);
		int eApproval = 0;
		int eXtend = 0;
		int ePrice = Integer.parseInt(request.getParameter("ePrice"));
		int eDELETE = 0;
		System.out.println("확인2 : " + ePrice);
		
		System.out.println("확인3 : " + eXtend);
		String gName = request.getParameter("gName");
		System.out.println("확인4 : " + gName);
		String eAddtion = request.getParameter("eAddtion");
		System.out.println("확인5 : " + eAddtion);
		String eThumbnail = request.getParameter("eThumbnail");
		System.out.println("확인6 : " + eThumbnail);
		String eStart = request.getParameter("eStart");
		System.out.println("확인7 : " + eStart);
		String eEnd = request.getParameter("eEnd");
		System.out.println("확인8 : " + eEnd);
		String eREASON = "";
		String eUPDATE = "2022-01-01";
		
		 
		sDAO.insertEvent(gName,ePrice,eStart,eEnd,eAddtion,eThumbnail,eXtend,sId,eApproval,eDELETE,eREASON,eUPDATE);
		ArrayList<EventDTO> list = sDAO.eventBySid(sId);
		
		System.out.println("gName : " + gName); 
		model.addAttribute("list", list);
		model.addAttribute("sId",sId);
	}
}
