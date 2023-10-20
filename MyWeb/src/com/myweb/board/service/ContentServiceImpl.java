package com.myweb.board.service;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.myweb.board.mode.BoardDAO;
import com.myweb.board.mode.BoardVO;
import com.myweb.util.Criteria;
import com.myweb.util.PageVO;

public class ContentServiceImpl implements IBoardService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		/*
		 * 1. DAO에 getContent(num) 메서드를 생성하고 호출
		 * 2. getContent() 메서드에서는 num을 가지고 게시글에 대한 정보를 조회
		 * 		VO에 그 정보를 담아서 반환
		 * 3. 메서드 리턴 타입 BoardVO
		 * 4. 화면 전송을 위해서 리턴 타입의 값을 vo라는 이름으로 강제 저장
		 * 		전송할 경로 이름 : board_content.jsp(controller)
		 */

		//controller로 부터 받아온 데이터
		String num = request.getParameter("num");
		BoardDAO dao = BoardDAO.getInstance();
		
		
		//3. 쿠키는 서버로 전송 될 때 자동으로 request 객체에 담아져서 들어온다. 쿠키 검사
		Cookie[] arr = request.getCookies();
		
		//1. 조회수 업데이트 처리 : dao.upHit(num);
		//sql = "update board set hit=hit+1 where num=?";
		//dao.upHit(num);
		
		//4. 쿠키 중복 검증
		boolean bool = true;
		for(Cookie c : arr) {
			if(c.getName().equals("hitNum"+num)) {//이미 존재하는 쿠키 이름이 내가 조회한 게시글 번호와 같다면
				bool = false;
				break;
			}
		}
		if(bool) dao.upHit(num); //bool 값이 true : 읽은 적 없음 / false : 읽은 적 있음
		
		BoardVO vo = dao.getContent(num);
		
		request.setAttribute("vo", vo);
		
		//2. 중복 조회수 방지를 위한 쿠키 생성
		//조회한 글의 번호를 쿠키에 저장해서 중복 여부 판단
		Cookie hitCoo = new Cookie("hitNum"+num, num); //num = 게시글 번호
		hitCoo.setMaxAge(50);
		response.addCookie(hitCoo);
		
		//페이지 값을 받아 처리하여 넘겨지는 동작
		//String pageNum = request.getParameter("pageNum");
		//System.out.println("페이지 번호 : "+pageNum);
		//board_list.jsp에서 넘어온 pageNum 값으로 처리
		//request.setAttribute("pageNum", pageNum);
		//포워드기 때문에 파라미터가 그대로 전달되기 때문에 받은 데이터를 사용해서 따로 추가로 데이터를 만들지 않는다면 여기서 get, setParameter를 하지 않아도 됨
		
	}

}
