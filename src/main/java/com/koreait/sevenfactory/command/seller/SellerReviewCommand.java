package com.koreait.sevenfactory.command.seller;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.sevenfactory.command.Command;
import com.koreait.sevenfactory.dao.SevenFactoryDAO;
import com.koreait.sevenfactory.dto.ReviewDTO;

public class SellerReviewCommand implements Command {

   @Override
   public void execute(SqlSession sqlSession, Model model) {

      Map<String, Object> map = model.asMap();

      HttpServletRequest request = (HttpServletRequest) map.get("request");

      //String gName = request.getParameter("gName");
      String sId = request.getParameter("sId");

      System.out.println("sid : " +sId);

      SevenFactoryDAO sDAO = sqlSession.getMapper(SevenFactoryDAO.class);
      ArrayList<ReviewDTO> list = sDAO.selectSellerReviewRequest(sId);
      System.out.println("list : " + list);

      model.addAttribute("list", list);
      //model.addAttribute("gName", gName);
   }

}