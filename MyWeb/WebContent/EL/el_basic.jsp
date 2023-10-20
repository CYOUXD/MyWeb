<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><!-- 1 -->
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
	</head>
	<body>
		<!-- 스크립틀릿 표현식 -->
		<%=1+2 %><br>
		<%="안녕" %><br>
		<%=1>2 || 1 == 2 %><br>
		-------------------------<br>
		<!-- EL -->
		<!-- 산술 연산 및 출력 -->
		${1+2}<br>
		${'안녕'}<br>
		
		<!-- 비교/논리 연산 -->
		${1>2 || 1==2}<br>
		${1>2 or 1==2}<br>
		
		${'홍길동' == '홍길동'}<br>
		${'홍길동' eq '홍길동'}<br> 
		<!-- eq = 같다 / ne = 다르다 -->
		
		<!-- 삼항 연산 -->
		${1==2 ? "같음" : "다름"}<br>		
	</body>
</html>