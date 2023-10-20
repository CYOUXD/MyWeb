package com.myweb.board.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.myweb.board.mode.BoardDAO;
import com.myweb.board.mode.BoardVO;
import com.myweb.util.Criteria;
import com.myweb.util.PageVO;

public class GetListServiceImpl implements IBoardService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
//		//DAO 객체 생성
//		BoardDAO dao = BoardDAO.getInstance();
//		List<BoardVO> list = dao.getList(); //목록 조회 결과를 list 형태로 반환
//		
//		//DB로 부터 받은 데이터를 저장(request에 강제 저장)
//		request.setAttribute("list", list);
		
		//페이징 처리
		BoardDAO dao = BoardDAO.getInstance();
		
		//Criteria 객체 생성
		Criteria cri = new Criteria();
		
		//페이지 값을 받아 처리하여 넘겨지는 동작
		//System.out.println("페이지 번호 : "+request.getParameter("pageNum"));
		//board_list.jsp에서 넘어온 pageNum 값으로 처리
		if(request.getParameter("pageNum") != null) {
			String pageNum = request.getParameter("pageNum");
			cri.setPageNum(Integer.parseInt(pageNum));
		}
		
		List<BoardVO> list = dao.getList(cri); 
		request.setAttribute("list", list);
		
		//화면에 보여질 페이지 버튼을 계산
		//1. 총 게시글 수
		int total = dao.getTotal();
		
		PageVO vo = new PageVO(total, cri);
		
		request.setAttribute("pageVO", vo);
	}

}
