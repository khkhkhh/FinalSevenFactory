package com.koreait.sevenfactory.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.sevenfactory.dao.SevenFactoryDAO;
import com.koreait.sevenfactory.dto.GuestRoomDTO;

public class RoomDetailCommand implements Command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		// TODO Auto-generated method stub
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		int hNo = Integer.parseInt(request.getParameter("hNo"));
		int gNo = Integer.parseInt(request.getParameter("gNo"));
		String rCheckIn = request.getParameter("rCheckIn");
		String rCheckOut = request.getParameter("rCheckOut");
		SevenFactoryDAO sDAO = sqlSession.getMapper(SevenFactoryDAO.class);
		GuestRoomDTO gDTO = sDAO.selectGuestRoom(gNo);

		model.addAttribute("gDTO", gDTO);
		model.addAttribute("rCheckIn",rCheckIn);
		model.addAttribute("rCheckOut",rCheckOut);
		model.addAttribute("hNo", hNo);

	}

}
