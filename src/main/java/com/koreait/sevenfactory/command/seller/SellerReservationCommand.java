package com.koreait.sevenfactory.command.seller;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.builder.annotation.MapperAnnotationBuilder;
import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.sevenfactory.command.Command;
import com.koreait.sevenfactory.dao.SevenFactoryDAO;
import com.koreait.sevenfactory.dto.GuestRoomDTO;
import com.koreait.sevenfactory.dto.ReservationDTO;

public class SellerReservationCommand implements Command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		// TODO Auto-generated method stub
		Map<String, Object> map = model.asMap();
	       HttpServletRequest request = (HttpServletRequest) map.get("request");
	       String sId = request.getParameter("sId");   
		SevenFactoryDAO sDAO = sqlSession.getMapper(SevenFactoryDAO.class);
		
		//예약 리스트 뽑아오기 
		ArrayList<ReservationDTO> list = sDAO.sellerreservation(sId);
		model.addAttribute("list",list);		
		//방리스트 뽑아오기 
		ArrayList<GuestRoomDTO> list2 = sDAO.guestRoomList1(sId);
		model.addAttribute("list2",list2);

	}

}
