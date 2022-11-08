package com.koreait.sevenfactory.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.koreait.sevenfactory.command.CheckCaptchar;
import com.koreait.sevenfactory.command.Command;
import com.koreait.sevenfactory.command.EmailAuthCommand;
import com.koreait.sevenfactory.command.GetImageCaptcha;
import com.koreait.sevenfactory.command.admin.AdminEventListCommand;
import com.koreait.sevenfactory.command.admin.AdminExtentEventListCommand;
import com.koreait.sevenfactory.command.admin.AdminHotelApprovalCommand;
import com.koreait.sevenfactory.command.admin.AdminHotelListCommand;
import com.koreait.sevenfactory.command.admin.AdminPostListCommand;
import com.koreait.sevenfactory.command.admin.AdminReviewDeleteOKCommand;
import com.koreait.sevenfactory.command.admin.AdminReviewListCommand;
import com.koreait.sevenfactory.command.admin.AdminSearchMemberCommand;
import com.koreait.sevenfactory.command.admin.AdminblacklistCommand;
import com.koreait.sevenfactory.command.admin.BlackagreeCommand;
import com.koreait.sevenfactory.command.admin.BlackdisagreeCommand;
import com.koreait.sevenfactory.command.admin.EventApprovalOKCommand;
import com.koreait.sevenfactory.command.admin.EventCancleOKCommand;
import com.koreait.sevenfactory.command.admin.EventExtendOKCommand;
import com.koreait.sevenfactory.command.member.AdminInsertCommand;
import com.koreait.sevenfactory.command.member.AdminLeaveCommand;
import com.koreait.sevenfactory.command.member.AdminListCommand;
import com.koreait.sevenfactory.command.member.AdminMakeCommand;
import com.koreait.sevenfactory.command.member.AdminQueryListCommand;
import com.koreait.sevenfactory.command.member.AdminQueryReservationListCommand;
import com.koreait.sevenfactory.command.member.AdminReservationCancelCommand;
import com.koreait.sevenfactory.command.member.AdminReservationDeleteCommand;
import com.koreait.sevenfactory.command.member.AdminReservationListCommand;
import com.koreait.sevenfactory.command.member.AdminReservationOKCommand;
import com.koreait.sevenfactory.command.member.AdminSellerExtendOKCommand;
import com.koreait.sevenfactory.command.member.AdminSellerListCommand;
import com.koreait.sevenfactory.command.member.AdminUserChangeCommand;
import com.koreait.sevenfactory.command.member.AdminViewCommand;
import com.koreait.sevenfactory.command.member.MyBoardViewCommand;
import com.koreait.sevenfactory.command.member.MyLeaveCommand;
import com.koreait.sevenfactory.command.member.MyUpdateCommand;
import com.koreait.sevenfactory.command.member.MyViewCommand;
import com.koreait.sevenfactory.command.member.RegistorCommand;
import com.koreait.sevenfactory.dao.SevenFactoryDAO;
import com.koreait.sevenfactory.dto.MemberDTO;

@Controller
public class MemberController {

   @Autowired
   private SqlSession sqlSession;
   @Autowired
   private JavaMailSender mailSender;  // root-context.xml 의 빈 자동 생성
   private Command command;
   //jsp 넣은거 시작
   @RequestMapping("registerPage2")
   public String goRegisterPage() {
      return "login2/registerPage2";
   }
   @RequestMapping("mod1")
   public String goRegisterPage2() {
      return "login2/modmemberinfo";
   }
   
   //jsp 넣은거 끝
   
   @RequestMapping("registerPage")
   public String goRegisterPage1() {
      System.out.println("goRegisterPage1");
      return "login/registerPage22";
   }

   
   @RequestMapping("findIdPage")
   public String goFindIdPage() {
      return "login/findIdPage";
   }
   @RequestMapping("findPwPage")
   public String goFindPwPage() {
      return "login/findPwPage";
   }
   @RequestMapping("changePwPage")
   public String goChangePwPage() {
      return "login/changePwPage";
   }
   
   @RequestMapping("logout")
   public String doLogout(HttpServletRequest request) {
      
      HttpSession session = request.getSession();
      session.invalidate();
      
      return "redirect:main";
   }
   
