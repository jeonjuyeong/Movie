<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

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
  <%@include file="../includes/navigation.jsp"%>
  <style>

#blueone {
	border-collapse: collapse;
	width: 800px;
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
h1{
	margin-left:500px;
	color:#004;
	margin-top:200px;
}
</style>
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
 
<body>
	<h1>회원가입</h1>
	  <img class="img-fluid mb-5 d-block mx-auto" src="/ctrl/resources/img/logo.png" alt="">
	<form name="frm" id="frm" action="join.do" method="post">
		<input type="hidden" name="userid" id="userid" value="false">
		<input type="hidden" name="password_valid">
		<input type="hidden" id="email_valid" value="false">
	
		
		<div align="center" class="container" >
			<table id="blueone" class="col-xs-11">
				<tr>
					<th></th>
					<th colspan=2 >
				</tr>
				<tr>
					<td>이름 *</td>
					<td ><input type="text" name="name" id="name" class="form-control"></td>
					<td></td>
				</tr>
				<tr>
					<td>ID *</td>
					<td ><input type="text" disabled id="id" name ="id" class="form-control"></td>
					<td><input type="button" id="idcheck" value="중복체크" class="btn btn-primary"></td>
				</tr>
				<tr>
					<td>PASSWORD *</td>
					<td colspan=2 ><input type="password" id="password"	name="password" class="form-control" placeholder="(영문,특수기호포함)">
					<span id = 'password_valid_span'></span></td>
				</tr>
				<tr>
					<td>암호확인 *</td>
					<td><input type="password" id="pwd_check" class="form-control"></td>
					<td><span id = 'password_check_span'></span></td>
				</tr>

				<tr>
					<td>E-MAIL *</td>
					<td><input type="email" name="email" id="email" class="form-control"></td>
					<td> <input type="button" value="e-mail 인증" id="email_check_bt" class="btn btn-primary" >
						
					</td>
				</tr>
				<tr>
					<td>PHONE *</td>
					<td>
					<input type="text" name="phone" id="phone" class="form-control" maxlength="13">
					</td>
					<td ></td>
				</tr>
				<tr>
					<td>우편번호</td>
					<td ><input type="text" id="sample4_postcode"  class="form-control" placeholder="우편번호">
						<br>
						<input type="text" id="sample4_roadAddress" class="form-control" placeholder="도로명주소">
						<input type="text" id="sample4_jibunAddress" class="form-control" placeholder="지번주소">
						<span id="guide" style="color:#999;display:none"></span>
						<input type="text" id="sample4_extraAddress" class="form-control" placeholder="참고항목"></td>
					<td><input type="button" class="btn btn-primary" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"></td>
				</tr>
				<tr>
					<td>상세주소</td>
					<td colspan=2 ><input type="text"  id="sample4_detailAddress"  placeholder="상세주소" name="addr" id="addr" class="form-control"></td>
				</tr>
				<tr>
					<td></td>
					<td colspan=2><input type="button" id="insert_bt" value="확인" class="btn btn-primary"> &nbsp;&nbsp; 
					<input type="button" value="취소" class="btn btn-warning"></td>
				</tr>
			</table>
		</div>
	</form>
	<br>
	<br>
</body>

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
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>

<%@include file="../includes/footer.jsp"%>