<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/navigation.jsp"%>
  <!-- Bootstrap core CSS -->
  <link href="../ctrl/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom fonts for this template -->
  <link href="../ctrl/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">
  <!-- Plugin CSS -->
  <link href="../ctrl/resources/vendor/magnific-popup/magnific-popup.css" rel="stylesheet" type="text/css">

  <!-- Custom styles for this template -->
  <link href="../ctrl/resources/css/freelancer.min.css" rel="stylesheet">
<script>
$(document).ready(function(){
	$("#pwd_check").keyup(function(){
	    $("#password_check_div").remove();
	    if($("#pass").val()== $("#pwd_check").val()){
	       $("#password_check_span").append("<div style='color:green' id= 'password_check_div' >일치!</div>");
	    }
	    else{   
	       $("#password_check_span").append("<div style='color:red' id='password_check_div'>불일치!</div>");
	    }
	});
	  $("#idcheck").click(function(){
	    	window.open("/book/member/idCheck","confirm","width=500 height=150");
	    });
	});
</script>
<div class="row">
  <div class="col-lg-12">
    <h1 class="page-header">WELCOME</h1>
  </div>
  <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-default">

      <div class="panel-heading">JOIN</div>
      <!-- /.panel-heading -->
      <div class="panel-body">

        <form role="form" action="/book/member/join" method="post">
          <div class="form-group">
            <label> ID </label> 
             <div class="form-inline form-group">
            <input type="text" class="form-control" id="id" readonly name='id'>	
         		   <input class="btn btn-default" type="button" value='ID CHECK' name='title' id="idcheck">
           		 </div>
          </div>
           <div class=" form-group">
            <label>NAME</label>
             <div class="form-inline form-group">
             	<input class="form-control" name='name'>
			</div>
          </div>

            <label>PWD</label>
            <div class="form-inline form-group">
            <input type="password" class="form-control" name='pass' id='pass'>
         	(특수기호"!,@,#,$,%,^..."를 포함한 8자 사용)
          </div>
      
            <label>PWD Check</label>
                <div class="form-inline form-group">
              <input type="password" class="form-control"id="pwd_check" name='check'>
              <span id='password_check_span'>password를 확인해주세요</span>
          </div>

          <div class="form-group">
            <label>PHONE</label><input class="form-control bfh-phone" name='phone' id='phone' maxlength="13" >
          </div>
          
          <div class="form-group">
            <label>address</label><input type='text' class="form-control" name='addr'>
          </div>
             <div class="form-group">
            <label>E-MAIL</label><input type='email' class="form-control" name='email'>
          </div>
          <button type="submit" class="btn btn-default">Sign Up!</button>
          <button type="reset" class="btn btn-default"> Reset </button>
        </form>
      </div>
      <!--  end panel-body -->
    </div>
    <!--  end panel-body -->
  </div>
  <!-- end panel -->
</div>
<!-- /.row -->
<script>
function autoHypenPhone(str) { // 폰번호 하이픈 하는 함수
	str = str.replace(/[^0-9]/g, '');
	var tmp = '';
	if (str.length < 4) {
		return str;
	} else if (str.length < 7) {
		tmp += str.substr(0, 3);
		tmp += '-';
		tmp += str.substr(3);
		return tmp;
	} else if (str.length < 11) {
		tmp += str.substr(0, 3);
		tmp += '-';
		tmp += str.substr(3, 3);
		tmp += '-';
		tmp += str.substr(6);
		return tmp;
	} else {
		tmp += str.substr(0, 3);
		tmp += '-';
		tmp += str.substr(3, 4);
		tmp += '-';
		tmp += str.substr(7);
		return tmp;
	}
	return str;
}
    var cellPhone = document.getElementById('phone');
    
    cellPhone.onkeyup = function(event) {
   	event = event || window.event;
	var val = this.value.trim();
	this.value = autoHypenPhone(val);
}
</script>

<%@include file="../includes/footer.jsp"%>