   @RequestMapping(value="register",method=RequestMethod.POST)
   public String doRegister(HttpServletRequest request, Model model) throws Exception {
        request.setCharacterEncoding("utf-8");
        model.addAttribute("request", request);
        command = new RegistorCommand();
        command.execute(sqlSession, model);
      return "login/registerFinalPage";
   }
   
   
   //AJAX 통신 
   @RequestMapping(value="login",method=RequestMethod.POST)
   @ResponseBody 
   public String doLogin( HttpServletRequest request) {
      
      String mId = request.getParameter("mId");
      String mPw = request.getParameter("mPw");
      System.out.println(mPw);
      SevenFactoryDAO sDAO =  sqlSession.getMapper(SevenFactoryDAO.class);
      MemberDTO mDTO = sDAO.login(mId, mPw);
      JSONObject obj = new JSONObject();
      
      //mDTo = null이 아니라면 회원 정보가 있음
      if(mDTO != null) {
         // 1이라면 삭제 , 0 이라면 비삭제
         if (mDTO.getmIsWithDrawal() != 0) {
            obj.put("result", "DELETED");
         }else {
            HttpSession session = request.getSession();
            session.setAttribute("loginDTO", mDTO);
            obj.put("result", "YES");
         }
      }
      // 회원 정보 불러오지 못 함
      else { obj.put("result", "NO");}
      
      // 객체 json 문자열로 만들어줌 -> 뷰에서 사용가능
      return obj.toJSONString();
   }
   
   @RequestMapping(value="getImage", produces="application/json")
   @ResponseBody 
   public String getImage(HttpServletRequest request, Model model) {
      
      model.addAttribute("request", request);
      command = new GetImageCaptcha();
      command.execute(sqlSession, model);
      
      Map<String, Object> map = model.asMap();
      String filename = (String) map.get("filename");
      
      JSONObject obj = new JSONObject();
      obj.put("filename", filename);
      return obj.toJSONString();
   }
   
   @RequestMapping(value="findId", produces="application/json")
   @ResponseBody  
   public String findId(HttpServletRequest request) {

      String mName = request.getParameter("mName");
      String mEmail = request.getParameter("mEmail");
      SevenFactoryDAO sDAO = sqlSession.getMapper(SevenFactoryDAO.class);
      JSONObject obj = new JSONObject();
      MemberDTO mDTO = sDAO.findId(mName,mEmail);
      if (mDTO != null) {
         obj.put("result", mDTO.getmId()+"");
      }else {
         obj.put("result", "NO");
      }
      return obj.toJSONString();
   }
   
   
   @RequestMapping(value="findPw", produces="application/json")
   @ResponseBody  
   public String findPw(HttpServletRequest request) {
      
      String mId = request.getParameter("mId");
      String mEmail = request.getParameter("mEmail");
      
      SevenFactoryDAO sDAO = sqlSession.getMapper(SevenFactoryDAO.class);
      JSONObject obj = new JSONObject();
      MemberDTO mDTO = sDAO.findPw(mId, mEmail);
      if (mDTO != null) {
         obj.put("result", "YES");
      }else {
         obj.put("result", "NO");
      }
      return obj.toJSONString();
   }
   
   @RequestMapping(value="changePw",produces="application/json")
   @ResponseBody  
   public String changPw(HttpServletRequest request) {
      
      String mId = request.getParameter("mId");
      String mPw = request.getParameter("mPw");
      
      SevenFactoryDAO sDAO = sqlSession.getMapper(SevenFactoryDAO.class);
      JSONObject obj = new JSONObject();
      int result = sDAO.changePw(mPw, mId); 
      if (result > 0) {
         obj.put("result", "SUCCESS");
      }else {
         obj.put("result", "FAIL");
      }
      return obj.toJSONString();
   }
   
   @RequestMapping(value="emailAuth",produces="application/json")
   @ResponseBody  
   public String emailAuth(HttpServletRequest request,
                     Model model) {
      

      model.addAttribute("request", request);
      model.addAttribute("mailSender", mailSender);
      JSONObject obj = new JSONObject();
      command = new EmailAuthCommand();
      command.execute(sqlSession, model);
      
      Map<String, Object> map = model.asMap();
      String authKey = (String) map.get("authKey");
      System.out.println(authKey);
      obj.put("authKey",authKey);
      
      return obj.toJSONString();
   }
   
