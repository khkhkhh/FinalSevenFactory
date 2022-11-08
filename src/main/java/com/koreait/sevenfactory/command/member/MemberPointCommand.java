package com.koreait.sevenfactory.command.member;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.sevenfactory.command.Command;
import com.koreait.sevenfactory.dao.SevenFactoryDAO;
import com.koreait.sevenfactory.dto.GuestRoomDTO;

public class MemberPointCommand implements Command {

   @Override
   public void execute(SqlSession sqlSession, Model model) {
      // TODO Auto-generated method stub
      Map<String, Object> map = model.asMap();
      HttpServletRequest request = (HttpServletRequest)map.get("request");
      
      String mId=request.getParameter("mId");
      System.out.println("mId ::"+mId);
      
      SevenFactoryDAO sDAO = sqlSession.getMapper(SevenFactoryDAO.class);
      int point = sDAO.memberPoint(mId);
      System.out.println("point"+point);
      model.addAttribute("point",point);
   }

}