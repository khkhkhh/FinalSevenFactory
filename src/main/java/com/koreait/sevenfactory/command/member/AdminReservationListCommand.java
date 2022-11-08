package com.koreait.sevenfactory.command.member;

import java.util.ArrayList;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.sevenfactory.command.Command;
import com.koreait.sevenfactory.common.ReservationPageMaker;
import com.koreait.sevenfactory.dao.SevenFactoryDAO;
import com.koreait.sevenfactory.dto.GuestRoomDTO;
import com.koreait.sevenfactory.dto.MemberDTO;
import com.koreait.sevenfactory.dto.ReservationViewDTO;


public class AdminReservationListCommand implements Command {

   @Override
   public void execute(SqlSession sqlSession, Model model) {
      
      Map<String, Object> map1 = model.asMap();
      HttpServletRequest request = (HttpServletRequest) map1.get("request");
      
      int page = 1;
      if(request.getParameter("page") != null) {
         page = Integer.parseInt(request.getParameter("page"));
      }
      
      int recordPerPage = 5; 
      int beginRecord = (page -1) * recordPerPage + 1;
      int endRecord = beginRecord + recordPerPage - 1;
      
      Map<String, Integer> map2 = new HashMap<String, Integer>();
      map2.put("beginRecord", beginRecord);
      map2.put("endRecord", endRecord);
      
      SevenFactoryDAO sDAO = sqlSession.getMapper(SevenFactoryDAO.class);
      
      ArrayList<ReservationViewDTO> reservationList = sDAO.reservationList(map2);
      
      int totalReservation = sDAO.getTotalReservationCount();
      
      String pageView = ReservationPageMaker.getPageView("adminReservationList", 
						                                      page, 
						                                      recordPerPage, 
						                                      totalReservation);
      model.addAttribute("page", page);
      model.addAttribute("reservationList", reservationList); 
      model.addAttribute("pageView", pageView);
      model.addAttribute("totalReservation", totalReservation);
   }
   
}