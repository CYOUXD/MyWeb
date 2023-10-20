<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><!-- 16 -->
    <%
  //url 주소를 통한 강제 접근을 막기
    if(session.getAttribute("user_id") == null) {
    	response.sendRedirect("login.jsp");	
    }
    %>
<%@include file="/include/header.jsp"%>
	<section>
		<div align="center">
			<form action="delete_check_ok.jsp" method="post">
				<h3>현재 비밀 번호를 입력하세요.</h3>
				<hr>
				비밀번호 : <input type="password" name="pw"><br>
				<br>
				<input type="submit" value="확인">
			</form>
		</div>
	</section>
<%@include file="/include/footer.jsp"%>