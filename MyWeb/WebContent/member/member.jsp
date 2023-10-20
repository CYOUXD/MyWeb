<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><!-- 4 -->
<%@include file="/include/header.jsp" %>
<!-- 파일 경로와 src 경로는 다르다. src는 url 경로로 연결되므로 file 경로와는 다르다. -->

<div class="container">
	<div class="row">
           <div class="box">
               <div class="col-lg-12">
                   <hr>
                   <h2 class="intro-text text-center">
                       <strong>Profile</strong>
                   </h2>
                   <hr>
               </div>               
               
               <div class="col-sm-4 text-center">
                   <img class="img-responsive" src="${pageContext.request.contextPath }/img/member7.jpg" alt="">
                   <h3>Actor
                       <small>한지민</small>
                   </h3>
               </div>
              
               <div class="col-sm-4 text-center">
                   
               </div>
               <div class="col-sm-4 text-center">
                 	<img class="img-responsive" src="${pageContext.request.contextPath }/img/member8.jpg" alt="">
                   <h3>Age
                       <small>37</small>
                   </h3>
               </div>
               <div class="clearfix"></div>
               
           </div>
       </div>

       <div class="row">
           <div class="box">
               <div class="col-lg-12">
                   <hr>
                   <h2 class="intro-text text-center">
                       <strong>화보</strong>
                   </h2>
                   <hr>
               </div>
               <div class="col-sm-4 text-center">
                   <img class="img-responsive" src="${pageContext.request.contextPath }/img/member1.jpg" alt="">
                   <h3>
                       <small></small>
                   </h3>
               </div>
               <div class="col-sm-4 text-center">
                   <img class="img-responsive" src="${pageContext.request.contextPath }/img/member2.jpg" alt="">
                   <h3>
                       <small></small>
                   </h3>
               </div>
               <div class="col-sm-4 text-center">
                   <img class="img-responsive" src="${pageContext.request.contextPath }/img/member3.jpg" alt="">
                   <h3>
                       <small></small>
                   </h3>
               </div>
               <div class="clearfix"></div>
           </div>
       </div>
	<div class="row">
           <div class="box">
               
               <div class="col-sm-4 text-center">
                   <img class="img-responsive" src="${pageContext.request.contextPath }/img/member4.jpg" alt="">
                   <h3>
                       <small></small>
                   </h3>
               </div>
               <div class="col-sm-4 text-center">
                   <img class="img-responsive" src="${pageContext.request.contextPath }/img/member5.jpg" alt="">
                   <h3>
                       <small></small>
                   </h3>
               </div>
               <div class="col-sm-4 text-center">
                   <img class="img-responsive" src="${pageContext.request.contextPath }/img/member6.jpg" alt="">
                   <h3>
                       <small></small>
                   </h3>
               </div>
               <div class="clearfix"></div>
           </div>
       </div>
       
       
   </div>
   <!-- /.container -->
<%@include file="/include/footer.jsp" %>