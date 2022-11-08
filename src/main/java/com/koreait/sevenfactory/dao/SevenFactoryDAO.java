package com.koreait.sevenfactory.dao;

import java.util.ArrayList;
import java.util.Map;

import com.koreait.sevenfactory.dto.BlackListDTO;
import com.koreait.sevenfactory.dto.EventDTO;
import com.koreait.sevenfactory.dto.GuestRoomDTO;
import com.koreait.sevenfactory.dto.HotelDTO;
import com.koreait.sevenfactory.dto.MemberDTO;
import com.koreait.sevenfactory.dto.NoticeDTO;
import com.koreait.sevenfactory.dto.QNADTO;
import com.koreait.sevenfactory.dto.ReplyDTO;
import com.koreait.sevenfactory.dto.ReservationDTO;
import com.koreait.sevenfactory.dto.ReservationViewDTO;
import com.koreait.sevenfactory.dto.ReviewDTO;
import com.koreait.sevenfactory.dto.SellerDTO;

public interface SevenFactoryDAO {

    // ****************************************************************************************************************************************
    // 예약가능한 객실 리스트 검색
    // public ArrayList<GuestRoomDTO> selectBookableList(String rCheckOut, String
    // rCheckIn);
    public ArrayList<HotelDTO> selectBookableList(String rCheckOut, String rCheckIn);

    public ArrayList<ReservationDTO> selectMyReservation(int mNo);

    public void reservationCancle(int rNo);

   /*
    /*
 * public int insertReservation(int gNo, int mNo, int rApproval, int rPeople,
     * int rPrice, String rCheckIn, String rCheckOut);
     */

    public GuestRoomDTO selectGuestRoom(int gNo);

    public void kakaopayinsertReservation1(int gNo, int mNo, int hNo, int rPeople, int rPrice, String rCheckIn,
          String rCheckOut);

    public void kakaopayinsertReservation2(int gNo, int hNo, String nmName, int rPeople, int rPrice, String rCheckIn,
          String rCheckOut);
   //블랙리스트 여부확인
   public String getblacklist(int mNo);
   //결제후 포인트 빼기 
   public void usepoint(int mNo, int usePoint);
   //결제후 포인트 부여
   public void addpoint(int mNo,int mPoint);

   
public int insertReservation1(int gNo, int mNo, int rPeople, int rPrice, String rCheckIn, String rCheckOut,
          int nHo);

    public int insertReservation2(int gNo, String nmPhone, int rPeople, int rPrice, String rCheckIn, String rCheckOut,
          int nHo);

    public Integer confirmReservation(int gNo, String rCheckIn, String rCheckOut);

    // 비회원
    public ArrayList<ReservationDTO> selectNonmemberReservation(String nmName, String nmPhone);

    public int selectNonmemberExistence(String nmPhone);

    public void insertNonMember(String nmName, String nmPhone);

    public String selectNmId(String nmPhone);

    // ****************************************************************************************************************************************

    // registor 회원가입
    public void registor(MemberDTO mDTO);

    // 아이디 찾기
    public MemberDTO findId(String mName, String mEmial);

    // 비밀번호 찾기
    public MemberDTO findPw(String mId, String mEmail);

    // 비밀번호 변경
    public int changePw(String mPw, String mId);

    // 로그인
    public MemberDTO login(String mId, String mPw);

    // 아이디 중복체크
    public MemberDTO idCheck(String mId);

    // 이메일 중복체크
    public MemberDTO emailCheck(String mEmail);

    // 전화번호 중복체크
    public MemberDTO phoneCheck(String mPhone);

    // ****************************************************************************************************************************************
    // 호텔 전체 리스트
    // hotelList
    public ArrayList<HotelDTO> hotelList();

    // 호텔 정보
    public ArrayList<HotelDTO> hotelinfo(int hNo);

    // 호텔 최저가 구하기
    // hotelList
    public int hotelminprice(int hNo);

    // 객실정보 리스트
    // guestRoomList
    public ArrayList<GuestRoomDTO> guestRoomList(String rCheckIn, String rCheckOut, int hNo);

    // 객실정보
    public ArrayList<GuestRoomDTO> guestRoomListAll(int hNo);

