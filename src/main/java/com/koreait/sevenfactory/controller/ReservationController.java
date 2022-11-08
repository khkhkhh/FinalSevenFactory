package com.koreait.sevenfactory.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.koreait.sevenfactory.command.Command;
import com.koreait.sevenfactory.command.member.MemberPointCommand;
import com.koreait.sevenfactory.command.reservation.BookableListCommand;
import com.koreait.sevenfactory.command.reservation.MyReservationCommand;
import com.koreait.sevenfactory.command.reservation.NonMemberReservationCancleCommand;
import com.koreait.sevenfactory.command.reservation.NonMemberReservationCommand;
import com.koreait.sevenfactory.command.reservation.ReservationCancleCommand;
import com.koreait.sevenfactory.command.reservation.ReservationPageCommand;

@Controller
public class ReservationController {

   @Autowired
   private SqlSession sqlSession;
   private Command command;
   
   //jsp 넣은거 시작
   @RequestMapping("paypage")
   public String goRegisterPage() {
      return "reservation2/reservationPage";
   }
   //jsp 넣은거 끝 
   @RequestMapping("selectBookable")
   public String selectA(HttpServletRequest request, Model model) {
   
      model.addAttribute("request", request);
      command = new BookableListCommand();
      command.execute(sqlSession, model);
      
      return "reservation/bookableList";
   }
   
   @RequestMapping("nonMemberReservationCancle")
      public String nonMemberReservationCancle(HttpServletRequest request, Model model) {
         model.addAttribute("request", request);
         command = new NonMemberReservationCancleCommand();
         command.execute(sqlSession, model);
         return "index";
      }

   @RequestMapping("reservationPage")
   public String reservationPage(HttpServletRequest request, Model model) {
      model.addAttribute("request", request);
      // GUESTROOM 테이블의 GNAME, GPRICE, GMINPEOPLE, GMAXPEOPLE 불러오기
      // 추가로 넘겨줄 값 : 체크인날짜, 체크아웃날짜
      // 넘어가는값 : GNO
      model.addAttribute("gName", request.getParameter("gName"));
       System.out.println(request.getParameter("gName"));
      model.addAttribute("rCheckIn", request.getParameter("rCheckIn"));
      model.addAttribute("rCheckOut", request.getParameter("rCheckOut"));
      command = new ReservationPageCommand();
      command.execute(sqlSession, model);
      return "reservation/reservationPage";
   }

   
   @RequestMapping("MyReservation")
   public String selectMyReservation(HttpServletRequest request, Model model) {
      
      model.addAttribute("request", request);
      command = new MyReservationCommand();
      command.execute(sqlSession, model);
      
      return  "myPage/myReservation";
   }
      
   @RequestMapping("reservationCancle")
   public String doReservationCancle(HttpServletRequest request, Model model) {
      
      model.addAttribute("request", request);
      command = new ReservationCancleCommand();
      command.execute(sqlSession, model);
      
      return "redirect:MyReservation?mNo="+request.getParameter("mNo");
   }
   
   // 비회원 예약확인 
   @RequestMapping(value="selectNonMemberReservationPage", method=RequestMethod.POST)
   public String selectNonMemberReservationPage(HttpServletRequest request, Model model) {
      
      model.addAttribute("request", request);
      command = new NonMemberReservationCommand();
      command.execute(sqlSession, model);
      return "reservation/nonMemberReservationPage";
   }
   
   //예약하기 페이지-방정보
   @RequestMapping("reser")
   public String gotoreserv(HttpServletRequest request,Model model) {
      model.addAttribute("request",request);
      command = new ReservationPageCommand();
      command.execute(sqlSession, model);
      command = new MemberPointCommand();
      command.execute(sqlSession, model);
   return "reservation/reservationPage";
   }
   
   @RequestMapping("nonmemberreser")
   public String nonmemberreser(HttpServletRequest request,Model model) {
      model.addAttribute("request",request);
      command = new ReservationPageCommand();
      command.execute(sqlSession, model);
   return "reservation/reservationPage";
   }
   
}