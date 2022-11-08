package com.koreait.sevenfactory.command.admin;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.sevenfactory.command.Command;
import com.koreait.sevenfactory.dao.SevenFactoryDAO;

public class BlackagreeCommand implements Command {

   @Override
   public void execute(SqlSession sqlSession, Model model) {
      // TODO Auto-generated method stub
      // 5.BlackListRequestCommand로 들어왔음.
            Map<String, Object> map = model.asMap();//맵을 인덱스 순으로 정렬
            HttpServletRequest request = (HttpServletRequest) map.get("request");
            
            
            int bNo = Integer.parseInt(request.getParameter("bNo"));
            SevenFactoryDAO sDAO = sqlSession.getMapper(SevenFactoryDAO.class);
            sDAO.blackagree(bNo);
         
   }
}