    // 리뷰 객실
    public ArrayList<GuestRoomDTO> reviewGuestroomList(int hNo);

    // 객실 상세정보
    // guestRoomView
    public GuestRoomDTO guestRoomView(int hNo);

    public Double guestRoomRating(String gName);

    public int guestRoomRatingVote(String gName);
    // ****************************************************************************************************************************************

    // qna
    public ArrayList<QNADTO> selectQNABoard(Map<String, Integer> map);

    public int getTotalRecord();

    public QNADTO selectByqNo(int qNo);

    public void updateQNABoard(String qTitle, String qContent, int qNo);

    public void deleteQNABoard(int qNo);

    public int insertQNABoard1(String mId, String qTitle, String qPw, String qContent);

    public int insertQNABoard2(String mId, String nmName, String qTitle, String qPw, String qContent);

    public int insertQNABoardReply(String mId, String reContent, int qNo);

    public ArrayList<ReplyDTO> selectQNABoardReply(int qNo);

    public void deleteQNABoardReply(int reNo);

    public void updateQNABoardReply(String updateReContent, int reNo);

    // *********************************************************************************************//
    // 신시명
    // review
    // 1. ReviewBoardInsert
    public void ReviewBoardInsert(String rTitle, String rContent, String mId, String saveFilename, double rRating,
          String gName, int rIsdelete);

    // 2. selectReviewBoardList
    public ArrayList<ReviewDTO> selectReviewBoardList(Map<String, Integer> map);

    // 2.0 selectReviewBoardList2
    public ArrayList<ReviewDTO> selectReviewBoardList2();

    // 2.5 getReviewTotalRecord
    public int getReviewTotalRecord();

    // 3. selectReviewBoardByrNo(rNo)
    public ReviewDTO selectReviewBoardByrNo(int rNo);

    // 4. deleteReviewBoardByrNo(rNo)
    public void deleteReviewBoardByrNo(int rNo);

    // 5. updateReviewBoardByrNo(String rTitle, String rContent, String rFilename)
    public void updateReviewBoardByrNo(String rTitle, String rContent, String rFilename, double rRating, String gName,
          int rNo);

    // 6. insertReviewBoardReply(String mId, String reContent, int rNo)
    public void insertReviewBoardReply(String mId, String reContent, int rNo);

    // 7. selectReviewBoardReply(int rNo)
    public ArrayList<ReplyDTO> selectReviewBoardReply(int rNo);

    // 8. deleteReviewBoardReplyByreNo(int reNo)
    public void deleteReviewBoardReplyByreNo(int reNo);

    // 9. updateReviewBoardReply(int reNo)
    public void updateReviewBoardReply(String reContent, int reNo);

    // 10. selectCheckReviewBoardList(Map map)
    public ArrayList<ReviewDTO> selectCheckReviewBoardList(Map<String, String> map);

    // 10.5 getReviewTotalRecord()
    public int getReviewTotalCheckRecord(String gName);

    // **********************************************************************************************************************************************************

    // notice
    // 1. selectNoticeBoardList
    public ArrayList<NoticeDTO> selectNoticeBoardList(Map<String, Integer> map);

    public int getTotalRecordNotice();

    // 2. insertNoticeBoard
    public int insertNoticeBoard(int mNo, String nTitle, String nContent, String nFilename, String nImg);

    // 3. selectNoticeBoardBynNo
    public NoticeDTO selectNoticeBoardBynNo(int nNo);

    // 4. deleteNoticeBoard
    public int deleteNoticeBoard(int nNo);

    // 5. updateNoticeBoardHit
    public void updateNoticeBoardHit(int nNo);

    // **********************************************************************************************************************************************************

    // **********************************************************************************************************************************************************
    // 이병한
    // 마이페이지 - 회원벙보 업데이트
    public void memberUpdate(MemberDTO mDTO);

    // ajax 를 이용한 mEmail 조회
    public MemberDTO selectBymEmail(String mEmail);

    // 회원탈퇴(삭제)
    public void leaveMember(String mId);

    // 나의 질문글 보기
    public ArrayList<QNADTO> selectMyBoardList(Map<String, String> map);
//**********************************************************************************************************************************************************************

