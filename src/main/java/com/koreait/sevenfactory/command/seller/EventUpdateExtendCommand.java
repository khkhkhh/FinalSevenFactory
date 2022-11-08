package com.koreait.sevenfactory.command.seller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.sevenfactory.command.Command;
import com.koreait.sevenfactory.dao.SevenFactoryDAO;

public class EventUpdateExtendCommand implements Command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		SevenFactoryDAO sDAO = sqlSession.getMapper(SevenFactoryDAO.class);
		String sId = request.getParameter("sId");
		System.out.println("확인sId : " + sId);
		int eNo = Integer.parseInt(request.getParameter("eNo"));
		String eUpdate = request.getParameter("eUpdate");
		String eReason = request.getParameter("eReason");
		System.out.println("확인eNo : " + eNo);
		sDAO.updateExtend(sId,eNo,eUpdate,eReason); 
		model.addAttribute("sId",sId);

	}
}
