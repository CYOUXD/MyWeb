<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><!-- 6 -->
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
    <%
    String test = "test";
    %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>jstl_etc.jsp</title>
	</head>
	<body>
		<h2>remove 테스트</h2>
		<c:set var="test2" value="test2"/>
		<c:set var="test2" scope="page"/>
		<%-- <c:set var="test2" value="<%=test %>"/> --%> <!-- 이렇게 값을 넘기면(=out 객체로 출력 할 수 있도록 만듬) ${test}로 출력 할 수 있다. -->
		<c:remove var="test2" scope="page"/><!-- 동작 방식이 달라서 test는 jstl로 제거 할 수 없음. -->
		<%=test %><br>
		${test2 }<br>
		<!-- EL 표기법은 out 객체로 출력되어지는 것만 표시 가능(상단에 있는 스크립틀릿은 out 객체로 출력되지 않는다. 
		상단 부분의 스크립틀릿을 EL로 표현하고 싶으면 out 객체로 출력 할 수 있도록 만든 다음 출력해야 한다.) -->
		
		<h2>c:forTokens 테스트</h2>
		<!-- 자바의 StringTokenizer를 JSTL을 사용하여 구현하려 할 때 쓸 수 있음
				= 문자열을 구분자로 나눌 때 사용
		 -->
		<c:set var="tokens" value="안녕하세요/지금은/JSP/수업시간/입니다." />
		<c:forTokens var="aaa" items="${tokens }" delims="/">
			${aaa }<br>
		</c:forTokens>
	</body>
</html>