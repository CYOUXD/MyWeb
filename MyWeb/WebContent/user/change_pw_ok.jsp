<%@page import="com.myweb.user.model.UserVO"%>
<%@page import="com.myweb.user.model.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><!-- 13 -->
	<%
	/*
	1. form 값 처리
	2. login(id, 예전 비밀 번호 - old_pw) 아이디와 비밀번호가 맞는지 확인 - 인증용
		예전 비밀 번호가 틀린 경우 뒤로가기(메세지X, 정보 노출 보호)
	3. 일치하면 changePassword()를 실행 - DAO 객체에 메서드로 생성
	4. changePassword() 실행 결과
		성공 : "비밀번호 변경이 완료되었습니다."를 출력하고 mypage.jsp로 이동
		실패 : "비밀번호 변경이 실패했습니다."를 출력하고 mypage.jsp로 이동
	*/
	request.setCharacterEncoding("utf-8");
	String oldPw = request.getParameter("old_pw");
	String newPw = request.getParameter("new_pw");
	String id = (String)session.getAttribute("user_id");

	UserDAO dao = UserDAO.getInstance();
	int result = dao.login(id, oldPw);
	//login() 메서드를 사용하면 입력한 현재 비밀번호가 로그인한 비밀번호와 같은지 확인 할 수 있다.
		
	//System.out.println(id+", "+pw+", "+oldPw+", "+newPw);
	
	if(result == 1){
		//비밀번호가 일치한 경우
		int result2 = dao.changePassword(id, newPw);
		if(result2 == 1) {
			//변경 성공
			%>
			<script>
				alert("비밀번호 변경이 완료되었습니다.");
				location.href="mypage.jsp";
			</script>
			<%
			//session.setAttribute("user_pw", new_pw);
			//response.sendRedirect("mypage.jsp");
			//sendRedirect를 사용하면 스크립트로 작성된 코드보다 먼저 실행 되기 때문에 경고창이 안뜸
			//세션에는 비밀번호를 저장하면 안된다. 최소한의 정보만 저장해서 사용한다.
			//response는 서버에서 실행하는 것. 
			//서버에서 먼저 실행되고 클라이언트에 코드를 돌려주기 때문에 서버에서 실행되는 response가 먼저 실행되므로 경고창보다 페이지이동이 먼저 실행 된다.
			//페이지 이동 후에는 경고창을 띄우는 코드를 실행할 수 없기 때문에 경고창이 뜨지 않고 바로 페이지가 이동 된다. 
		}else {
			//변경 실패
			%>
			<script>
				alert("비밀번호 변경에 실패했습니다.");
				location.href="mypage.jsp";
			</script>
			<%
		}
	}else {
		//비밀번호가 틀린 경우
		%>
		<script>
			history.go(-1);
		</script>
		<%
	}
	%>