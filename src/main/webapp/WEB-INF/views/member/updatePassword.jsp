<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&amp;subset=korean" rel="stylesheet">
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"> 
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.container{
	width: 80%;
	margin: 0 auto;
	padding-top: 25px;
}
</style>
<body>
<script>
$(document).ready(function(){
    $("#join_password").keyup(function(){
        $("#pwd_check").val("");
        return false;
    });
    var pw_p= /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;
    $("#join_password").keyup(function(){
       $("#password_valid_div").remove();
       if(!$("#join_password").val().match(pw_p)){
          $("#password_valid_span").append("<div style='color:red' id='password_valid_div'>"+ "사용 불가능(특수문자,영어,숫자 각 1개 이상)</div>");
       }
       else{
          $("#password_valid_span").append("<div style='color:green' id='password_valid_div'>"+
                "사용가능 패스워드</div>");
          $("#password_valid").val("1");
       }
    });
  $("#update_btn").click(function(){
    	 if(!$("#join_password").val().match(pw_p)){
    		alert("비밀번호는 영어,특수문자를 포함해야합니다.")
    		return false;
    	}
        if ($("#pwd_check").val() != $("#pwd_check").val()) {
          	alert("비밀번호 맞지않음");
        	return false;
        }
        frm.submit();
     });
	$("#pwd_check").keyup(function(){
	    $("#password_check_div").remove();
	    if($("#join_password").val()==$("#pwd_check").val()){
	       $("#password_check_span").append("<div style='color:green' id= 'password_check_div' >일치!</div>");
	    }
	    else{   
	       $("#password_check_span").append("<div style='color:red' id='password_check_div'>불일치!</div>");
	    }
	});
	

	});
</script>

<div class="container">
<h5><b>비밀번호 변경하기</b></h5>
<form name="frm" action="updatePassword" method="post">
<input type="hidden" id="userid"name="userid" value="${userid}">
<input type="hidden" id="num" value ="${num}">
 ${userid}님의 비밀번호를 수정해 주세요<br><br><br>
		<table>
			<tr>
				<td>PASSWORD *</td>
				<td><input type="password" id="join_password" name="password"
					class="form-control" placeholder="(영문,특수기호포함)"></td>
				<td><span id="password_valid_span"></span></td>
			</tr>
			<tr>
				<td>암호확인 *</td>
				<td><input type="password" id="pwd_check" class="form-control"></td>
				<td><span id="password_check_span"></span></td>
			</tr>
		</table>
		</form>
		<input type="button" class="btn btn-success" id="update_btn" value="확인">
</div>
</body>
</html>