   @RequestMapping(value="idCheck",produces="application/json")
   @ResponseBody  
   public String idCheck(HttpServletRequest request,Model model) {
      
      String mId = request.getParameter("mId");
      
      SevenFactoryDAO sDAO = sqlSession.getMapper(SevenFactoryDAO.class);
      JSONObject obj = new JSONObject();
      MemberDTO mDTO = sDAO.idCheck(mId);
      if (mDTO == null) {
         obj.put("result", "YES");
      }else {
         obj.put("result", "NO");
      }
      return obj.toJSONString();
   }
   
   
   @RequestMapping(value="emailCheck",produces="application/json")
   @ResponseBody  
   public String emailCheck(HttpServletRequest request, Model model) {
      
      String mEmail = request.getParameter("mEmail");
      
      SevenFactoryDAO sDAO = sqlSession.getMapper(SevenFactoryDAO.class);
      JSONObject obj = new JSONObject();
      MemberDTO mDTO = sDAO.emailCheck(mEmail);
      
      if (mDTO == null) {
         obj.put("result", "YES");
      }else {
         obj.put("result", "NO");
      }
      return obj.toJSONString();
   }
   
   @RequestMapping(value="phoneCheck",produces="application/json")
      @ResponseBody  
      public String phoneCheck(HttpServletRequest request, Model model) {
         
         String mPhone = request.getParameter("mPhone");
         
         SevenFactoryDAO sDAO = sqlSession.getMapper(SevenFactoryDAO.class);
         JSONObject obj = new JSONObject();
         MemberDTO mDTO = sDAO.phoneCheck(mPhone);
         
         if (mDTO == null) {
            obj.put("result", "YES");
         }else {
            obj.put("result", "NO");
         }
         return obj.toJSONString();
      }
   
   @RequestMapping(value="loginCheck",produces="application/json")
   @ResponseBody  
   public String registerCheck(HttpServletRequest request, Model model) {
      
      String input_key = request.getParameter("input_key");
      
      model.addAttribute("request", request);
      
      command = new CheckCaptchar();
      command.execute(sqlSession, model);
      
      Map<String, Object> map = model.asMap();
      JSONObject obj = (JSONObject) map.get("obj");
      System.out.print("");
      System.out.println(request.getParameter("input_key"));
      System.out.println(obj.get("result"));
      return obj.toJSONString();
   }
   
   @RequestMapping(value="reGetImage",produces="application/json")
   @ResponseBody  
   public String reGetImage(HttpServletRequest request, Model model) {
      
        model.addAttribute("request", request);
        command = new GetImageCaptcha();
        command.execute(sqlSession, model);
      
        Map<String, Object> map = model.asMap();
        JSONObject obj = new JSONObject();
        obj.put("filename",(String) map.get("filename"));
        System.out.println(obj.get("filename"));
        return obj.toJSONString();
   }
   
         // 1. 마이페이지 - 메인
         @RequestMapping("goMyPage")
         public String goMyPage() {
            
            return "myPage/myPageMain";
         }
         
         // 2. 마이페이지 - 회원정보 수정 전 비밀번호 확인 페이지 이동
         @RequestMapping("myPage_pw_confirmPage")
         public String goMyPagePwConfirmPage() {
            return "myPage/myPagePwConfirmPage";
         }
   //***********************************************************************************************   
         // 3. 마이페이지-회원정보페이지 이동
         @RequestMapping("myUpdatePage")
         public String goMemberInfoPage(HttpServletRequest request, Model model) {
            model.addAttribute("request", request);
            command = new MyViewCommand();
            command.execute(sqlSession, model);
            return "myPage/myUpdatePage";
         }
         
         // 4. 마이페이지 - 회원정보 업데이트
         @RequestMapping(value="myUpdate", method=RequestMethod.POST)
         public String myPageUpdate(HttpServletRequest request, Model model) {
            
            model.addAttribute("request", request);
            command = new MyUpdateCommand();
            command.execute(sqlSession, model);
            
            return "redirect:myUpdatePage?mId=" + request.getParameter("mId");
         }
         
      //****************************************************************************************************   
         
