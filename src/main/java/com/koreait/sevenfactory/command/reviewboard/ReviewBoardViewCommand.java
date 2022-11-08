package com.koreait.sevenfactory.command.reviewboard;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.sevenfactory.command.Command;
import com.koreait.sevenfactory.dao.SevenFactoryDAO;
import com.koreait.sevenfactory.dto.ReplyDTO;
import com.koreait.sevenfactory.dto.ReviewDTO;

public class ReviewBoardViewCommand implements Command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		int rNo = Integer.parseInt(request.getParameter("rNo"));
		
		SevenFactoryDAO sDAO = sqlSession.getMapper(SevenFactoryDAO.class);
		
		ArrayList<ReplyDTO> reList = sDAO.selectReviewBoardReply(rNo);
		ReviewDTO hDTO = sDAO.selectReviewBoardByrNo(rNo);
		model.addAttribute("hDTO", hDTO);
		model.addAttribute("reList", reList);
		
	}

}
