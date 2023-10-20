<%@page import="com.myweb.user.model.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><!-- 4 -->
	<%
	UserVO vo = new UserVO();
	vo.setId("apple");
	vo.setName("홍옥");
	vo.setAddress("과수원");
	
	request.setAttribute("vo", vo);
	
	//포워드 이동
	RequestDispatcher dp = request.getRequestDispatcher("el_request_ok.jsp");
	dp.forward(request, response);	
	%>
