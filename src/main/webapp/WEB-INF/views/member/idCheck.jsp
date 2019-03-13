<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
</head>
 <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
function sendIt(){
   $.ajax({
      type:"post",
      url:"/ctrl/member/idCheck?id="+$("#userid").val(),
      success: function(data){
         if(data==1){
            alert("로그인완료");
            $(opener.document).find("#id").val($("#userid").val());           
            }else if(data==0){
            alert("없는 아이디입니다!");
            }else if(data==-1){
            alert("비밀번호가 틀렸습니다.")
            }
      },
      error:function(e){
         alert(e);
      },
   });
}
</script>
<style>
.container{
	width: 60%;
	margin: 0 auto;
	padding-top: 30px;
}
.container h5{
	text-align: center;
}
</style>
<body>
<div class="container">
	<h5><b>가입하실 ID를 입력하세요</b></h5>
	<input type="text" class="text" id="userid">
	<input type ="button" class="btn btn-default" onclick="sendIt()" value="중복확인">
</div>
</body>
</html>