package com.koreait.sevenfactory.command.qnaboard;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.sevenfactory.command.Command;
import com.koreait.sevenfactory.common.PageMaker;
import com.koreait.sevenfactory.dao.SevenFactoryDAO;
import com.koreait.sevenfactory.dto.QNADTO;

public class QNABoardListCommand implements Command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> mMap = model.asMap();
		HttpServletRequest request = (HttpServletRequest) mMap.get("request");
		//페이지 이동에서 데이터 쓰기 편한 형태로 변환 
		
		int page = 1;
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		//HttpServletRequest형태의 page를 int형으로 바꾸기 위함.
		
		int recordPerPage = 5;
		int beginRecord2 = (page-1) * recordPerPage ;//0//5
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("beginRecord2", beginRecord2);

		
		SevenFactoryDAO qDAO = sqlSession.getMapper(SevenFactoryDAO.class);
		
		ArrayList<QNADTO> list = qDAO.selectQNABoard(map);
		int totalRecord = qDAO.getTotalRecord();
		String pageView = PageMaker.getPageView("qnaBoardList", page, recordPerPage, totalRecord);  
		
		model.addAttribute("list", list);
		model.addAttribute("page", page);
		model.addAttribute("pageView", pageView);
		model.addAttribute("totalRecord", totalRecord);

	}

}
