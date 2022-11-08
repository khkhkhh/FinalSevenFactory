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
import com.koreait.sevenfactory.dto.ReviewDTO;

public class AdminReviewListCommand implements Command {

   @Override
   public void execute(SqlSession sqlSession, Model model) {
      // DB에서 사업자list 가져오기
      SevenFactoryDAO sDAO = sqlSession.getMapper(SevenFactoryDAO.class);
      ArrayList<ReviewDTO> list = sDAO.adminDReviewList();
      model.addAttribute("list", list);
   }
}