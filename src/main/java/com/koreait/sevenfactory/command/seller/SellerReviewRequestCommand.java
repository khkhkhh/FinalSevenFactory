package com.koreait.sevenfactory.command.seller;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.sevenfactory.command.Command;
import com.koreait.sevenfactory.dao.SevenFactoryDAO;
import com.koreait.sevenfactory.dto.ReviewDTO;

public class SellerReviewRequestCommand implements Command {

   @Override
   public void execute(SqlSession sqlSession, Model model) {

      Map<String, Object> map = model.asMap();

      HttpServletRequest request = (HttpServletRequest) map.get("request");
      int rNo = Integer.parseInt(request.getParameter("rNo"));
      System.out.println("rNo : " + rNo);
      String sId = request.getParameter("sId");
      System.out.println("sId : " + sId);

      SevenFactoryDAO sDAO = sqlSession.getMapper(SevenFactoryDAO.class);
      sDAO.updateSellerReviewRequest(rNo);
      ArrayList<ReviewDTO> list = sDAO.selectSellerReviewRequest(sId);
      model.addAttribute("list", list);
      model.addAttribute("sId", sId);
      model.addAttribute("rNo", rNo);

   }

}