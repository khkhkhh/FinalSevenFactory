package com.koreait.sevenfactory.command.member;

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

public class AdminQueryListCommand implements Command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		Map<String, Object> map1 = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map1.get("request");
		
		// 검색 파라미터
		String board =request.getParameter("board");
	    String column = request.getParameter("column");  // 검색할 칼럼
		String query = request.getParameter("query");  // 검색할 내용
		
		// beginRecord + endRecord = Map
		Map<String, String> map2 = new HashMap<String, String>();
		map2.put("column", column);
		map2.put("query", query);
		
		SevenFactoryDAO sDAO = sqlSession.getMapper(SevenFactoryDAO.class);
		if(board.equals("QNA")) {
		// DB에서 list 가져오기
		ArrayList<QNADTO> list2 = sDAO.queryAdminQNAList(map2);
		model.addAttribute("list2", list2);
		int totalRecord = sDAO.getQueryQNARecord(map2);
		model.addAttribute("totalQNARecord", totalRecord);
		}
		else if(board.equals("NOTICE")) {
		ArrayList<NoticeDTO> list1 = sDAO.queryAdminNOTICEList(map2);
		model.addAttribute("list1", list1);
		int totalRecord = sDAO.getQueryNOTICERecord(map2);
		model.addAttribute("totalNoticeRecord", totalRecord);
		}
		else {
		ArrayList<ReviewDTO> list3 = sDAO.queryAdminREVIEWList(map2);
		model.addAttribute("list3", list3);
		int totalRecord = sDAO.getQueryREVIEWRecord(map2);
		model.addAttribute("totalReviewRecord", totalRecord);
		}
		
		
	}
}
