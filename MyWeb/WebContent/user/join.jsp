<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><!-- 5 -->
<%@include file="/include/header.jsp" %>
	<section>
		<div align="center">
			<form name="regform" action="join_ok.jsp" method="post">
				<h2>회원 가입 페이지</h2>
				<table>
					<tr>
						<td>아이디</td>
						<td><input type="text" name="id" placeholder="4글자 이상 8글자 이하"></td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input type="password" name="pw"></td>
					</tr>
					<tr>
						<td>비밀번호 확인</td>
						<td><input type="password" name="pw_check"></td>
					</tr>
					<tr>
						<td>이름</td>
						<td><input type="text" name="name"></td>
					</tr>
					<tr>
						<td>이메일</td>
						<td><input type="email" name="email"></td>
					</tr>
					<tr>
						<td>주소</td>
						<td><input type="text" name="address"></td>
					</tr>
				</table>
				<br>
				<br>
				<input type="button" value="회원가입" class="btn btn-danger" onclick="check()">
				<input type="button" value="로그인" class="btn btn-info" onclick="location.href='login.jsp'">
			</form>
		</div>	
	</section>
	
	<script>
		//유효성 검증	
		function check() {
			//form은 유일하게 "document.태그이름.태그이름"으로 하위 태그에 대한 접근이 가능하다.
			//check()는 회원 가입 창에 각 값들에 대한 검증을 위해서 사용할 함수
			if(document.regform.id.value === ''){
				alert('아이디는 필수 입력 사항입니다.');
				return;
			}else if(document.regform.id.value.length<4 || document.regform.id.value.length>8){
				alert('아이디는 4글자 이상 8글자 이하로 작성하세요.');
				return;
			}else if(document.regform.pw.value === ''){
				alert('비밀번호는 필수 입력 사항입니다.');	
				return;
			}else if(document.regform.pw.value !== document.regform.pw_check.value) {
				alert('비밀번호가 일치하지 않습니다. 비밀번호를 확인하세요.');
				return;
			}else if(document.regform.name.value === ''){
				alert('이름은 필수 입력 사항입니다.');
				return;
			}else if(confirm('회원 가입을 하시겠습니까?')){
				//confirm()은 확인창에서 "예" 혹은 "확인"시 true, "아니오" 혹은 "취소" 선택 시 false
				document.regform.submit(); //자바스크립트의 submit()
			}
		}
	</script>
<%@include file="/include/footer.jsp" %>