    // 관리자페이지 -- 전체 회원 리스트 조회
    public ArrayList<MemberDTO> userList(Map<String, Integer> map);

    // 관리자페이지 -- 전체 회원목록 글 갯수
    public int getTotalMember();

    // 관리자페이지 -- 전체 게시글 리스트 조회(강현)
    public ArrayList<NoticeDTO> adminNoticeList(Map<String, Integer> map3);

    public ArrayList<QNADTO> adminQnaList(Map<String, Integer> map4);

    public ArrayList<ReviewDTO> adminReviewList(Map<String, Integer> map5);

    public int getTotalPost();

    public ArrayList<SellerDTO> sellerextendList(Map<String, Integer> map2);

    // 관리자페이지 -- 회원 상세보기
    public MemberDTO selectBymNo(int mNo);

    // 관리자페이지 -- 회원 추가하기
    public void userInsert(MemberDTO mDTO);

    // 관리자페이지 -- 회원 탈퇴시키기
    public void userLeave(String mId);

    // 관리자페이지 -- 관리자 권한 부여하기
    public void changeAdmin(String mId);

    // 관리자페이지 -- 일반회원 권한 부여하기
    public void changeUser(String mId);

    // 관리자페이지 -- 회원검색하기
    public ArrayList<MemberDTO> queryAdminList(Map<String, String> map2);
    
    // 관리자페이지 --QNA 검색된 게시글 구하기
    public ArrayList<QNADTO> queryAdminQNAList(Map<String, String> map2);
    
    // 관리자페이지 --QNA 검색된 게시글 구하기
    public ArrayList<NoticeDTO> queryAdminNOTICEList(Map<String, String> map2);
    
    // 관리자페이지 --QNA 검색된 게시글 구하기
    public ArrayList<ReviewDTO> queryAdminREVIEWList(Map<String, String> map2);
    
    public int getQueryRecord(Map<String, String> map2);

    // 관리자페이지 -- 검색한 레코드 갯수만큼만 페이징
    public ArrayList<MemberDTO> queryAdminList2(Map<String, String> map2);

    public int getQueryQNARecord(Map<String, String> map2);
    
    public int getQueryNOTICERecord(Map<String, String> map2);
    
    public int getQueryREVIEWRecord(Map<String, String> map2);
    
    // 관리자페이지 -- 전체 예약 현황 - 예약 승인하기
    public void adminReservationOK(int rNo);

    // 관리자페이지 -- 전체 예약 현황 - 미승인 예약 취소하기
    public void adminReservationCancel(int rNo);

    // 관리자페이지 -- 전체 예약 현황 - 승인 예약 삭제하기
    public void adminReservationDelete(int rNo);

    // 관리자페이지 -- 전체 예약 현황 - 리스트 조회(예약테이블만 가져온다)
    public ArrayList<ReservationViewDTO> reservationList(Map<String, Integer> map2);

    public int getTotalReservationCount();

    // 관리자페이지 -- 전체 예약 현황 - 리스트 검색하기
    public ArrayList<ReservationViewDTO> queryAdminReservationList(Map<String, String> map2);

    public int getQueryReservationRecord(Map<String, String> map2);

    public ArrayList<ReservationViewDTO> nonMemberReservationList(Map<String, Integer> map2);

    public void deleteNonMemberReservationNumber(int rNo);

    public MemberDTO kakaologin(String id, String name, String email);

    public MemberDTO selectBymId(String id);

    public MemberDTO kakaologin(String id, String name, String email, String birthday);

    public ArrayList<GuestRoomDTO> guestRoomList(int hNo);

    public ArrayList<String> guestRoomNoList(int hNo);
   
   public int memberPoint(String mId);

   
public int getTotalQna();

    public int getTotalNotice();

    public int getTotalReview();

    public ArrayList<ReservationViewDTO> queryAdminReservationList(Map<String, String> map2, Map<String, Integer> map3);

    public int getQueryReservationRecord(Map<String, String> map2, Map<String, Integer> map3);
   
   
//관리자페이지 - 미승인호텔 
    public ArrayList<HotelDTO> hotelnoapprovalList();
          
    //관리자페이지 - 호텔승인
    public void adminHotelApproval(int hNo);
          
