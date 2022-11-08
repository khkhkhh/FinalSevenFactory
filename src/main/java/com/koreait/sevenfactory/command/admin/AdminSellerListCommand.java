package com.koreait.sevenfactory.command.admin;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.sevenfactory.command.Command;
import com.koreait.sevenfactory.dao.SevenFactoryDAO;
import com.koreait.sevenfactory.dto.SellerDTO;

public class AdminSellerListCommand implements Command {

   @Override
   public void execute(SqlSession sqlSession, Model model) {
      // TODO Auto-generated method stub

      // DB에서 사업자list 가져오기
      SevenFactoryDAO sDAO = sqlSession.getMapper(SevenFactoryDAO.class);
      ArrayList<SellerDTO> list = sDAO.adminsellerlist();
      // 전체 사업자 수가져오기
      int totalRecord = sDAO.getSellerHotel();

      // request 에 저장해서 전달할 데이터
      model.addAttribute("list", list);
      model.addAttribute("totalRecord", totalRecord);
   }

}