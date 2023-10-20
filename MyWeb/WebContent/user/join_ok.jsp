<%@page import="com.myweb.user.model.UserVO"%>
<%@page import="com.myweb.user.model.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><!-- 8 -->
	<%
	//진행 흐름 : 전달 받은 값 처리 -> 회원 가입 여부 확인 
	//-> 가입된 사용자인 경우 가입 실패 -> 뒤로가기 | 가입되지 않은 사용자인 경우 -> 가입 진행
	//-> 회원가입 성공했을 경우 축하 및 로그인 페이지로 이동 | 회원 가입 실패했을 경우 가입 페이지로 이동
	
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String address = request.getParameter("address");
	
	//DAO 객체 생성
	UserDAO dao = UserDAO.getInstance();
	
	//VO 객체 생성
	UserVO vo = new UserVO(id, pw, name, email, address, null);
	
	//회원가입 처리하기 전에 이미 존재하는 아이디 인지 검사(중복검사)
	int result = dao.idConfirm(id);
	if(result == 1) {
		//중복인 경우
		%>
		<script>
			alert('아이디가 중복되었습니다.');
			history.go(-1);
		</script>
		<%
	}else {
		//중복이 아닌 경우
		//insert를 진행(join 처리)
		int result2 = dao.join(vo);
		
		if(result2 == 1) {
			//가입 성공
			%>
			<script>
				alert('회원 가입을 축하합니다.');
				location.href="login.jsp";
			</script>
			<%
		}else {
			//가입 실패
			%>
			<script>
				alert('회원 가입에 실패했습니다.');
				history.go(-1); //뒤로가기
			</script>
			<%
		}
	}
	%>