package com.koreait.sevenfactory.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.koreait.sevenfactory.command.Command;
import com.koreait.sevenfactory.command.admin.AdminEventCommand;
import com.koreait.sevenfactory.command.seller.BlackListRequestCommand;
import com.koreait.sevenfactory.command.seller.EmailSellerAuthCommand;
import com.koreait.sevenfactory.command.seller.EventDeleteCommand;
import com.koreait.sevenfactory.command.seller.EventExtendCommand;
import com.koreait.sevenfactory.command.seller.EventRequestCommand;
import com.koreait.sevenfactory.command.seller.EventUpdateExtendCommand;
import com.koreait.sevenfactory.command.seller.SellerExtendRequestCommand;
import com.koreait.sevenfactory.command.seller.SellerHotelInsertCommand;
import com.koreait.sevenfactory.command.seller.SellerMainCommand;
import com.koreait.sevenfactory.command.seller.SellerRegistorCommand;
import com.koreait.sevenfactory.command.seller.SellerReservationApprovalCommand;
import com.koreait.sevenfactory.command.seller.SellerReservationCommand;
import com.koreait.sevenfactory.command.seller.SellerReviewCommand;
import com.koreait.sevenfactory.command.seller.SellerReviewRequestCommand;
import com.koreait.sevenfactory.command.seller.updateExtendRequestCommand;
import com.koreait.sevenfactory.dao.SevenFactoryDAO;
import com.koreait.sevenfactory.dto.SellerDTO;

@Controller
public class SellerController {
	@Autowired
	private SqlSession sqlSession;
	@Autowired
	private JavaMailSender mailSender; // root-context.xml 의 빈 자동 생성
	private Command command;

	// @사업자
	@RequestMapping("sellerside")
	public String sellerside() {

		return "template/sellerSide";
	}

	@RequestMapping("sellerLoginform")
	   public String sellerLoginform() {

	      return "login/sellerLogin";
	}
	
	@RequestMapping("sellerMain")
	public String goSellerMainPage(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		System.out.println("sellerMain_sId : " + request.getParameter("sId"));
		command = new SellerReservationCommand();
		System.out.println("controller들림");
		command.execute(sqlSession, model);
		return "seller/sellerCalendar";
	}

	@RequestMapping("blacklist")
	public String blackList(HttpServletRequest request) {
		System.out.println("sId::::"+request.getParameter("sId"));
		return "seller/blackList";
	}

	// 사업자 페이지-연장 요청(강현)
	@RequestMapping(value = "extendPage")
	public String goExtendPage(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		command = new SellerExtendRequestCommand();
		command.execute(sqlSession, model);
		return "seller/extendPage";
	}

	@RequestMapping(value = "updateExtendRequest", method = RequestMethod.GET)
	public String SellerExtendRequest(HttpServletRequest request, Model model) {

		model.addAttribute("request", request);
		command = new updateExtendRequestCommand();
		command.execute(sqlSession, model);
		return "seller/extendPage";
	}
	
	
	
	// 리스트를 뛰우기위한 메핑
	@RequestMapping(value = "sellerevent1")
	public String EventRequest(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		System.out.println("sId Check 1 : " + request.getParameter("sId"));
		command = new EventRequestCommand();
		command.execute(sqlSession, model);
		System.out.println("sId Check 2 : " + request.getParameter("sId"));
		return "seller/sellerEvent1";
	}
	
	@RequestMapping(value = "sellerevent2")
	public String EventAddRequest(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		System.out.println("sId Check 1 : " + request.getParameter("sId"));
		command = new EventExtendCommand();
		command.execute(sqlSession, model);
		System.out.println("sId Check 2 : " + request.getParameter("sId"));
		return "seller/sellerEvent2";
	}
	
	@RequestMapping(value = "eventUpdateExtendCommand")
	public String eventExtendCommand(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		System.out.println("sId Check 3 : " + request.getParameter("sId"));
		System.out.println("eNo Check 1 : " + request.getParameter("eNo"));
		command = new EventUpdateExtendCommand();
		command.execute(sqlSession, model);
		command = new EventExtendCommand();
		command.execute(sqlSession, model);
		System.out.println("sId Check 4 : " + request.getParameter("sId"));
		return "seller/sellerEvent2";
	}
	
	@RequestMapping(value = "eventDeleteRequest")
	public String EventDeleteRequest(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		System.out.println("sId Check 5 : " + request.getParameter("sId"));
		System.out.println("eNo Check 2 : " + request.getParameter("eNo"));
		command = new EventDeleteCommand();
		command.execute(sqlSession, model);
		command = new EventExtendCommand();
		command.execute(sqlSession, model);
		System.out.println("sId Check 6 : " + request.getParameter("sId"));
		return "seller/sellerEvent2";
	}
	
