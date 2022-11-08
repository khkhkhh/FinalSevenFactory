package com.koreait.sevenfactory.command.seller;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.sevenfactory.command.Command;
import com.koreait.sevenfactory.dao.SevenFactoryDAO;
import com.koreait.sevenfactory.dto.EventDTO;

public class EventExtendCommand implements Command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		SevenFactoryDAO sDAO = sqlSession.getMapper(SevenFactoryDAO.class);
		System.out.println("하하");
		String sId = request.getParameter("sId");
		System.out.println("확인1 : " + sId);
		ArrayList<EventDTO> gName = sDAO.gnameBysId(sId); //뷰로 보낼 방이름들
		System.out.println("gName123 : " + gName); 
		model.addAttribute("list", gName);
		model.addAttribute("sId",sId);

	}

}
