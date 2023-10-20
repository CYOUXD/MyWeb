package com.myweb.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.do")
public class MainController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MainController() {
        super();
    }
    
    /*
     * 생성된 서블릿을 이용하여 다른 페이지에 접근할 수 있게 만들어 보자
     * Member 네비게이트 클릭 시 (member.do)에 /member/member.jsp로 접근할 수 있게 만들기
     * member.do가 아닌 경우에는 무조건 Home으로 접근하게 설정
     */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//메인 페이지는 무조건 get으로 접근		
		String uri = request.getRequestURI();
		String path = request.getContextPath();
		String command = uri.substring(path.length());
		
		//System.out.println(command);
		
		if(command.equals("/member.do")) {
			RequestDispatcher dp = request.getRequestDispatcher("member/member.jsp");
			dp.forward(request, response);
		}else {
			RequestDispatcher dp = request.getRequestDispatcher("index.jsp");
			dp.forward(request, response);
		}
	}
}