	// update하기 위한 메핑
	@RequestMapping(value = "eventApproveRequest")
	public String EventApproveRequest(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		System.out.println("sId Check3 : " + request.getParameter("sId"));
		command = new AdminEventCommand();
		command.execute(sqlSession, model);
		return "seller/sellerEvent1";
	}

	@RequestMapping("sellerresrevation")
	public String sellerReservation(HttpServletRequest request,Model model) {
		System.out.println("sId::"+request.getParameter("sId"));
		model.addAttribute("request",request);
		command = new SellerReservationCommand();
		command.execute(sqlSession, model);
		return "seller/sellerReservation";
	}

	//사업자 리뷰관리 단순Mapping
	   @RequestMapping("sellerreview")
	   public String sellerReivew(HttpServletRequest request, Model model) {
	       model.addAttribute("request", request); 
	       System.out.println(request.getParameter("sId"));
	       command = new SellerReviewCommand(); 
	       command.execute(sqlSession, model);
	      return "seller/sellerReview";
	   }
	   
	   //사업자 리뷰관리 삭제요청
	   @RequestMapping("SellerReviewRequest")
	   public String SellerReviewRequest(HttpServletRequest request, Model model) {
	       model.addAttribute("request", request); 
	       command = new SellerReviewRequestCommand(); 
	       command.execute(sqlSession, model);
	      return "seller/sellerReview";
	   }
	
	@RequestMapping("sellerRegisterPage")
	public String sellerRegisterPage() {

		return "seller/sellerRegisterPage";
	}

	@RequestMapping("sellerlogout")
	public String doLogout(HttpServletRequest request) {

		HttpSession session = request.getSession();
		session.invalidate();

		return "redirect:sellerMain";
	}

	// AJAX 통신
	@RequestMapping(value = "sellerlogin", method = RequestMethod.POST)
	@ResponseBody
	public String doLogin(HttpServletRequest request, Model model) {

		String sId = request.getParameter("sId");
		System.out.println("승현이 하이 : " + sId);
		String sPw = request.getParameter("sPw");
		System.out.println("강현이 하이 : " + sPw);
		System.out.println(sPw);
		SevenFactoryDAO sDAO = sqlSession.getMapper(SevenFactoryDAO.class);
		SellerDTO sDTO = sDAO.sellerlogin(sId, sPw);
		command = new SellerMainCommand();
		command.execute(sqlSession, model);

		JSONObject obj = new JSONObject();

		// mDTo = null이 아니라면 회원 정보가 있음
		if (sDTO != null) {
			HttpSession session = request.getSession();
			session.setAttribute("loginDTO", sDTO);
			obj.put("result", "YES");
			obj.put("sId", sId);
		}
		// 회원 정보 불러오지 못 함
		else {
			obj.put("result", "NO");
		}

		// 객체 json 문자열로 만들어줌 -> 뷰에서 사용가능

		return obj.toJSONString();
	}

	// 사업자 비밀번호 찾기
	@RequestMapping("findSellerPwPage")
	public String goFindSellerPwPage() {
		return "seller/findSellerPwPage";
	}

	@RequestMapping(value = "findSellerPw", produces = "application/json")
	@ResponseBody
	public String findPw(HttpServletRequest request) {

		String sId = request.getParameter("sId");
		System.out.println("sId::" + sId);
		String sEmail = request.getParameter("sEmail");

		SevenFactoryDAO sDAO = sqlSession.getMapper(SevenFactoryDAO.class);
		JSONObject obj = new JSONObject();
		SellerDTO sDTO = sDAO.findSellerPw(sId, sEmail);
		if (sDTO != null) {
			obj.put("result", "YES");
		} else {
			obj.put("result", "NO");
		}
		return obj.toJSONString();
	}

	// 사업자 이메일인증
	@RequestMapping(value = "emailSellerAuth", produces = "application/json")
	@ResponseBody
	public String emailSellerAuth(HttpServletRequest request, Model model) {

		model.addAttribute("request", request);
		model.addAttribute("mailSender", mailSender);
		JSONObject obj = new JSONObject();
		command = new EmailSellerAuthCommand();
		command.execute(sqlSession, model);

		Map<String, Object> map = model.asMap();
		String authKey = (String) map.get("authKey");
		System.out.println(authKey);
		obj.put("authKey", authKey);

		return obj.toJSONString();
	}

