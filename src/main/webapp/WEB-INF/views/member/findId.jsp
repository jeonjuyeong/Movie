<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <style>
#blueone {	


 	margin:25px;
 	margin-left:45px;
	border-collapse: collapse;
	width: 400px;
}
#blueone th {
	padding: 10px;
	color: #168;
	border-bottom: 3px solid #0B4C5F;
	text-align: left;
}
#blueone td {
	color: #669;
	padding: 10px;
	border-bottom: 1px solid #0B4C5F;
}
#blueone tr:hover td {
	color: #004;
}
#findIdDiv{
 	
	border: 1px solid #ddd;
	width: 500px;
	height:300px;
	margin-bottom:200px;
	display: inline-block;
}
#findPasswordDiv{
	border: 1px solid #ddd;
	width: 500px;
	height:300px;
	margin-bottom:200px;
	margin-left:35px;
	display: inline-block;
}
</style>
<meta charset="UFT-8">

<title>Insert title here</title>
	<%@include file="/resources/includes/navigation.jsp"%>
</head>

<body>
	<div class="container">
		<h2 style="margin-top:200px">아이디/비밀번호 찾기</h2>

		<div id="findIdDiv">
			<table id='blueone'>
				<tr>
					<th colspan=2>아이디 찾기</th>
				</tr>
				<tr>
					<td>이름:</td>
					<td><input type="text" id="name" name="name" class="form-control"></td>
				</tr>
				<tr>
					<td>이메일:</td>
					<td><input type="text" id="email" name="email" class="form-control" placeholder="가입할 때 입력 하신 이메일"></td>
				</tr>
				<tr>
					<td><input type="button" value="아이디찾기" id="findId" class="btn btn-secondary" onclick="findMyId()"></td>
					<td><div id="YourId"></div></td>
				</tr>
			</table>
		</div>
		
		
		
		<div id="findPasswordDiv">
			<table id='blueone'>
					<tr>
						<th colspan=2>비밀번호 찾기</th>
					</tr>
					<tr>
						<td>아이디:</td>
						<td><input type="text" id="name" name="name" class="form-control"></td>
					</tr>
					<tr>
						<td>이메일:</td>
						<td><input type="email" id="email" name="email" class="form-control" placeholder="가입할 때 입력 하신 이메일"></td>
					</tr>
					<tr>
						<td><input type="button" value="비밀번호 찾기" id="findPassword"class="btn btn-secondary"></td>
						<td><div id="YourId"></div></td>
					</tr>
				</table>
		</div>
		
	</div>
	
		<%@include file="/resources/includes/footer.jsp"%>
</body>
<script>
	function findMyId(){
		   $.ajax({
		      type:"post",
		      url:"findId?name="+$("#name").val()+"&email="+$("#email").val(),
		      success: function(data){ 
		      	if(data!=""){
		      		$("#YourId").append("<span>가입하신 아이디는:"+data+"</span>");
		      	}else{
		      		alert("이메일, 이름을 다시확인해주세요");
		      		$("#name").val("");
		      		$("#email").val("");
		      	}
		      },
		      error:function(e){
		         alert(e);
		      },
		   });
	}
	
	
	$(document).ready(function(){
		 $("#findPassword").click(function(){
			 if($("#email").val()==""){
				 alert("이메일을 입력하세요");
				 return false;
			 }
			window.open("/ctrl/member/emailCheck?email="+$('#email').val(),"","width=500 height=220");
		}); 
	});
</script>
</html>