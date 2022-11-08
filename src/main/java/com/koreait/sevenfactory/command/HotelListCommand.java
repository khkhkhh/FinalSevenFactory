package com.koreait.sevenfactory.command;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.sevenfactory.dao.SevenFactoryDAO;
import com.koreait.sevenfactory.dto.HotelDTO;

public class HotelListCommand implements Command {

   @Override
   public void execute(SqlSession sqlSession, Model model) {
      // TODO Auto-generated method stub

      SevenFactoryDAO sDAO = sqlSession.getMapper(SevenFactoryDAO.class);
      ArrayList<HotelDTO> list = sDAO.hotelList();
      model.addAttribute("list", list);
      System.out.println("hotellistcommand:"+model);
   }

}