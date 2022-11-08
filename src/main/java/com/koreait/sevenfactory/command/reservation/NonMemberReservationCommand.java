package com.koreait.sevenfactory.command.reservation;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.sevenfactory.command.Command;
import com.koreait.sevenfactory.dao.SevenFactoryDAO;
import com.koreait.sevenfactory.dto.ReservationDTO;

public class NonMemberReservationCommand implements Command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String nmName = request.getParameter("nmName");
		String nmPhone = request.getParameter("nmPhone");
		
		SevenFactoryDAO sDAO = sqlSession.getMapper(SevenFactoryDAO.class);
		ArrayList<ReservationDTO> list = sDAO.selectNonmemberReservation(nmName, nmPhone);
		model.addAttribute("list", list);
		model.addAttribute("nmName", nmName);
		model.addAttribute("nmPhone", nmPhone);

	}

}
