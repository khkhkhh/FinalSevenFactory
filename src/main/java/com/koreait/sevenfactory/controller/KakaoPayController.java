package com.koreait.sevenfactory.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.koreait.sevenfactory.command.Command;
import com.koreait.sevenfactory.command.KakaoPayCommand1;
import com.koreait.sevenfactory.command.KakaopayCommand2;

@Controller
public class KakaoPayController {
	  @Autowired
	   private SqlSession sqlSession;
	   private Command command;

	//회원
	  @RequestMapping(value="kakaopay1",method=RequestMethod.POST)
	  public @ResponseBody String KakaoPay1(HttpServletRequest request,Model model,String gNo,String gName,String rCheckIn,String rCheckOut,String mNo,String rPeople,String rPrice,String hNo) {
		  
		 model.addAttribute("request", request);
		 model.addAttribute(gNo);
		 model.addAttribute(mNo);
		 model.addAttribute(gName);
		 model.addAttribute(rPeople);
		 model.addAttribute(rPrice);
		 model.addAttribute(rCheckIn);
		 model.addAttribute(rCheckOut);
		 model.addAttribute(hNo);


			 
		 command = new KakaoPayCommand1();
		 command.execute(sqlSession, model);
		 return "";
	  }
	  //비회원
	  @RequestMapping(value="kakaopay2",method=RequestMethod.POST)
	  public @ResponseBody String KakaoPay2(HttpServletRequest request,Model model,String gNo,String gName,String rCheckIn,String rCheckOut,String rPeople,String rPrice,String hNo,String nmPhone,String nmName) {
		 model.addAttribute("request", request);
		 model.addAttribute(gNo);
		 model.addAttribute(gName);
		 model.addAttribute(rPeople);
		 model.addAttribute(rPrice);
		 model.addAttribute(rCheckIn);
		 model.addAttribute(rCheckOut);
		 model.addAttribute(hNo);
		 model.addAttribute(nmPhone); 
		 model.addAttribute(nmName);
			 
		 command = new KakaopayCommand2();
		 command.execute(sqlSession, model);
		 return "";
	  }
	 
	  
	
	  
}

