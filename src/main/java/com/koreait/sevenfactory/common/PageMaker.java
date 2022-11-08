package com.koreait.sevenfactory.common;

public class PageMaker {
	//qna  관련
	public static String getPageView(String path, int page, int recordPerPage, int totalRecord) {
		
		StringBuffer sb = new StringBuffer();
		
		int totalPage = 1;
		int pagePerBlock = 5;
		int beginPageOfBlock = 0;
		int endPageOfBlock = 0;
		
		totalPage = (int)(totalRecord / recordPerPage);//-->2
		if ( totalRecord % recordPerPage != 0 ) {
			totalPage++; //-->3
		}
		//totalrecord인 게시글 전체 갯수가 내가 설정한 페이지하나당 들어갈수있는 게시글의 갯수보다 많으면 페이지추가
	
		beginPageOfBlock = (int)(((page - 1) / pagePerBlock) * pagePerBlock) + 1;
		//1  beginRecord
		endPageOfBlock = beginPageOfBlock + pagePerBlock - 1;
		//5 endRecord
		
		if ( endPageOfBlock > totalPage ) {
			endPageOfBlock = totalPage;
			//위에서 계산한 totalPage를 endPageOfBlock에 넣어주기 위함
		}
		//endPageofBlock=3 beginPageOfBlock = 1  endRecord=5  pagePerBlock=5  page=1설정완료
		
		
		// 이전 버튼 표시
		if ( beginPageOfBlock < pagePerBlock ) {
			sb.append("<span style='color: lightgray;'>◀</span>&nbsp;&nbsp;");
			//버튼표시
		} else {
			sb.append("<a href='" + path + "?page=" + (beginPageOfBlock - 1) + "'>◀</a>&nbsp;&nbsp;");
		}
		
		// 페이지 번호 표시
		for ( int p = beginPageOfBlock; p <= endPageOfBlock; p++ ) {
			if ( p == page ) {
				sb.append("<span style='color: lightgray;'>" + p + "</span>&nbsp;&nbsp;");
				//html에 번호 추가   1~3
			} else {
				sb.append("<a href='" + path + "?page=" + p + "'>" + p + "</a>&nbsp;&nbsp;");
		
			}
		}
		
		
		// 다음 버튼 표시
		if(endPageOfBlock < 5){
			sb.append("<span style='color: lightgray;'>▶</span>");
			} else {
			if (totalPage%5 == 1 && endPageOfBlock %5 == 1){
			sb.append("<span style='color: lightgray;'>▶</span>");
			} else {
			if (totalPage <= endPageOfBlock){
			sb.append("<span style='color: lightgray;'>▶</span>");
			}else {
			if(totalPage%5 == 1 && endPageOfBlock%5 ==0){
				sb.append("<a href='" + path + "?page=" + (endPageOfBlock + 1) + "'>▶</a>&nbsp;&nbsp;");
			}else {
			sb.append("<a href='" + path + "?page=" + (endPageOfBlock + 1) + "'>▶</a>&nbsp;&nbsp;");
			}}}}

	/* end 5 미만일땐 무조건 다음으로 가는 버튼 비활성화
	 * 토탈페이지가 6,11,16,21 && end 5,10,15,20  버튼활성화
	 * 
	 * 토탈페이지가 6,11,16,21 && end 6,11,16,21 일때는 버튼 비활성화
	 * 
	 * 토탈페이지가 <= 엔드페이지 일때는 비활성화
	 */
		
		return sb.toString();
		
	}

}
