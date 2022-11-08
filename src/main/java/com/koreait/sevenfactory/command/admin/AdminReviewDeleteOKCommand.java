package com.koreait.sevenfactory.command.admin;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.sevenfactory.command.Command;
import com.koreait.sevenfactory.dao.SevenFactoryDAO;

public class AdminReviewDeleteOKCommand implements Command {

   @Override
   public void execute(SqlSession sqlSession, Model model) {
      
      Map<String, Object> map = model.asMap();
      HttpServletRequest request = (HttpServletRequest) map.get("request");
      
      String mId = request.getParameter("mId");
      System.out.println("mId : " + mId);    

      SevenFactoryDAO sDAO = sqlSession.getMapper(SevenFactoryDAO.class);
      
      model.addAttribute("mId", mId);
      
      sDAO.adminSellerReviewDeleteOK(mId); // 예약승인하기

   }

}