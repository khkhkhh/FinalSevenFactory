package com.koreait.sevenfactory.command;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.sevenfactory.dao.SevenFactoryDAO;
import com.koreait.sevenfactory.dto.GuestRoomDTO;

public class RoomViewCommand implements Command {

   // 객실 상세정보 Command

   @Override
   public void execute(SqlSession sqlSession, Model model) {

      Map<String, Object> map = model.asMap();
      HttpServletRequest request = (HttpServletRequest) map.get("request");

      int hNo = Integer.parseInt(request.getParameter("hNo"));
      String rCheckIn = request.getParameter("rCheckIn");
      String rCheckOut = request.getParameter("rCheckOut");
      SevenFactoryDAO sDAO = sqlSession.getMapper(SevenFactoryDAO.class);
      Double sum = 0.0;
      ArrayList<GuestRoomDTO> gDTO = sDAO.guestRoomList(hNo);
      ArrayList<String> gNames = sDAO.guestRoomNoList(hNo);
      System.out.println("helllo : " + gNames);
      ArrayList<Double> Rating = new ArrayList<Double>();
      // ArrayList<Double> Rating = sDAO.guestRoomRating(gName);
      for (int i = 0; i < gNames.size(); i++) {
         String gName = gNames.get(i);
         System.out.println(gName);
         Rating.add(sDAO.guestRoomRating(gName));
         if(sDAO.guestRoomRating(gName) == null) {
            sum += 0.0;
         }else {
            sum += sDAO.guestRoomRating(gName);
         }
      }
      System.out.println(Rating);
      System.out.println(sum);

      ArrayList<Integer> Vote = new ArrayList<Integer>();
      for (int i = 0; i < gNames.size(); i++) {
         String gName = gNames.get(i);
         Vote.add(sDAO.guestRoomRatingVote(gName));
      }
      
      System.out.println(Vote);
      // System.out.println("Rating : " + Rating );
      model.addAttribute("list", gDTO);
      model.addAttribute("Rating", Rating);
      model.addAttribute("Vote", Vote);
      model.addAttribute("rCheckIn", rCheckIn);
      model.addAttribute("rCheckOut", rCheckOut);
   }

}