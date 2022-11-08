package com.koreait.sevenfactory.command.seller;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.sevenfactory.command.Command;
import com.koreait.sevenfactory.dao.SevenFactoryDAO;
import com.koreait.sevenfactory.dto.SellerDTO;

public class SellerExtendRequestCommand implements Command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {

		Map<String, Object> map = model.asMap();

		HttpServletRequest request = (HttpServletRequest) map.get("request");
		int extend = 0;
		if (request.getParameter("extend") != null) {
			extend = Integer.parseInt(request.getParameter("extend"));
		}
		System.out.println("extend : " + extend);
		String sId = request.getParameter("sId");
		System.out.println("sId : " + sId);

		SevenFactoryDAO sDAO = sqlSession.getMapper(SevenFactoryDAO.class);
		ArrayList<SellerDTO> list = sDAO.selectSellerExtendRequest(sId); // 예약승인하기 쓰는거 1
		SellerDTO sDTO = sDAO.sellerByid(sId); // 쓰는거 2
		for (int i = 0; i < list.size(); i++) {
			System.out.println("list :" + list.get(i));
		}

		model.addAttribute("sellerDTO", sDTO);
		model.addAttribute("list", list);
		model.addAttribute("extend", extend);

	}

}
