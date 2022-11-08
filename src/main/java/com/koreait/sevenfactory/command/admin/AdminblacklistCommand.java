package com.koreait.sevenfactory.command.admin;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.sevenfactory.command.Command;
import com.koreait.sevenfactory.dao.SevenFactoryDAO;
import com.koreait.sevenfactory.dto.BlackListDTO;

public class AdminblacklistCommand implements Command {

   @Override
   public void execute(SqlSession sqlSession, Model model) {
      
   
      SevenFactoryDAO sDAO = sqlSession.getMapper(SevenFactoryDAO.class);   
      ArrayList<BlackListDTO> list = sDAO.mright();
      model.addAttribute("list",list);
   }

}