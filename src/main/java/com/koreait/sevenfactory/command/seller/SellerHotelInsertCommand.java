package com.koreait.sevenfactory.command.seller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.sevenfactory.command.Command;
import com.koreait.sevenfactory.dao.SevenFactoryDAO;
import com.koreait.sevenfactory.dto.HotelDTO;

public class SellerHotelInsertCommand implements Command {

   @Override
   public void execute(SqlSession sqlSession, Model model) {
      // TODO Auto-generated method stub
      Map<String, Object> map = model.asMap();
      HttpServletRequest request = (HttpServletRequest) map.get("request");
      
      HotelDTO hDTO = new HotelDTO();
      hDTO.sethName(request.getParameter("hName"));
      System.out.println("hName:sellerhotelinsertcommand:"+request.getParameter("hName"));
      hDTO.sethAddress(request.getParameter("hAddress"));
      hDTO.sethAmount(Integer.parseInt(request.getParameter("hAmount")));
      hDTO.sethMinprice(Integer.parseInt(request.getParameter("hMinprice")));
      
      SevenFactoryDAO sDAO = sqlSession.getMapper(SevenFactoryDAO.class);
      sDAO.sellerhotelregistor(hDTO);
   }

}