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
   private JavaMailSender mailSender;  // root-context.xml ??? ??? ?????? ??????
   private Command command;
   //jsp ????????? ??????
   @RequestMapping("registerPage2")
   public String goRegisterPage() {
      return "login2/registerPage2";
   }
   @RequestMapping("mod1")
   public String goRegisterPage2() {
      return "login2/modmemberinfo";
   }
   
   //jsp ????????? ???
   
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
   
   
   //AJAX ?????? 
   @RequestMapping(value="login",method=RequestMethod.POST)
   @ResponseBody 
   public String doLogin( HttpServletRequest request) {
      
      String mId = request.getParameter("mId");
      String mPw = request.getParameter("mPw");
      System.out.println(mPw);
      SevenFactoryDAO sDAO =  sqlSession.getMapper(SevenFactoryDAO.class);
      MemberDTO mDTO = sDAO.login(mId, mPw);
      JSONObject obj = new JSONObject();
      
      //mDTo = null??? ???????????? ?????? ????????? ??????
      if(mDTO != null) {
         // 1????????? ?????? , 0 ????????? ?????????
         if (mDTO.getmIsWithDrawal() != 0) {
            obj.put("result", "DELETED");
         }else {
            HttpSession session = request.getSession();
            session.setAttribute("loginDTO", mDTO);
            obj.put("result", "YES");
         }
      }
      // ?????? ?????? ???????????? ??? ???
      else { obj.put("result", "NO");}
      
      // ?????? json ???????????? ???????????? -> ????????? ????????????
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
   
         // 1. ??????????????? - ??????
         @RequestMapping("goMyPage")
         public String goMyPage() {
            
            return "myPage/myPageMain";
         }
         
         // 2. ??????????????? - ???????????? ?????? ??? ???????????? ?????? ????????? ??????
         @RequestMapping("myPage_pw_confirmPage")
         public String goMyPagePwConfirmPage() {
            return "myPage/myPagePwConfirmPage";
         }
   //***********************************************************************************************   
         // 3. ???????????????-????????????????????? ??????
         @RequestMapping("myUpdatePage")
         public String goMemberInfoPage(HttpServletRequest request, Model model) {
            model.addAttribute("request", request);
            command = new MyViewCommand();
            command.execute(sqlSession, model);
            return "myPage/myUpdatePage";
         }
         
         // 4. ??????????????? - ???????????? ????????????
         @RequestMapping(value="myUpdate", method=RequestMethod.POST)
         public String myPageUpdate(HttpServletRequest request, Model model) {
            
            model.addAttribute("request", request);
            command = new MyUpdateCommand();
            command.execute(sqlSession, model);
            
            return "redirect:myUpdatePage?mId=" + request.getParameter("mId");
         }
         
      //****************************************************************************************************   
         
           // 5. ???????????????-??????Q&A ?????????-LIST
            @RequestMapping("myBoardView")
            public String goMyReviewBoard(HttpServletRequest request, Model model) {
               model.addAttribute("request", request);
              command = new MyBoardViewCommand();
              command.execute(sqlSession, model);
               return "myPage/myQnaListBoard";
            }
            
         
         
         // Email ??????
         @SuppressWarnings("unchecked")
         @RequestMapping(value="EmailCheck",method=RequestMethod.POST)
         public String emailCheck(HttpServletRequest request, HttpServletResponse response) {
            // 1. ???????????? ???????????? ??????
            String mEmail = request.getParameter("mEmail");
            
            // 2. mEmail ??? ?????? ?????? ?????? ??????
            SevenFactoryDAO sDAO = sqlSession.getMapper(SevenFactoryDAO.class);
            MemberDTO mDTO = sDAO.selectBymEmail(mEmail);
            
            // 3. ????????? JSONObject ?????? ??????
            JSONObject obj = new JSONObject();
            
            // 4. mId ??? ?????? ????????? ????????? obj ??? result ????????? "EXIST" ??????
            //    mId ??? ?????? ????????? ????????? obj ??? result ????????? "" ??????
            if ( mDTO != null ) {
               obj.put("result", "EXIST");
            } else {
               obj.put("result", "");
            }
                        
            return obj.toJSONString();
         }
         
         // ??????????????? ??????
         @RequestMapping("myLeavePage")
         public String myPageLeavePage(@RequestParam("mId") String mId, Model model) {
            
            model.addAttribute("mDTO", mId);
            
            return "myPage/myLeavePage";
         }
         // ?????? ????????????
         @RequestMapping(value="myLeave")
         public String myPageLeave(HttpServletRequest request, Model model) {
            
            model.addAttribute("request", request);
            command = new MyLeaveCommand();
            command.execute(sqlSession, model);
            /*// 1. ?????? ?????? ???????????? ??????
            String mId = request.getParameter("mId");
                        
            // 2. mId ?????? ??????
            SevenFactoryDAO sDAO = sqlSession.getMapper(SevenFactoryDAO.class);
            int result = sDAO.leaveMember(mId);
                        
            // 3. ????????? ????????? JSONObject ??????
            JSONObject obj = new JSONObject();
                        
            // 4. JSONObject ??? ?????? result ??????
            if (result > 0) {
               obj.put("result", "SUCCESS");
               request.getSession().invalidate();  // ?????? ?????????
            } else {
               obj.put("result", "FAIL");
            }*/
            return "redirect:logout";         
         }
      //**********************************************************************************************************************************
         
         // ?????????
         // ????????? ????????? - MAIN ??????(????????????)
         @RequestMapping("adminMain")
         public String goAdminMain() {
            
            return "admin/adminMain";
         }
         
         
         // ????????? ????????? - VIEW
         @RequestMapping("adminViewPage")
         public String goAdminView(HttpServletRequest request, Model model) {
            
            model.addAttribute("request", request);
            command = new AdminViewCommand();
            command.execute(sqlSession, model);
            
            return "admin/adminViewPage";
         }
         
         // ????????? ????????? - ??????????????????
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
         
         // ?????????????????? - LEAVE(???????????????)
         @RequestMapping("adminLeave")
         public String adminLeave(HttpServletRequest request, Model model) {
            
            model.addAttribute("request", request);
            command = new AdminLeaveCommand();
            command.execute(sqlSession, model);
            
            return "redirect:adminList";
         }
         
         // ?????????????????? - ?????????????????? ????????? ?????? ????????????
         @RequestMapping("adminMaking")
         public String adminMaking(HttpServletRequest request, Model model) {
            
            model.addAttribute("request", request);
            command = new AdminMakeCommand();
            command.execute(sqlSession, model);
            
            return "redirect:adminList";
         }
         // ?????????????????? - ??????????????? ?????????????????? ????????????
         @RequestMapping("userMaking")
         public String userMaking(HttpServletRequest request, Model model) {
            
            model.addAttribute("request", request);
            command = new AdminUserChangeCommand();
            command.execute(sqlSession, model);
            
            return "redirect:adminList";
         }
         // ????????? ????????? - ???????????? LIST
         @RequestMapping("adminList")
         public String goAdminlist(HttpServletRequest request, Model model) {
            
            model.addAttribute("request", request);
            command = new AdminListCommand();
            command.execute(sqlSession, model);
            
            return "admin/adminListPage";
         }
         
         // ?????????????????? - ????????????
         @RequestMapping("queryAdminListPage")
         public String queryAdminListPage(HttpServletRequest request, Model model) {
            model.addAttribute("request", request);
            command = new AdminSearchMemberCommand();
            command.execute(sqlSession, model);
            return "admin/adminListPage";
         }
         
      // ?????????????????? - ?????????
         @RequestMapping("queryAdminPostListPage")
         public String queryAdminPostListPage(HttpServletRequest request, Model model) {
            model.addAttribute("request", request);
            command = new AdminQueryListCommand();
            command.execute(sqlSession, model);
            return "admin/adminPostPage";
         }
         
         //??????????????????-??????????????? list
         @RequestMapping("adminPostList")
         public String goAdminPostlist(HttpServletRequest request, Model model) { 
            model.addAttribute("request", request);
            command = new AdminPostListCommand();
            command.execute(sqlSession, model);
            return "admin/adminPostListPage";
         }       
         
         // ????????? ????????? - ???????????? ?????? - LIST
         @RequestMapping("adminReservationList")
         public String goAdminReservation(HttpServletRequest request, Model model) {
            
            model.addAttribute("request", request);
            command = new AdminReservationListCommand();
            command.execute(sqlSession, model);
            
            return "admin/adminReservationListPage";
         }
         // ?????????????????? - ???????????? ?????? ?????? ??????
         @RequestMapping("queryAdminReservationPage")
         public String queryAdminReservationPage(HttpServletRequest request, Model model) {
            
            model.addAttribute("request", request);
            command = new AdminQueryReservationListCommand();
            command.execute(sqlSession, model);
            
            return "admin/adminReservationListPage";
         }
               
         // ????????? ????????? - ???????????? ?????? - ?????? ????????????
         @RequestMapping(value="ReservationOk", method=RequestMethod.POST)
         public String ReservationOk(HttpServletRequest request, Model model) {
                  
            model.addAttribute("request", request);
            command = new AdminReservationOKCommand();
            command.execute(sqlSession, model);
            return "redirect:adminReservationList?rNo=" + request.getParameter("rNo");
         }
         // ????????? ????????? - ???????????? ?????? - ?????? ????????????
         @RequestMapping(value="ReservationCancel", method=RequestMethod.POST)
         public String ReservationCancel(HttpServletRequest request, Model model) {
                     
            model.addAttribute("request", request);
            command = new AdminReservationCancelCommand();
            command.execute(sqlSession, model);
            return "redirect:adminReservationList";
         }
         // ????????? ????????? - ???????????? ?????? - ?????? ????????????
         @RequestMapping(value="ReservationDelete", method=RequestMethod.POST)
         public String ReservationDelete(HttpServletRequest request, Model model) {
                           
            model.addAttribute("request", request);
            command = new AdminReservationDeleteCommand();
            command.execute(sqlSession, model);
            return "redirect:adminReservationList";
         }
         
         // ????????? ????????? - ?????????????????????
         @RequestMapping("adminHotelList")
         public String adminHotelList(HttpServletRequest request, Model model) {
            model.addAttribute("request", request);
            command = new AdminHotelListCommand();
            command.execute(sqlSession, model);
            
            return "admin/adminhotelapproval";
         }
         // ????????? ????????? - ????????????
         @RequestMapping("hotelapproval")
         public String approval(HttpServletRequest request, Model model) {
            model.addAttribute("request", request);
            System.out.println("hNo_Controller:"+request.getParameter("hNo"));
            command = new AdminHotelApprovalCommand();
            command.execute(sqlSession, model);
            
            return "redirect:adminHotelList";
         }
         // ?????????????????? - ????????? ??????
         @RequestMapping("adminsellerlist1")
         public String adminsellerlist(HttpServletRequest request, Model model) {
            model.addAttribute("request", request);
            command = new AdminSellerListCommand();
            command.execute(sqlSession, model);
            
            return "admin/adminsellerlist";
         }
         
       //??????????????????-????????? ?????? ?????? list(??????)
         @RequestMapping("adminSellerList")
         public String goAdminSellerlist(HttpServletRequest request, Model model) {
            
            model.addAttribute("request", request);
            command = new AdminSellerListCommand();
            command.execute(sqlSession, model);
            
            return "admin/adminSellerListPage";
         }
         
      // ????????? ????????? - ????????? ?????? ?????? ????????????
         @RequestMapping(value="SellerExtendOk", method=RequestMethod.GET)
         public String SellerExtendOk(HttpServletRequest request, Model model) {     
            model.addAttribute("request", request);
            command = new AdminSellerExtendOKCommand();
            command.execute(sqlSession, model);
            return "redirect:adminSellerList";
         }
         
         //?????????????????????
         @RequestMapping(value = "adminBlack")
     	public String adminBlack(HttpServletRequest request, Model model) {
     		model.addAttribute("request", request);
     		command = new AdminblacklistCommand();
     		command.execute(sqlSession, model);
     		return "admin/adminAdmission";
     	}

        //?????????????????????
     	@RequestMapping(value = "blackagree")
     	public String blackagree(HttpServletRequest request, Model model) {
     		model.addAttribute("request", request);
     		command = new BlackagreeCommand();
     		command.execute(sqlSession, model);
     		return "redirect:adminBlack";
     	}
     	
        //?????????????????????

     	@RequestMapping(value = "blackdisagree")
     	public String blackdisagree(HttpServletRequest request, Model model) {
     		model.addAttribute("request", request);
     		command = new BlackdisagreeCommand();
     		command.execute(sqlSession, model);
     		return "redirect:adminBlack";
     	}
     	
     	 //??????????????????-????????? ?????? ?????? ?????? list(2022-10-20)
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