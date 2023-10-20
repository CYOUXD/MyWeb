package com.myweb.board.service;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.myweb.board.mode.BoardDAO;

public class RegistServiceImpl implements IBoardService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		//form에서 전달된 값을 처리. 컨트롤러에서 데이터를 받아서 처리
		//BoardController.jsp에서 보내준 값으로 메서드 사용
		String writer = request.getParameter("writer");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		//System.out.println("["+writer+", "+title+", "+content+"]");
		
		//DAO 객체를 생성
		//DAO 객체에 등록 메서드인 regist() 메서드를 호출
		BoardDAO dao = BoardDAO.getInstance();
		
		dao.regist(writer, title, content);
		
		//이미지 업로드 작업용
		String img = request.getParameter("image");
		System.out.println(img);
		File image = new File(img);
		System.out.println("image의 실제 위치 : "+image.getPath());
	}

}
