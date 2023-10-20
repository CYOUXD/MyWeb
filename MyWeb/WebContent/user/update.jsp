<%@page import="com.myweb.user.model.UserVO"%>
<%@page import="com.myweb.user.model.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><!-- 14 -->
    <%
    /*
    	이 페이지에 들어왔을 때, getUserInfo() 메서드를 재활용하여 정보를 불러온 후에
    	아래의 태그에 정보가 노출되도록 처리한다.
    	id 태그는 바꿀 수 없게 처리
    */
    //url 강제 접근 차단
    if(session.getAttribute("user_id") == null) {
    	response.sendRedirect("login.jsp");
    	//로그인하지 않고 url로 접근하면 jsp 파일이기 때문에 하단의 html 코드까지 모두 실행된다.
    	//그럴 때 return을 넣어주면 하단의 코드는 실행되지 않는다.
    	//하단에 없을 수도 있는 값을 받아와서 보여주는 코드가 있기 때문에 return을 안써주면 값이 없을 때 오류가 난다.
    	return;
    }
    String id = (String)session.getAttribute("user_id");
    UserDAO dao = UserDAO.getInstance();
    UserVO vo = dao.getUserInfo(id);
    %>
<%@include file="/include/header.jsp" %>
	<section>
		<div align="center">
			<form name="regform" action="update_ok.jsp" method="post">
				<h2>회원 정보 수정 페이지</h2>
				<table>
					<tr>
						<td>아이디</td>
						<td><input type="text" name="id" value="<%=vo.getId() %>" readonly></td>
					</tr>
					<tr>
						<td>이름</td>
						<td><input type="text" name="name" value="<%=vo.getName() %>"></td>
					</tr>
					<tr>
						<td>이메일</td>
						<td><input type="email" name="email" value="<%=vo.getEmail() %>"></td>
					</tr>
					<tr>
						<td>주소</td>
						<td><input type="text" name="address" value="<%=vo.getAddress() %>"></td>
					</tr>
				</table>
				<br>
				<br>
				<input type="button" value="정보수정" class="btn btn-danger" onclick="check()">
				<input type="button" value="마이페이지" class="btn btn-info" onclick="location.href='mypage.jsp'">
			</form>
		</div>
	</section>
	<script>
		//유효성 검증	
		function check() {
			//form은 유일하게 "document.태그이름.태그이름"으로 하위 태그에 대한 접근이 가능하다.
			//check()는 회원 가입 창에 각 값들에 대한 검증을 위해서 사용할 함수
			if(document.regform.name.value === ''){
				alert('이름은 필수 입력 사항입니다.');
				return;
			}else if(confirm('회원 정보 수정을 하시겠습니까?')){
				//confirm()은 확인창에서 "예" 혹은 "확인"시 true, "아니오" 혹은 "취소" 선택 시 false
				document.regform.submit(); //자바스크립트의 submit()
			}
		}
	</script>
<%@include file="/include/footer.jsp" %>