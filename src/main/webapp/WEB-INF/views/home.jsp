<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
#logo{
	margin-top:300px;
}
#fund_menu{
	height:400px;
	width:100%;
}
@import url(https://fonts.googleapis.com/css?family=Raleway:500,900);
figure.snip1432 {
  font-family: 'Raleway', Arial, sans-serif;
  color: #fff;

  position: relative;
  margin: 60px;
  max-width: 450px;
  max-height:300px;
  width: 100%;
  background: #000000;
  color: #ffffff;
  text-align: left;
  float: left;
}
figure.snip1432 * {
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
  -webkit-transition: all 0.6s ease;
  transition: all 0.6s ease;
}
figure.snip1432 img {
  opacity: 0.8;
  width: auto;
  height:100%;
  vertical-align: top;
  -webkit-transition: opacity 0.35s;
  transition: opacity 0.35s;
}
figure.snip1432 figcaption {
  position: absolute;
  bottom: 0;
  left: 0;
  width: 100%;
  height: 100%;
}
figure.snip1432 figcaption > div {
  height: 50%;
  overflow: hidden;
  width: 100%;
  position: relative;
}
figure.snip1432 h1,figure.snip1432 h2,figure.snip1432 h3 {
  margin: 0;
  position: absolute;
  left: 0;
  padding: 0 30px;
  text-transform: uppercase;
}
figure.snip1432 h1 {
  font-weight: 900;
  top: 0;
}
figure.snip1432 h2 {
  font-weight: 900;
  top: 0;
}
figure.snip1432 h3 {
  font-size: 1em;
  bottom: 0;
  font-weight: 500;
}
figure.snip1432 h3:nth-of-type(2) {
  opacity: 0;
  -webkit-transform: translateY(150%);
  transform: translateY(150%);
}
figure.snip1432 a {
  left: 0;
  right: 0;
  top: 0;
  bottom: 0;
  position: absolute;
}
figure.snip1432:hover img,
figure.snip1432.hover img {
  opacity: 0.3;
  -webkit-filter: grayscale(100%);
  filter: grayscale(100%);
}
figure.snip1432:hover figcaption h3:first-of-type,
figure.snip1432.hover figcaption h3:first-of-type {
  -webkit-transform: translateY(150%);
  transform: translateY(150%);
  opacity: 0;
}
figure.snip1432:hover figcaption h3:nth-of-type(2),
figure.snip1432.hover figcaption h3:nth-of-type(2) {
  opacity: 1;
  -webkit-transform: translateY(0%);
  transform: translateY(0%);
}
</style>
<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<title></title>


</head>

<body id="page-top">

	



	<!-- Navigation -->
	<%@include file="../views/includes/navigation.jsp"%>
	 <img id="logo" class="img-fluid mb-5 d-block mx-auto" src="/ctrl/resources/img/fundlogo2.png" alt="">
	  
<div id="fund_menu">

<figure class="snip1432">
<img class="img-fluid mb-5 d-block mx-auto" src="/ctrl/resources/img/crowd2.jpeg" alt="">
<figcaption>
    <div>
      <h3>What is </h3>
      <h3>Check it!</h3>
    </div>
    <div>
      <h2>crowdfunding?</h2>
    </div>
  </figcaption>
  <a href="#introduce_modal"></a>
</figure>

<figure class="snip1432">
<img class="img-fluid mb-5 d-block mx-auto" src="/ctrl/resources/img/crowd1.png" alt="">
<figcaption>
    <div>
      <h3></h3>
      <h3>funding now!</h3>
    </div>
    <div>
      <h1>FUNDING</h1>
    </div>
  </figcaption>
  <a href="funding.do"></a>
</figure>

<figure class="snip1432">
<img class="img-fluid mb-5 d-block mx-auto" src="/ctrl/resources/img/crowd3.png" alt="">
<figcaption>
    <div>
      <h3></h3>
      <h3>apply now!</h3>
    </div>
    <div>
      <h1>FINANCING</h1>
    </div>
  </figcaption>
  <a href="#"></a>
</figure>
</div>
<br>
<div class="title">
  <h1><span style="color: #0C2974; margin-left:30px;">언제 어디서나 쉽고 간편하게</span>
  <span style="color: #FD791A"> 펀딩을 시작하세요!<span></h1>
</div>
<img class="img-fluid mb-5 d-block mx-auto" src="/ctrl/resources/img/mainAni.gif" alt="">

<%@include file="../views/includes/footer.jsp"%>
<!-- Portfolio Modals -->
<%@include file = "../views/main/modal.jsp" %>



</body>
<script>/* Demo purposes only */
$(".hover").mouseleave(
		  function () {
		    $(this).removeClass("hover");
		  }
		);</script>
</html>