	// 사업자 비밀번호변경
	@RequestMapping(value = "changeSellerPw", produces = "application/json")
	@ResponseBody
	public String changPw(HttpServletRequest request) {

		String sId = request.getParameter("sId");
		String sPw = request.getParameter("sPw");

		SevenFactoryDAO sDAO = sqlSession.getMapper(SevenFactoryDAO.class);
		JSONObject obj = new JSONObject();
		int result = sDAO.changeSellerPw(sPw, sId);
		if (result > 0) {
			obj.put("result", "SUCCESS");
		} else {
			obj.put("result", "FAIL");
		}
		return obj.toJSONString();
	}

	@RequestMapping("changeSellerPwPage")
	public String goChangePwPage() {
		return "seller/changeSellerPwPage";
	}

	// 블랙리스트 요청
	// 4.blacklistrequest에 해당하는 컨트롤러로 옴!!
	@RequestMapping("blacklistrequest")
	public String blacklistrequest(HttpServletRequest request, Model model) {
		
		// 1)서밋에서 가져온 값은 request에 있음.
		model.addAttribute("request", request);
		// 2)(밑에보세요)커맨드에서 리퀘스트를 가져가기 위해서 model에 request를 넣어줌
		// 2)커맨드에서 model을 받음
		command = new BlackListRequestCommand();
		// 3)BlackListRequestCommand만들고 이동>>>
		command.execute(sqlSession, model);
		return "seller/blackList";
	}

	// 사업자회원가입 && 더미값
	@RequestMapping(value = "sellerregister", method = RequestMethod.POST)
	public String doSellerRegister(HttpServletRequest request, Model model) throws Exception {
		request.setCharacterEncoding("utf-8");
		model.addAttribute("request", request);
		//승현아 여기야 확인을 하기바래 화이팅 강현이가 뽀뽀해도 받아들이고, 난 여기까지인 것 같아 넌 좋은 개발자가 될 꺼야
		command = new SellerRegistorCommand();
		command.execute(sqlSession, model);

		return "seller/sellerHotelInsert";
	}

	@RequestMapping(value = "sidCheck", produces = "application/json")
	@ResponseBody
	public String sidCheck(HttpServletRequest request, Model model) {

		String sId = request.getParameter("sId");

		SevenFactoryDAO sDAO = sqlSession.getMapper(SevenFactoryDAO.class);
		JSONObject obj = new JSONObject();
		SellerDTO sDTO = sDAO.sidCheck(sId);
		if (sDTO == null) {
			obj.put("result", "YES");
		} else {
			obj.put("result", "NO");
		}
		return obj.toJSONString();
	}

	@RequestMapping(value = "semailCheck", produces = "application/json")
	@ResponseBody
	public String semailCheck(HttpServletRequest request, Model model) {

		String sEmail = request.getParameter("sEmail");

		SevenFactoryDAO sDAO = sqlSession.getMapper(SevenFactoryDAO.class);
		JSONObject obj = new JSONObject();
		SellerDTO sDTO = sDAO.semailCheck(sEmail);

		if (sDTO == null) {
			obj.put("result", "YES");
		} else {
			obj.put("result", "NO");
		}
		return obj.toJSONString();
	}

	@RequestMapping(value = "sphoneCheck", produces = "application/json")
	@ResponseBody
	public String sphoneCheck(HttpServletRequest request, Model model) {

		String sPhone = request.getParameter("sPhone");

		SevenFactoryDAO sDAO = sqlSession.getMapper(SevenFactoryDAO.class);
		JSONObject obj = new JSONObject();
		SellerDTO sDTO = sDAO.sphoneCheck(sPhone);

		if (sDTO == null) {
			obj.put("result", "YES");
		} else {
			obj.put("result", "NO");
		}
		return obj.toJSONString();
	}

	// 사업자 호텔 insert sellerhotelinsert
	@RequestMapping(value = "sellerhotelinsert", method = RequestMethod.POST)
	public String sellerhotelinsert(HttpServletRequest request, Model model) throws Exception {
		request.setCharacterEncoding("utf-8");
		model.addAttribute("request", request);
		System.out.println("controller:" + request.getParameter("hName"));

		command = new SellerHotelInsertCommand();
		command.execute(sqlSession, model);

		return "seller/sellerCalendar";
	}
	
	// 사업자 예약승인
		@RequestMapping(value = "reservationapproval")
		public String reservationapproval(HttpServletRequest request, Model model) throws Exception {
			request.setCharacterEncoding("utf-8");
			model.addAttribute("request", request);
			command = new SellerReservationApprovalCommand();
			command.execute(sqlSession, model);
			String sId=  request.getParameter("sId");
			System.out.println("sId1::"+sId);
			model.addAttribute("sId",sId);
			return "redirect:sellerresrevation";
		}

}