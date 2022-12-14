package com.koreait.sevenfactory.command.reviewboard;

import java.io.File;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.koreait.sevenfactory.command.Command;
import com.koreait.sevenfactory.dao.SevenFactoryDAO;

public class ReviewBoardUpdateCommand implements Command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> map = model.asMap();
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest) map.get("mr");
		
		String rTitle = mr.getParameter("rTitle");
		String rContent = mr.getParameter("rContent");
		MultipartFile files = mr.getFile("files");
		Double rRating = Double.parseDouble(mr.getParameter("rating"));
		String gName = mr.getParameter("gName");
		int rNo = Integer.parseInt(mr.getParameter("rNo"));
		
		//db에 등록하기(MyBatis4_iBoard참고)
		
		//원래파일이름
		String originFilename = files.getOriginalFilename(); 
		
		if(originFilename != "") {
			//originFilename에서 확장자 분리
			String extName = originFilename.substring(originFilename.lastIndexOf(".") + 1);
			
			//저장할 파일 이름 만들기
			String saveFilename = null;
			try {
				saveFilename = originFilename.substring(0, originFilename.lastIndexOf(".")) + "_" +
						System.currentTimeMillis() + "." + extName;
				
				String realPath = mr.getSession().getServletContext().getRealPath("/resources/storage");
				
				File directory = new File(realPath);
				if (!directory.exists()) {
					directory.mkdirs();
				}
				
				File saveFile = new File(realPath, saveFilename);
				
				files.transferTo(saveFile);
				
				//DB에 저장하기(DAO와 연결부)
				SevenFactoryDAO sDAO = sqlSession.getMapper(SevenFactoryDAO.class);
				sDAO.updateReviewBoardByrNo(rTitle, rContent, saveFilename, rRating, gName, rNo);
				
			} catch(Exception e) {
				e.printStackTrace();
			}
			
		}else {
			String saveFilename = "No File";
			SevenFactoryDAO sDAO = sqlSession.getMapper(SevenFactoryDAO.class);
			sDAO.updateReviewBoardByrNo(rTitle, rContent, saveFilename, rRating, gName, rNo);
		}
	}

}
