<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.10/css/all.css">
<style>
$logo: #3DBB3D;
$gray: #777777;
$black: #070707;
$green: #084B8A;
$aqua: #2897BA;
$white: #FFFFFF;

@import url('https://fonts.googleapis.com/css?family=Nunito:400,900|Montserrat|Roboto');

$hulu: 'Nunito Sans', sans-serif;
$heading: 'Montserrat', sans-serif;
$body: 'Roboto', sans-serif;
@import url(https://fonts.googleapis.com/css?family=Raleway:500,900);

 
body {
  background: linear-gradient(to right, #2897BA, #084B8A);
   font-family: 'Raleway', Arial, sans-serif;
}

#mypage_container {
  background: #FFFFFF;
  border-style: solid;
  border-width: 3px;
  border-color: #585858;
  width: 1200px;
  height: 600px;
  margin: 0 auto;
  position: relative;
  margin-top: 10%;
  box-shadow: 2px 5px 20px rgba($gray, .5);
}

.CTA {
  width: 80px;
  height: 40px;
  right: -20px;
  bottom: 0;
  margin-bottom: 90px;
  position: absolute;
  z-index: 1;
  background:#084B8A;
  font-size: 1em;
  transform: rotate(-90deg);
  transition: all .5s ease-in-out;
  cursor: pointer;
  &:hover {
    background: #2897BA;
    transform: scale(1.1);
  }
}

.leftbox {
  float: left;
  top: -5%;
  left: 5%;
  position: absolute;
  width: 18%;
  height: 110%;
  background:#084B8A;
  box-shadow: 3px 3px 10px rgba($gray, .5);
}

#mypage_nav a {
  list-style: none;
  padding: 35px;
  color: #FFFFFF;
  font-size: 1.1em;
  display: block;
  transition: all .3s ease-in-out;
  }
  #mypage_nav a :hover {
    color: #2897BA;
    transform: scale(1.2);
    cursor: pointer;
  }
  
#mypage_nav a :first-child {
   margin-top: 7px;
 }
.mypage_active {
	 color: #2897BA;
}

.rightbox {
  float: right;
  width: 60%;
  height: 100%;
}

.profile, .payment, .subscription, .privacy, .settings {
  transition: opacity .5s ease-in;
  position: absolute;
  width: 70%;
}

#mypageh1 {
	margin-top:150px;
	margin-left:150px;
	
}

.privacy h2{
  margin-top: 25px;
}

.settings h2{
  margin-top: 25px;
}

.noshow {
  opacity: 0;
}

</style>

<script>
$(document).ready(function(){
	$('#mypage_nav a').click(function(e) {
	  e.preventDefault();
	  $('#mypage_nav a').removeClass('mypage_active');
	  $(this).addClass('mypage_active');
	  if(this.id === !'payment'){
	    $('.payment').addClass('noshow');
	  }
	  else if(this.id === 'payment') {
	    $('.payment').removeClass('noshow');
	    $('.rightbox').children().not('.payment').addClass('noshow');
	  }
	  else if (this.id === 'profile') {
	    $('.profile').removeClass('noshow');
	     $('.rightbox').children().not('.profile').addClass('noshow');
	  }
	  else if(this.id === 'subscription') {
	    $('.subscription').removeClass('noshow');
	    $('.rightbox').children().not('.subscription').addClass('noshow');
	  }
	    else if(this.id === 'privacy') {
	    $('.privacy').removeClass('noshow');
	    $('.rightbox').children().not('.privacy').addClass('noshow');
	  }
	  else if(this.id === 'settings') {
	    $('.settings').removeClass('noshow');
	    $('.rightbox').children().not('.settings').addClass('noshow');
	  }
	});
});
</script>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%@include file="../includes/navigation.jsp"%>
	<h1 id="mypageh1">마이페이지</h1>
 <img class="img-fluid mb-5 d-block mx-auto" width ="500" height="400" src="/ctrl/resources/img/fundlogo2.png" alt="">
<div id="mypage_container">
  <div id="logo"><h1 class="logo"></h1>
  </div>
  <div class="leftbox">
    <nav id="mypage_nav">
      <a id="profile" class="mypage_active"><i class="fa fa-user"></i> PROFILE</a>
      <a id="payment"><i class="fa fa-credit-card"></i> FUNDING</a>
      <a id="subscription"><i class="fa fa-tv"></i> MY FUND</a>
      <a id="privacy"><i class="fa fa-tasks"></i></a>
      <a id="settings"><i class="fa fa-cog"></i></a>
    </nav>
  </div>
  <div class="rightbox">
    <div class="profile">
      A
    </div>
    
    <div class="payment noshow">
    B
    </div>

    <div class="subscription noshow">
  C
    </div>

    <div class="privacy noshow">
    D
    </div>
 <div class="settings noshow">
     E
    </div>
    
  </div>
</div>
<br>
<br>
<br>
<br>
<br>
<%@include file="../includes/footer.jsp"%>
</body>

</html>