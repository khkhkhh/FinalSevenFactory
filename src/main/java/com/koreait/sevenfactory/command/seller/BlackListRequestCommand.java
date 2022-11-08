package com.koreait.sevenfactory.command.seller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.sevenfactory.command.Command;
import com.koreait.sevenfactory.dao.SevenFactoryDAO;
import com.koreait.sevenfactory.dto.BlackListDTO;

public class BlackListRequestCommand implements Command {

   @Override
   public void execute(SqlSession sqlSession, Model model) {
      // 5.BlackListRequestCommand로 들어왔음.
      Map<String, Object> map = model.asMap();//맵을 인덱스 순으로 정렬
      HttpServletRequest request = (HttpServletRequest) map.get("request");
      // 1)아까 2) model에 넣어준 request를 빼내는 작업입니다.
      BlackListDTO bDTO = new BlackListDTO();
      // ex 객체를 쓰기위해 뉴예약어로 get set를 쓰기 위해 bDTO를 만들었음.
      bDTO.setmId(request.getParameter("userid"));
      // 2) (request.getParameter("userid"))를 mid에 넣이주기 위해서 setmid 메소드를 사용
      bDTO.setbReason(request.getParameter("reason"));
      // 3) (request.getParameter("reason"))를 breason에 넣이주기 위해서 setbreason 메소드를 사용
      // bDTO에 값이 다 들어가있음

      SevenFactoryDAO sDAO = sqlSession.getMapper(SevenFactoryDAO.class);
      // ex sqlSession.getMapper(SevenFactoryDAO.class를 = sDAO에 집어넣고
      sDAO.blacklist1(bDTO);
      //sqlSession.getMapper(SevenFactoryDAO.class)는 sDAO에서 blacklist1을 찾을수 있게 하는 메소드
      // 4)sDAO에 있는 쿼리인 blacklist1을 따지고 보면 매핑을 해주는건데 위에서 만든 bDTO도 같이 데려가요.

   }

}