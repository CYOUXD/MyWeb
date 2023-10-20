<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><!-- 5 -->
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>jstl_foreach.jsp</title>
	</head>
	<body>
		<%-- 
		<%
		//1~100 까지 숫자의 합
		int sum = 0;
		for(int i=1; i<=100; i++) {
			sum += i;
		}
		%>
		
		결과 : <%=sum %>
		--%>
		<!-- jstl 변수 선언 c:set -->
		<c:set var="sum" value="0" />
		<c:forEach var="i" begin="1" end="100" step="1">
			<c:set var="sum" value="${sum+i}" />
		</c:forEach>
		결과 : ${sum }<br> <!-- EL 표기법 -->
		결과 : <c:out value="${sum }" />
		
		<hr>
		<h2>구구단 3단 출력</h2>
		<c:forEach var="j" begin="1" end="9" step="1">
			3 x ${j } = ${3 * j }<br>
		</c:forEach>
		<hr>
		
		<h2>모든 구구단 출력</h2>
		<c:forEach var="i" begin="2" end="9" step="1">
			<h3>${i }단 출력</h3>
			<c:forEach var="j" begin="1" end="9" step="1">
				${i } x ${j } = ${i*j } <br>
			</c:forEach>
		</c:forEach>
		
		<hr>
		<h2>향상된 for문</h2>
		<%--
		<%
		int[] arr = {1, 2, 3, 4, 5};
		for(int a : arr) {
			out.println(a);
		}
		%>
		 --%>
		<c:set var="arr2" value="<%=new int[] {1, 2, 3, 4, 5} %>" />
		<h3>jstl을 이용한 향상된 for문 출력</h3>
		<c:forEach var="i" items="${arr2 }"> <!-- items에는 컬렉션이나 리스트가 들어간다. 향상된 for문에 들어가는 것이 들어감 -->
			${i }
		</c:forEach>
	</body>
</html>