           // 5. 마이페이지-본인Q&A 게시판-LIST
            @RequestMapping("myBoardView")
            public String goMyReviewBoard(HttpServletRequest request, Model model) {
               model.addAttribute("request", request);
              command = new MyBoardViewCommand();
              command.execute(sqlSession, model);
               return "myPage/myQnaListBoard";
            }
            
         
         
         // Email 검사
         @SuppressWarnings("unchecked")
         @RequestMapping(value="EmailCheck",method=RequestMethod.POST)
         public String emailCheck(HttpServletRequest request, HttpServletResponse response) {
            // 1. 전달되는 파라미터 저장
            String mEmail = request.getParameter("mEmail");
            
            // 2. mEmail 를 가진 회원 정보 확인
            SevenFactoryDAO sDAO = sqlSession.getMapper(SevenFactoryDAO.class);
            MemberDTO mDTO = sDAO.selectBymEmail(mEmail);
            
            // 3. 응답할 JSONObject 객체 생성
            JSONObject obj = new JSONObject();
            
            // 4. mId 를 가진 회원이 있으면 obj 에 result 변수에 "EXIST" 저장
            //    mId 를 가진 회원이 없으면 obj 에 result 변수에 "" 저장
            if ( mDTO != null ) {
               obj.put("result", "EXIST");
            } else {
               obj.put("result", "");
            }
                        
            return obj.toJSONString();
         }
         
         // 탈퇴페이지 이동
         @RequestMapping("myLeavePage")
         public String myPageLeavePage(@RequestParam("mId") String mId, Model model) {
            
            model.addAttribute("mDTO", mId);
            
            return "myPage/myLeavePage";
         }
         // 실제 회원탈퇴
         @RequestMapping(value="myLeave")
         public String myPageLeave(HttpServletRequest request, Model model) {
            
            model.addAttribute("request", request);
            command = new MyLeaveCommand();
            command.execute(sqlSession, model);
            /*// 1. 전달 받은 파라미터 저장
            String mId = request.getParameter("mId");
                        
            // 2. mId 회원 삭제
            SevenFactoryDAO sDAO = sqlSession.getMapper(SevenFactoryDAO.class);
            int result = sDAO.leaveMember(mId);
                        
            // 3. 결과를 저장할 JSONObject 생성
            JSONObject obj = new JSONObject();
                        
            // 4. JSONObject 에 결과 result 저장
            if (result > 0) {
               obj.put("result", "SUCCESS");
               request.getSession().invalidate();  // 세션 초기화
            } else {
               obj.put("result", "FAIL");
            }*/
            return "redirect:logout";         
         }
      //**********************************************************************************************************************************
         
         // 이병한
         // 관리자 페이지 - MAIN 허브(연결통로)
         @RequestMapping("adminMain")
         public String goAdminMain() {
            
            return "admin/adminMain";
         }
         
         
         // 관리자 페이지 - VIEW
         @RequestMapping("adminViewPage")
         public String goAdminView(HttpServletRequest request, Model model) {
            
            model.addAttribute("request", request);
            command = new AdminViewCommand();
            command.execute(sqlSession, model);
            
            return "admin/adminViewPage";
         }
         
         // 관리자 페이지 - 회원추가하기
         @RequestMapping("adminInsertPage")
         public String goAdminInsertPage() {
            return "admin/adminInsertPage";
         }
         @RequestMapping(value="adminInsert",method=RequestMethod.POST)
         public String doAdminInsert(HttpServletRequest request, Model model) {
            
              model.addAttribute("request", request);
              command = new AdminInsertCommand();
              command.execute(sqlSession, model);
              
            return "redirect:adminList";
         }
         
         // 관리자페이지 - LEAVE(탈퇴시키기)
         @RequestMapping("adminLeave")
         public String adminLeave(HttpServletRequest request, Model model) {
            
            model.addAttribute("request", request);
            command = new AdminLeaveCommand();
            command.execute(sqlSession, model);
            
            return "redirect:adminList";
         }
         
