package com.koreait.sevenfactory.command.reviewboard;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.sevenfactory.command.Command;
import com.koreait.sevenfactory.dao.SevenFactoryDAO;
import com.koreait.sevenfactory.dto.ReviewDTO;

public class MainReviewCommand implements Command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		// TODO Auto-generated method stub

		SevenFactoryDAO sDAO= sqlSession.getMapper(SevenFactoryDAO.class);
		
		ArrayList<ReviewDTO> list = sDAO.selectReviewBoardList2();
		model.addAttribute("list2", list);
	}

}
