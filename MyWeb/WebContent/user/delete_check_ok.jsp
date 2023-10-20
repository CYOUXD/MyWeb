<%@page import="com.myweb.user.model.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><!-- 17 -->
	<%
	/*
	1. 폼 값 받기
	2. login(id, pw) 메서드를 사용하여 인증 확인
	3. login() 메서드 결과가 0인 경우 : "비밀 번호를 확인하세요." 출력 후 마이페이지로 이동
		login() 메서드 결과가 1인 경우 : delete() 메서드를 실행
	4. 삭제 성공 : "회원 탈퇴 처리가 되었습니다." 출력. 세션 전부 삭제. 홈 위치로 이동(/MyWeb)
		삭제 실패 : "회원 탈퇴를 실패했습니다." 출력. mypage로 이동
		sql = "delete from users where id=?";
	*/
	//url 강제 접근 차단
	 if(session.getAttribute("user_id") == null) {
		 response.sendRedirect("login.jsp");
	 }
	
	request.setCharacterEncoding("utf-8");
	String id = (String)session.getAttribute("user_id");
	String pw = request.getParameter("pw");
	
	UserDAO dao = UserDAO.getInstance();
	int result = dao.login(id, pw);
	
	if(result == 1) {
		//비밀번호 일치
		int result2 = dao.delete(id);
		if(result2 == 1) {
			//삭제 성공
			session.invalidate();
			%>
			<script>
				alert("회원 탈퇴 처리가 되었습니다.");
				location.href="/MyWeb";
			</script>
			<%
		}else {
			//삭제 실패
			%>
			<script>
				alert("회원 탈퇴를 실패했습니다.");
				location.href="mypage.jsp";
			</script>
			<%
		}
	}else {
		//비밀번호 틀림
		%>
		<script>
			alert("비밀 번호를 확인하세요.");
			location.href="mypage.jsp";
		</script>
		<%
	}
	%>