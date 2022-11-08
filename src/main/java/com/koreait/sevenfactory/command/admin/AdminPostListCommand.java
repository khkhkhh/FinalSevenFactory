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
import com.koreait.sevenfactory.dto.NoticeDTO;
import com.koreait.sevenfactory.dto.QNADTO;
import com.koreait.sevenfactory.dto.ReviewDTO;

public class AdminPostListCommand implements Command {

   @Override
   public void execute(SqlSession sqlSession, Model model) {

      Map<String, Object> map1 = model.asMap();
      HttpServletRequest request = (HttpServletRequest) map1.get("request");
      int page = 1;
      if (request.getParameter("page") != null) {
         page = Integer.parseInt(request.getParameter("page"));
      }

      // page 를 알아야 가져올 list 의 begin 과 end 를 알 수 있다.(ex. 1 ~ 10, 11 ~ 20)
      int recordPerPage = 5; // 한페이지의 게시물 갯수
      int beginRecord = (page - 1) * recordPerPage;

      //NOTICE
      Map<String, Integer> map3 = new HashMap<String, Integer>();
      map3.put("beginRecord", beginRecord);
      System.out.println(map3.get("beginRecord"));

      //QNA
      Map<String, Integer> map4 = new HashMap<String, Integer>();
      map4.put("beginRecord", beginRecord);

      //REVIEW
      Map<String, Integer> map5 = new HashMap<String, Integer>();
      map5.put("beginRecord", beginRecord);

      // DB에서 list 가져오기
      SevenFactoryDAO sDAO = sqlSession.getMapper(SevenFactoryDAO.class);
      ArrayList<NoticeDTO> list = sDAO.adminNoticeList(map3);
      ArrayList<QNADTO> list2 = sDAO.adminQnaList(map4);
      ArrayList<ReviewDTO> list3 = sDAO.adminReviewList(map5);

      // 전체 게시글 갯수 구하기
      int totalPostRecord = sDAO.getTotalPost();
      int totalQnaRecord = sDAO.getTotalQna();
      int totalNoticeRecord = sDAO.getTotalNotice();
      int totalReviewRecord = sDAO.getTotalReview();

      // 페이지 ( << 1 2 3 >> )
      String pageNoticeView = PageMaker.getPageView("adminPostList", page, recordPerPage, totalNoticeRecord);
      String pageQNAView = PageMaker.getPageView("adminPostList", page, recordPerPage, totalQnaRecord);
      String pageReviewView = PageMaker.getPageView("adminPostList", page, recordPerPage, totalReviewRecord);
//      page = page - 1;
//      System.out.println("page 123 : " + page);
      // request 에 저장해서 전달할 데이터
      model.addAttribute("page", page);
      model.addAttribute("list", list);
      model.addAttribute("list2", list2);
      model.addAttribute("list3", list3);
      model.addAttribute("pageNoticeView", pageNoticeView);
      model.addAttribute("pageQNAView", pageQNAView);
      model.addAttribute("pageReviewView", pageReviewView);
      model.addAttribute("totalQnaRecord", totalQnaRecord);
      model.addAttribute("totalNoticeRecord", totalNoticeRecord);
      model.addAttribute("totalReviewRecord", totalReviewRecord);
   }
}