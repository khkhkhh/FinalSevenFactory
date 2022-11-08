package com.koreait.sevenfactory.command.noticeboard;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.sevenfactory.command.Command;
import com.koreait.sevenfactory.dao.SevenFactoryDAO;

public class NoticeBoardViewCommand2 implements Command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		// TODO Auto-generated method stub
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		int nNo = Integer.parseInt(request.getParameter("nNo"));
		
		SevenFactoryDAO sDAO = sqlSession.getMapper(SevenFactoryDAO.class);

		model.addAttribute("nDTO", sDAO.selectNoticeBoardBynNo(nNo));
	}
	}

