<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="/include/header.jsp" %>
	<section>
		<div align="center">
			<h2>게시판 글 작성 페이지</h2>
			<table border="1" width="500px">
				<tr>
					<td width="20%">글번호</td>
					<td width="30%">${vo.num }</td>
					<td width="20%">조회수</td>
					<td width="30%">${vo.hit }</td>
				</tr>
				<tr>
					<td>작성일</td>
					<td>${vo.regdate }</td>
					<td>작성자</td>
					<td>${vo.writer }</td>
				</tr>
				<tr>
					<td>제목</td>
					<td colspan="3">${vo.title }</td>
				</tr>
				<tr>
					<td>내용</td>
					<td colspan="3" height="120">
						<!-- pre : 엔터도 받아서 처리해 줌 -->
						<pre>${vo.content }</pre>
					</td>
				</tr>
				<tr>
					<!-- 글 등록 메뉴 -->
					<td colspan="4" align="center">
					<!-- 
						<input type="button" value="목록" onclick="location.href='list.board?pageNum=${pageNum }'">
					 -->
						<input type="button" value="목록" onclick="location.href='list.board?pageNum=${param.pageNum }'">
						<input type="button" value="수정" onclick="location.href='modify.board?num=${vo.num }&pageNum=${param.pageNum }'">
					</td>
				</tr>
			</table>
		</div>
	</section>
<%@include file="/include/footer.jsp" %>