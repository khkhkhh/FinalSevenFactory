package com.koreait.sevenfactory.command.admin;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.sevenfactory.command.Command;
import com.koreait.sevenfactory.common.PageMaker;
import com.koreait.sevenfactory.dao.SevenFactoryDAO;
import com.koreait.sevenfactory.dto.HotelDTO;
import com.koreait.sevenfactory.dto.SellerDTO;

public class AdminHotelListCommand implements Command {

   @Override
   public void execute(SqlSession sqlSession, Model model) {
      // TODO Auto-generated method stub

      // DB에서 호텔list 가져오기
      SevenFactoryDAO sDAO = sqlSession.getMapper(SevenFactoryDAO.class);
      ArrayList<HotelDTO> list = sDAO.hotelnoapprovalList();
      // 전체 호텔 수가져오기
      int totalRecord = sDAO.getTotalHotel();

      // request 에 저장해서 전달할 데이터
      model.addAttribute("list", list);

      model.addAttribute("totalRecord", totalRecord);
   }

}