    //관리자페이지 - totalRecord호텔
    public int getTotalHotel();
          
    //관리자페이지 - 사업자 목록 
    public ArrayList<SellerDTO>adminsellerlist();
          
    //관리자페이지 - 사업자수 
    public int getSellerHotel();
         
       
//관리자페이지 -- 리뷰삭제요청 리스트 불러오기
    public ArrayList<ReviewDTO> adminDReviewList();
         
       
//관리자페이지 -- 사업자 리뷰 삭제 승인
    public void adminSellerReviewDeleteOK(String mId);

    // **********************************************************************************************************************************************************************
    // 사업자

    // sellerregistor 회원가입
    public void sellerregistor(SellerDTO sDTO);
   
   
//호텔 더미 insert
       public void sellerhotelinsert1();
       
       //호텔 더미 이름 받아오기
       public String hotelName1();
       
       //호텔 진짜 insert
       public void sellerhotelregistor(HotelDTO hDTO);

    // 사업자로그인
    public SellerDTO sellerlogin(String sId);

    // 사업자비밀번호 찾기
    public SellerDTO findSellerPw(String sId, String sEmail);

    // 사업자 비밀번호 변경
    public int changeSellerPw(String sPw, String sId);

    // 사업자 아이디 중복체크
    public SellerDTO sidCheck(String sId);

    // 사업자 이메일 중복체크
    public SellerDTO semailCheck(String sEmail);

    // 사업자 전화번호 중복체크
    public SellerDTO sphoneCheck(String sPhone);

    // 사업자 연장 승인
    public void adminSellerExtendOK(int extend, int sNo);

    public ArrayList<SellerDTO> selectSellerExtendRequest(int extend);

    public SellerDTO sellerlogin(String sId, String sPw);

    public SellerDTO sellerByid(String sId);

    public ArrayList<SellerDTO> selectSellerExtendRequest(int extend, String sId);

    public void updateSellerExtendRequest(String sId);

    public ArrayList<SellerDTO> selectSellerExtendRequest(String sId);
   
   
// 사업자 블랙리스트 요청 void=보낼값이 없을때 쓰면됨.
       public void blacklist1(BlackListDTO bDTO);
       //6.아까 넣은 bDTO도 가지고 왔어요. sevenfactory.xml로 가서 아이디가 blacklist1를 찾고!

       //관리자 블랙리스트 리스트 불러오기
       public ArrayList<BlackListDTO> mright();
       
       public void blackagree(int bNo);
       
       public void blackdisagree(int bNo);
     // 사업자 예약내역 
       public ArrayList<ReservationDTO> sellerreservation(String sId);
      //사업자 예약승인
       public void reservationapproval(int rNo);
       //방리스트
       public ArrayList<GuestRoomDTO> guestRoomList1(String sId);
       
       //사업자 예약리스트 
       public ArrayList<ReservationDTO> allReservationList(String sId);
       
       //사업자 리뷰
       public void updateSellerReviewRequest(int rNo);
       
       public ArrayList<ReviewDTO>selectSellerReviewRequest(String sId);

       //이벤트 추가 dao
	   public String hotelNameBySid(String sId);

	   public int hnoByHname(String hName);
	   
	   public ArrayList<String> gnameByHno(int hNo);

	   public ArrayList<EventDTO> eventBySid(String sId);

	   public void insertEvent();

	   public void insertEvent(String gName, int ePrice, String eStart, String eEnd, String eAddtion, String eThumbnail,
			int eXtend, String sId, int eApproval, int eDELETE,String eREASON ,String eUPDATE);

	   public ArrayList<EventDTO> selectEvent();

	   public void updateEventApproval(int eNo);

	   public ArrayList<EventDTO> gnameBysId(String sId);

	   public void updateEndDate(String gName, String sId);

	   public void updateExtend(String sId, int eNo, String eUpdate, String eReason);

	   public void updateDELETE(String sId, int eNo);

	   public ArrayList<EventDTO> selectExtendEvent();

	   public void adminEventExtendOK(int extend, String eReason);

	   public void adminEventCancleOK(int eNo);

	   public String selectUpdateByeNo(int eNo);
}		
