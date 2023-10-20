package com.myweb.board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.myweb.board.mode.BoardDAO;

public class DeleteServiceImple implements IBoardService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String num = request.getParameter("num");
		
		BoardDAO dao = BoardDAO.getInstance();
		dao.delete(num);
	}

}
