<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><!-- 12 -->
    <%
    //url 주소를 통한 강제 접근을 막기
    if(session.getAttribute("user_id") == null) {
    	response.sendRedirect("login.jsp");
    }
    //String id = (String)session.getAttribute("user_id");
    //String name = (String)session.getAttribute("user_name");
    %>
	<%@include file="/include/header.jsp" %>
	<section>
		<div align="center">
			<h3>비밀번호 변경 페이지</h3>
			<br>
			<form action="change_pw_ok.jsp" method="post">
				현재 비밀번호 : <input type="password" name="old_pw"><br>
				변경 비밀번호 : <input type="password" name="new_pw"><br>
				<br>
				<input type="submit" value="확인">
				<input type="button" value="취소" onclick="history.go(-1)">
			</form>
		</div>
	</section>
	
	<%@include file="/include/footer.jsp" %>