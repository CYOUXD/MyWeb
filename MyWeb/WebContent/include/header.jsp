<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><!-- 2 -->
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%
	response.setCharacterEncoding("utf-8");
	//String id = (String)session.getAttribute("user_id"); 
	//헤더에서 쓴 변수명이 헤더가 붙은 다른 페이지에서 중복될 수 있기 때문에 변수 중복 오류가 난다. 
	
	//boolean login = false;
	//if(session.getAttribute("user_id") != null) login = true;//로그인 O
	//System.out.println(login);
	
	%>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-idth, initial-scale=1">
	   
	
	    <title>Welcome to MyWorld</title>
	
	    <!-- Bootstrap Core CSS -->
	    <link href="${pageContext.request.contextPath }/css/bootstrap.css" rel="stylesheet">
	    <!-- 다른 디렉토리의 페이지에서는 또 경로가 달라져야하기 때문에 절대 경로로 써줘야 한다. -->
	
	    <!-- Custom CSS -->
	    <link href="${pageContext.request.contextPath }/css/business-casual.css" rel="stylesheet">
	
	    <!-- Fonts -->
	    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800" rel="stylesheet" type="text/css">
	    <link href="https://fonts.googleapis.com/css?family=Josefin+Slab:100,300,400,600,700,100italic,300italic,400italic,600italic,700italic" rel="stylesheet" type="text/css">
		
		 <!-- jQuery -->
	    <script src="${pageContext.request.contextPath }/js/jquery.js"></script>
	
	    <!-- Bootstrap Core JavaScript -->
	    <script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
	
	    <!-- Script to Activate the Carousel -->
	    <script>
	    $('.carousel').carousel({
	        interval: 2000 //changes the speed
	    })
	    </script>   
	</head>
	

		<!-- header -->
		<div class="brand">My Web</div>        
	    <div class="address-bar">Welcome to MyWorld</div>			
	    
	    <nav class="navbar navbar-default" role="navigation">
	        <div class="container">
	            <div class="navbar-header">
	                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
	                    <span class="sr-only">Toggle navigation</span>
	                    <span class="icon-bar"></span>
	                    <span class="icon-bar"></span>
	                    <span class="icon-bar"></span>
	                </button>
	                
	                <a class="navbar-brand" href="/hong">My First Web</a>
	            </div>	           
	           
	            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
	                <ul class="nav navbar-nav">
	                	
	                    <li>
	                        <a href="${pageContext.request.contextPath }/index.do">HOME</a>
	                    </li>
	                    <li>
	                        <a href="${pageContext.request.contextPath }/member.do">Member</a>
	                    </li>
	                    <li>
	                        <a href="${pageContext.request.contextPath }/board/list.board">BOARD</a>
	                    </li>
                        <c:choose>
                        	<c:when test="${sessionScope.user_id != null }">
                        	<!-- 상단 스크립틀릿에서 만든 변수(login)는 EL 표기법으로 불러 올 수 없다. 처리 순서가 달라서 login 변수로 사용 할 수 없다 -->
			                    <li>
		                       		<a href="${pageContext.request.contextPath }/user/logout.jsp">LOGOUT</a>
			                    </li>
			                    <li>
		                       		<a href="${pageContext.request.contextPath }/user/mypage.jsp">MyPage</a>
		                   		</li>
                        	</c:when>
                        	<c:otherwise>
			                    <li>
		                       		<a href="${pageContext.request.contextPath }/user/login.jsp">LOGIN</a>
			                    </li>
			                    <li>
		                       		<a href="${pageContext.request.contextPath }/user/join.jsp">JOIN</a>
			                    </li>
                        	</c:otherwise>
                        </c:choose>
	                </ul>
	            </div>
	            
	            
	            <!-- /.navbar-collapse -->
	        </div>
	        <!-- /.container -->
	    </nav>
	 	<!-- end header -->
