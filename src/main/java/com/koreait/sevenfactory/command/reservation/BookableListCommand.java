package com.koreait.sevenfactory.command.reservation;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.sevenfactory.command.Command;
import com.koreait.sevenfactory.dao.SevenFactoryDAO;
import com.koreait.sevenfactory.dto.HotelDTO;

public class BookableListCommand implements Command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {

		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String rCheckIn = request.getParameter("rCheckIn");
		String rCheckOut = request.getParameter("rCheckOut");
		
		SevenFactoryDAO sDAO= sqlSession.getMapper(SevenFactoryDAO.class);
		
		ArrayList<HotelDTO> list = sDAO.selectBookableList(rCheckOut, rCheckIn);
		
		model.addAttribute("list", list);
		System.out.println("list:"+list);
		model.addAttribute("rCheckIn", rCheckIn);
		model.addAttribute("rCheckOut", rCheckOut);
	}

}
