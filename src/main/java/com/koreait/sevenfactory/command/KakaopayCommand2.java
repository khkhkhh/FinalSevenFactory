package com.koreait.sevenfactory.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.sevenfactory.dao.SevenFactoryDAO;

public class KakaopayCommand2 implements Command {

   @Override
   public void execute(SqlSession sqlSession, Model model) {
      // TODO Auto-generated method stub
      Map<String, Object> map = model.asMap();
      HttpServletRequest request = (HttpServletRequest)map.get("request");
      
      int gNo = Integer.parseInt(request.getParameter("gNo"));
      int hNo = Integer.parseInt(request.getParameter("hNo").trim());
      int rPeople = Integer.parseInt(request.getParameter("rPeople"));
      int rPrice = Integer.parseInt(request.getParameter("rPrice"));
      String rCheckIn = request.getParameter("rCheckIn");
      String rCheckOut = request.getParameter("rCheckOut");
      String nmPhone =request.getParameter("nmPhone");
      String nmName =request.getParameter("nmName");
      
      
      SevenFactoryDAO sDAO = sqlSession.getMapper(SevenFactoryDAO.class);
      int existence = 0;
      existence = sDAO.selectNonmemberExistence(nmPhone);
      if(existence == 0) {
         sDAO.insertNonMember(nmName,nmPhone);
          sDAO.kakaopayinsertReservation2(gNo,hNo ,nmPhone ,rPeople, rPrice, rCheckIn, rCheckOut);
      }else {
         sDAO.kakaopayinsertReservation2(gNo,hNo ,nmPhone ,rPeople, rPrice, rCheckIn, rCheckOut);
      }
      System.out.println("nmPhone:"+nmPhone);
   }

}