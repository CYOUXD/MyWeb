<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><!-- 9 -->
	<%@include file="/include/header.jsp" %>
	<%
	//url 주소를 통한 강제 접근을 막기
    if(session.getAttribute("user_id") != null) {
    	response.sendRedirect("mypage.jsp");
    }
	%>
	
	<section>
		<div align="center">
			<h2>로그인 페이지</h2>
			<form action="login_ok.jsp" method="post">
				<input type="text" name="id" placeholder="아이디"><br>
				<input type="password" name="pw" placeholder="비밀번호"><br>
				<br>
				<input type="submit" value="로그인" class="btn btn-default">
				<input type="button" value="회원가입" class="btn btn-primary" onclick="location.href='join.jsp'">
			</form>
		</div>
	</section>
	
	<%@include file="/include/footer.jsp" %>
	