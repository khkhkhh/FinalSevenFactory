package com.koreait.sevenfactory.command.member;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.sevenfactory.command.Command;
import com.koreait.sevenfactory.dao.SevenFactoryDAO;

public class AdminViewCommand implements Command{

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		// 회원 조회할 파라미터
		int mNo = Integer.parseInt(request.getParameter("mNo"));
		
		// 매퍼 가져오기
		SevenFactoryDAO sDAO = sqlSession.getMapper(SevenFactoryDAO.class);
		
		// model에 조회한 것 담기
		model.addAttribute("sDAO", sDAO.selectBymNo(mNo));
		
	}
}
