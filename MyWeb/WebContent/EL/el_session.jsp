<%@page import="com.myweb.user.model.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><!-- 6 -->
    <%
    session.setAttribute("id", "kitty1234");
	UserVO vo = new UserVO();
	vo.setId("apple");
	vo.setName("홍옥");
	vo.setEmail("abc@naver.com");
	vo.setAddress("과수원");
	
	session.setAttribute("vo", vo);

	application.setAttribute("admin", "홍길동");
    %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>el_session.jsp</title>
	</head>
	<body>
		<a href="el_session_ok.jsp">세션 값 확인</a>
	</body>
</html>