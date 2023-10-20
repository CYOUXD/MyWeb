<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/include/header.jsp" %>
	<section>
		<div align="center">
			<form action="register.board" name="regForm" method="post">
				<h2>게시판 글 작성 페이지</h2>
				<table border="1" width="500px">
					<tr>
						<td>작성자</td>
						<td><input type="text" name="writer" size="10"></td>
					</tr>
					<tr>
						<td>글제목</td>
						<td><input type="text" name="title"></td>
					</tr>
					<tr>
						<td>글내용</td>
						<td>
							<textarea rows="10" style="width:100%" name="content"></textarea>
						</td>
					</tr>
					<tr>
						<td>첨부파일</td>
						<td><input type="file" name="image"></td>
					</tr>
					<tr>
						<!-- 글 등록 메뉴 -->
						<td colspan="2" align="center">
							<input type="button" value="등록" onclick="registCheck()">
							<input type="button" value="목룍" onclick="location.href='list.board'">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</section>
	
	<script>
		function registCheck() {
			//작성자 글 제목의 공백 확인
			if(document.regForm.writer.value === '') {
				alert("작성자 명은 필수 입력 사항입니다.");
				return;
			}else if(document.regForm.title.value === '') {
				alert("글제목은 필수 입력 사항입니다.");
				return;
			}else if(confirm('게시글을 등록하시겠습니까?')) {
				document.regForm.submit();
			}
		}
	</script>
<%@include file="/include/footer.jsp" %>