         // 관리자페이지 - 일반회원에서 관리자 권한 부여하기
         @RequestMapping("adminMaking")
         public String adminMaking(HttpServletRequest request, Model model) {
            
            model.addAttribute("request", request);
            command = new AdminMakeCommand();
            command.execute(sqlSession, model);
            
            return "redirect:adminList";
         }
         // 관리자페이지 - 관리자에서 일반회원으로 변경하기
         @RequestMapping("userMaking")
         public String userMaking(HttpServletRequest request, Model model) {
            
            model.addAttribute("request", request);
            command = new AdminUserChangeCommand();
            command.execute(sqlSession, model);
            
            return "redirect:adminList";
         }
         // 관리자 페이지 - 회원관리 LIST
         @RequestMapping("adminList")
         public String goAdminlist(HttpServletRequest request, Model model) {
            
            model.addAttribute("request", request);
            command = new AdminListCommand();
            command.execute(sqlSession, model);
            
            return "admin/adminListPage";
         }
         
         // 관리자페이지 - 회원검색
         @RequestMapping("queryAdminListPage")
         public String queryAdminListPage(HttpServletRequest request, Model model) {
            model.addAttribute("request", request);
            command = new AdminSearchMemberCommand();
            command.execute(sqlSession, model);
            return "admin/adminListPage";
         }
         
      // 관리자페이지 - 게시글
         @RequestMapping("queryAdminPostListPage")
         public String queryAdminPostListPage(HttpServletRequest request, Model model) {
            model.addAttribute("request", request);
            command = new AdminQueryListCommand();
            command.execute(sqlSession, model);
            return "admin/adminPostPage";
         }
         
         //관리자페이지-게시글관리 list
         @RequestMapping("adminPostList")
         public String goAdminPostlist(HttpServletRequest request, Model model) { 
            model.addAttribute("request", request);
            command = new AdminPostListCommand();
            command.execute(sqlSession, model);
            return "admin/adminPostListPage";
         }       
         
         // 관리자 페이지 - 객실예약 현황 - LIST
         @RequestMapping("adminReservationList")
         public String goAdminReservation(HttpServletRequest request, Model model) {
            
            model.addAttribute("request", request);
            command = new AdminReservationListCommand();
            command.execute(sqlSession, model);
            
            return "admin/adminReservationListPage";
         }
         // 관리자페이지 - 객실예약 현황 회원 검색
         @RequestMapping("queryAdminReservationPage")
         public String queryAdminReservationPage(HttpServletRequest request, Model model) {
            
            model.addAttribute("request", request);
            command = new AdminQueryReservationListCommand();
            command.execute(sqlSession, model);
            
            return "admin/adminReservationListPage";
         }
               
         // 관리자 페이지 - 객실예약 현황 - 예약 승인하기
         @RequestMapping(value="ReservationOk", method=RequestMethod.POST)
         public String ReservationOk(HttpServletRequest request, Model model) {
                  
            model.addAttribute("request", request);
            command = new AdminReservationOKCommand();
            command.execute(sqlSession, model);
            return "redirect:adminReservationList?rNo=" + request.getParameter("rNo");
         }
         // 관리자 페이지 - 객실예약 현황 - 예약 취소하기
         @RequestMapping(value="ReservationCancel", method=RequestMethod.POST)
         public String ReservationCancel(HttpServletRequest request, Model model) {
                     
            model.addAttribute("request", request);
            command = new AdminReservationCancelCommand();
            command.execute(sqlSession, model);
            return "redirect:adminReservationList";
         }
         // 관리자 페이지 - 객실예약 현황 - 예약 취소하기
         @RequestMapping(value="ReservationDelete", method=RequestMethod.POST)
         public String ReservationDelete(HttpServletRequest request, Model model) {
                           
            model.addAttribute("request", request);
            command = new AdminReservationDeleteCommand();
            command.execute(sqlSession, model);
            return "redirect:adminReservationList";
         }
         
         // 관리자 페이지 - 호텔승인리스트
         @RequestMapping("adminHotelList")
         public String adminHotelList(HttpServletRequest request, Model model) {
            model.addAttribute("request", request);
            command = new AdminHotelListCommand();
            command.execute(sqlSession, model);
            
            return "admin/adminhotelapproval";
         }
         // 관리자 페이지 - 호텔승인
         @RequestMapping("hotelapproval")
         public String approval(HttpServletRequest request, Model model) {
            model.addAttribute("request", request);
            System.out.println("hNo_Controller:"+request.getParameter("hNo"));
            command = new AdminHotelApprovalCommand();
            command.execute(sqlSession, model);
            
            return "redirect:adminHotelList";
         }
         // 관리자페이지 - 사업자 목록
         @RequestMapping("adminsellerlist1")
         public String adminsellerlist(HttpServletRequest request, Model model) {
            model.addAttribute("request", request);
            command = new AdminSellerListCommand();
            command.execute(sqlSession, model);
            
            return "admin/adminsellerlist";
         }
         
