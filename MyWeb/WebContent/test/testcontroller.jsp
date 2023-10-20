<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>testcontroller.jsp</title>
	</head>
	<body>
		<!-- .test로 끝나면 전부 연결 되지만 실제 폴더 경로에 맞춰서 url 주소를 사용하는 것이 좋습니다. -->
		<a href="join.test">회원 가입 요청</a>
		<a href="login.test">로그인 요청</a>
		<a href="/MyWeb/update.test">수정 요청</a>
		<a href="/MyWeb/delete.test">삭제 요청</a><!-- 서블릿으로 연결하는 절대 경로. 서블릿이므로 최상단이라소 test라는 폴더 이름을 따로 안써도 연결 됨 -->
	</body>
</html>