<%@page import="com.myweb.user.model.UserDAO"%>
<%@page import="com.myweb.user.model.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><!-- 15 -->
	<%
	/*
	1. 폼 값을 받기
	2. DAO 연동을 통해서 update() 메서드를 호출하여 회원정보 수정
	3. 매개변수의 값은 VO로 전달
	4. 수정 성공 : "회원 정보가 수정되었습니다." 출력 후 마이페이지로 이동(단, user_name은 세션 변경)
		수정 실패 : "회원 정보 수정을 실패했습니다." 출력 후 마이페이지로 이동
	*/
	//url 주소를 통한 강제 접근을 막기
	if(session.getAttribute("user_id") == null) {
		response.sendRedirect("login.jsp");
	}
	
	request.setCharacterEncoding("utf-8");
	
	String id = (String)session.getAttribute("user_id");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String address = request.getParameter("address");
	
	UserVO vo = new UserVO(id, null, name, email, address, null);
	UserDAO dao = UserDAO.getInstance();
	
	int result = dao.update(vo);
	
	if(result == 1) {
		//수정 성공
		session.setAttribute("user_name", name);
		%>
		<script>
			alert("회원 정보가 수정되었습니다.");
			location.href="mypage.jsp";
		</script>
		<%
	}else {
		//수정 실패
		%>
		<script>
			alert("회원 정보 수정을 실패했습니다.");
			location.href="mypage.jsp";
		</script>
		<%
	}
	%>