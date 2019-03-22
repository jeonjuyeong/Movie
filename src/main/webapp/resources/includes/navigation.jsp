<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>   

<script>
		function memberCheck(){
		   $.ajax({
		      type:"post",
		      url:"/ctrl/member/login?id="+$("#id").val()+"&password="+$("#password").val(),
		      success: function(data){
		         if(data==0){
		            $("#warning").append("<div style='color:red' id='div_login_check'>없는 아이디 입니다!</div>");
		         }else if(data==-1){
		        	 $("#warning").append("<div style='color:red' id='div_login_check'>패스워드가 틀립니다.</div>");
		         }else{
		        	 location.href="/ctrl/member/login?id="+$("#id").val();
		         }
		      },
		      error:function(e){
		         alert(e);
		      },
		   });
		}
</script>

      <!-- Bootstrap core CSS -->
  <link href="/ctrl/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom fonts for this template -->
  <link href="/ctrl/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">
  <!-- Plugin CSS -->
  <link href="/ctrl/resources/vendor/magnific-popup/magnific-popup.css" rel="stylesheet" type="text/css">

  <!-- Custom styles for this template -->
  <link href="/ctrl/resources/css/freelancer.min.css" rel="stylesheet">
  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg bg-secondary fixed-top text-uppercase" id="mainNav">
    <div class="container">
      <a class="navbar-brand js-scroll-trigger" href="/ctrl">LIVELIHOODS</a>
      <button class="navbar-toggler navbar-toggler-right text-uppercase bg-primary text-white rounded" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        Menu
        <i class="fas fa-bars"></i>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item mx-0 mx-lg-1">
            <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="/ctrl/funding/funding.do">FUNDING</a>
          </li>
          <li class="nav-item mx-0 mx-lg-1">
            <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="/ctrl/funding/fundingInsert.do">FINANCING</a>
          </li>
          <li class="nav-item mx-0 mx-lg-1">
            <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="/ctrl/home.do">QnA</a>
          </li>
          <li>
          </li>
          <li class="nav-item mx-0 mx-lg-1">
           <c:if test="${sessionScope.id==null}">
          	<a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="/ctrl/member/join">회원가입</a>
           </c:if>
          </li>
          <li class="nav-item mx-0 mx-lg-1">
          	  <c:if test="${sessionScope.id!=null}">
      	    	<a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="/ctrl/member/mypage?id=${sessionScope.id}">마이페이지</a>
         	 </c:if>
         	  <c:if test="${sessionScope.id==null}">
          	  <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger"data-toggle="modal" data-target="#loginModal">로그인</a>
          	 </c:if>
          	 
          </li>
          <c:if test="${sessionScope.id=='master' }">
          <li class="nav-item mx-0 mx-lg-1">
          	 	<a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="/ctrl/admin/adminMain.do">관리자</a>
          </li>
          </c:if>
        </ul>
      </div>
    </div>
  </nav>

<!-- Modal -->
<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">로그인</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
   
      <div class="modal-body">
       <Strong>ID:</Strong><input type="text" name="id" id="id" class="form-control">
      <Strong>PWD:</Strong><input type="password" name="password" id="password" class="form-control">
      <span id="warning"></span>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button"onclick="memberCheck()" class="btn btn-primary">Login</button>
      </div>
    </div>
  </div>
</div>