       //관리자페이지-사업자 연장 요청 list(강현)
         @RequestMapping("adminSellerList")
         public String goAdminSellerlist(HttpServletRequest request, Model model) {
            
            model.addAttribute("request", request);
            command = new AdminSellerListCommand();
            command.execute(sqlSession, model);
            
            return "admin/adminSellerListPage";
         }
         
      // 관리자 페이지 - 사업자 연장 요청 승인하기
         @RequestMapping(value="SellerExtendOk", method=RequestMethod.GET)
         public String SellerExtendOk(HttpServletRequest request, Model model) {     
            model.addAttribute("request", request);
            command = new AdminSellerExtendOKCommand();
            command.execute(sqlSession, model);
            return "redirect:adminSellerList";
         }
         
         //블랙리스트관련
         @RequestMapping(value = "adminBlack")
     	public String adminBlack(HttpServletRequest request, Model model) {
     		model.addAttribute("request", request);
     		command = new AdminblacklistCommand();
     		command.execute(sqlSession, model);
     		return "admin/adminAdmission";
     	}

        //블랙리스트관련
     	@RequestMapping(value = "blackagree")
     	public String blackagree(HttpServletRequest request, Model model) {
     		model.addAttribute("request", request);
     		command = new BlackagreeCommand();
     		command.execute(sqlSession, model);
     		return "redirect:adminBlack";
     	}
     	
        //블랙리스트관련

     	@RequestMapping(value = "blackdisagree")
     	public String blackdisagree(HttpServletRequest request, Model model) {
     		model.addAttribute("request", request);
     		command = new BlackdisagreeCommand();
     		command.execute(sqlSession, model);
     		return "redirect:adminBlack";
     	}
     	
     	 //관리자페이지-사업자 리뷰 삭제 요청 list(2022-10-20)
        @RequestMapping(value= "adminSellerReviewDelete")
        public String goadminSellerReviewDelete(HttpServletRequest request, Model model) {
        	
           command = new AdminReviewListCommand();
           command.execute(sqlSession, model);
           
           return "admin/adminSellerReviewDelete";
        }
        
        @RequestMapping(value= "adminSellerReviewDeleteRequest")
        public String goadminSellerReviewDeleteRequest(HttpServletRequest request, Model model) {       
           model.addAttribute("request", request);
           command = new AdminReviewDeleteOKCommand();
           command.execute(sqlSession, model);
           
           return "redirect:adminSellerReviewDelete";
        }

        @RequestMapping(value= "adminEventList")
        public String adminEventList(HttpServletRequest request, Model model) {       
           model.addAttribute("request", request);
           command = new AdminEventListCommand();
           command.execute(sqlSession, model);
           
           return "admin/adminEventListPage";
        }
        
        @RequestMapping(value= "adminEventExtendList")
        public String adminEventExtentList(HttpServletRequest request, Model model) {       
           model.addAttribute("request", request);
           command = new AdminExtentEventListCommand();
           command.execute(sqlSession, model);
           
           return "admin/adminEventExtendList";
        }
        
        
        @RequestMapping(value="adminEventOk")
        public String adminEventOk(HttpServletRequest request, Model model) {     
           model.addAttribute("request", request);
           command = new EventApprovalOKCommand();
           command.execute(sqlSession, model);
           return "redirect:adminEventList";
        }
        @RequestMapping(value="adminEventExtendOk")
        public String adminEventExtendOk(HttpServletRequest request, Model model) {     
           model.addAttribute("request", request);
           command = new EventExtendOKCommand();
           command.execute(sqlSession, model);
           return "redirect:adminEventExtendList";
        }
        @RequestMapping(value="adminEventCancleOk")
        public String adminEventCancleOk(HttpServletRequest request, Model model) {     
           model.addAttribute("request", request);
           command = new EventCancleOKCommand();
           command.execute(sqlSession, model);
           return "redirect:adminEventExtendList";
        }
         
}