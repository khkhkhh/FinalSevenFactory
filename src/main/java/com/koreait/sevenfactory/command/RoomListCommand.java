package com.koreait.sevenfactory.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.sevenfactory.dao.SevenFactoryDAO;
import com.koreait.sevenfactory.dto.GuestRoomDTO;

public class RoomListCommand implements Command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
	    //dao
		//
		Map<String, Object> map = model.asMap();
		//
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		GuestRoomDTO gDTO = new GuestRoomDTO();
		gDTO.sethNo(Integer.parseInt(request.getParameter("hNo")));
		int hNo = gDTO.gethNo();
		
		SevenFactoryDAO sDAO = sqlSession.getMapper(SevenFactoryDAO.class);
	    model.addAttribute("list", sDAO.guestRoomListAll(hNo)); //list를 연결리스트로 담음
	    System.out.println(model); //모델을 보여주세요
	}
	
	
}
