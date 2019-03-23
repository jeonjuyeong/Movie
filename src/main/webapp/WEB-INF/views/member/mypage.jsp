<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link
	href="https://fonts.googleapis.com/css?family=Nanum+Gothic&amp;subset=korean"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.0.10/css/all.css">
<style>
$
logo


:

 

#3DBB3D


;
$
gray


:

 

#777777


;
$
black


:

 

#070707


;
$
green


:

 

#084B8A


;
$
aqua


:

 

#2897BA


;
$
white


:

 

#FFFFFF


;
@import
	url('https://fonts.googleapis.com/css?family=Nunito:400,900|Montserrat|Roboto')
	;

$
hulu


:

 

'
Nunito

 

Sans


'
,
sans-serif


;
$
heading


:

 

'
Montserrat


'
,
sans-serif


;
$
body


:

 

'
Roboto


'
,
sans-serif


;
@import url(https://fonts.googleapis.com/css?family=Raleway:500,900);

body {
	background: linear-gradient(to right, #2897BA, #084B8A);
	font-family: "Nanum Gothic", sans-serif;
}

#mypage_container {
	background: #FFFFFF;
	border-style: solid;
	border-width: 3px;
	border-color: #585858;
	width: 1000px;
	height: 600px;
	margin: 0 auto;
	position: relative;
	margin-top: 10%;
	box-shadow: 2px 5px 20px rgba($ gray, .5);
}

.CTA {
	width: 80px;
	height: 40px;
	right: -20px;
	bottom: 0;
	margin-bottom: 90px;
	position: absolute;
	z-index: 1;
	background: #084B8A;
	font-size: 1em;
	transform: rotate(-90deg);
	transition: all .5s ease-in-out;
	cursor: pointer; &: hover { background : #2897BA;
	transform: scale(1.1);
}

}
.leftbox {
	float: left;
	top: -5%;
	left: 5%;
	position: absolute;
	width: 19%;
	height: 110%;
	background: #0B243B;
	box-shadow: 3px 3px 10px rgba($ gray, .5);
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
}

#mypageh1 {
	margin-top: 150px;
	margin-left: 150px;
}

.privacy h2 {
	margin-top: 25px;
}

.settings h2 {
	margin-top: 25px;
}

.noshow {
	opacity: 0;
}

.pricingTable {
	margin-top: 50px;
	text-align: center;
	border: 1px solid #dbdbdb;
	position: 0 auto;
	overflow: hidden;
}

.pricingTable .pricingTable-header h3 {
	color: #9999a5;
	font-size: 18px;
	text-transform: uppercase;
}

.pricingTable .price-value {
	background: #fafafa;
	color: #666;
	font-weight: 900;
	padding: 15px 0;
}

.pricingTable .price-value span {
	color: #666;
	display: inline-block;
	font-size: 70px;
	font-weight: normal;
	line-height: normal;
}

.pricingTable .price-value small {
	font-size: 20px;
	position: relative;
	top: -30px;
	left: 0;
}

.pricingTable .price-value .subtitle {
	color: #82919F;
	display: block;
	font-size: 16px;
	font-weight: 100;
	font-style: italic;
}

.pricingTable .best-offer {
	background-color: #3498db;
	color: #fff;
	padding: 6px 50px;
	font-size: 10px;
	line-height: 12px;
	text-transform: uppercase;
	position: absolute;
	top: 20px;
	right: -55px;
	transform: rotate(45deg);
}

.pricingTable .pricingContent ul {
	list-style: none;
	padding: 0;
	margin-bottom: 0;
}

.pricingTable .pricingContent ul li {
	border-bottom: 1px solid #ededed;
	color: #9999A5;
	padding: 10px 0;
}

.pricingTable .pricingContent ul li:first-child {
	border-top: 1px solid #ededed;
}

.pricingTable .pricingTable-sign-up {
	padding: 25px 0;
}

.pricingTable .btn-block {
	background: #666;
	border-radius: 0px;
	border: 0px none;
	color: #fff;
	width: 50%;
	padding: 10px 5px;
	margin: 0 auto;
	text-transform: capitalize;
	transition: all 0.3s ease 0s;
}

.pricingTable .btn-block:after {
	content: "\f090";
	font-family: "Font Awesome 5 Free";
	font-weight: 900;
	padding-left: 10px;
	font-size: 15px;
}

.pricingTable .btn-block:hover {
	background: #282828;
	color: #fff;
}

@media screen and (max-width:990px) {
	.pricingTable {
		margin-bottom: 20px;
	}
}

.design-process-content {
	margin: 0 auto;
	padding: 0;
}
</style>

<script>
	$(document).ready(
			function() {
				$('#mypage_nav a').click(
						function(e) {
							e.preventDefault();
							$('#mypage_nav a').removeClass('mypage_active');
							$(this).addClass('mypage_active');
							if (this.id === !'payment') {
								$('.payment').addClass('noshow');
							} else if (this.id === 'payment') {
								$('.payment').removeClass('noshow');
								$('.rightbox').children().not('.payment')
										.addClass('noshow');
							} else if (this.id === 'profile') {
								$('.profile').removeClass('noshow');
								$('.rightbox').children().not('.profile')
										.addClass('noshow');
							} else if (this.id === 'subscription') {
								$('.subscription').removeClass('noshow');
								$('.rightbox').children().not('.subscription')
										.addClass('noshow');
							} else if (this.id === 'privacy') {
								$('.privacy').removeClass('noshow');
								$('.rightbox').children().not('.privacy')
										.addClass('noshow');
							} else if (this.id === 'settings') {
								$('.settings').removeClass('noshow');
								$('.rightbox').children().not('.settings')
										.addClass('noshow');
							}
						});
			});
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="/resources/includes/navigation.jsp"%>
	<h1 id="mypageh1">마이페이지</h1>
	<br>
	<img class="img-fluid mb-5 d-block mx-auto" width="900" height="650"
		src="/ctrl/resources/img/fundlogo2.png" alt="">
	<div id="mypage_container">
		<div id="logo">
			<h1 class="logo"></h1>
		</div>
		<div class="leftbox">
			<nav id="mypage_nav">
				<a id="profile" class="mypage_active"><i class="fa fa-user">
						PROFILE</i></a> <a id="payment"><i class="fa fa-credit-card">
						FUNDING</i> </a> <a id="subscription"><i class="fa fa-tv"> MY FUND</i>
				</a> <a id="privacy"><i class="fa fa-tasks"></i></a> <a id="settings"><i
					class="fa fa-cog"></i></a>
			</nav>
		</div>
		<div class="rightbox">
			<div class="profile">
				<div role="tabpanel" class="tab-pane active" align="center"
					id="discover">
					<div class="design-process-content">
						<div class="container">
							<div class="row">
								<div class="col-xs-15"
									style="width: 600px; margin-left: -100px;">
									<div class="pricingTable">
										<div class="pricingTable-header">
											<h3>내정보</h3>
										</div>
										<div class="price-value">
											<span>${sessionScope.id}</span> <span class="subtitle">${vo.name}</span>
										</div>
										<div class="pricingContent">
											<ul>
												<li><b>E-MAIL:</b>${vo.email}</li>
												<li><b>PHONE:</b>${vo.phone}</li>
												<li><b>ADDRESS:</b>${vo.postcode} ${vo.roadAddress}
													${vo.jibunAddress} ${vo.extraAddress}</li>
												<li><b>MY FUND:</b>${myFunding }</li>
											</ul>
										</div>
										<!-- /  CONTENT BOX-->
										<div class="pricingTable-sign-up">
											<!-- BUTTON BOX-->
											<a href="#" class="btn btn-block btn-default">정보수정</a> <a
												href="#" class="btn btn-block btn-default">비밀번호변경</a>
										</div>
										<!-- BUTTON BOX-->
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="payment noshow">
				<div role="tabpanel" class="tab-pane active" align="center"
					id="discover">
					<div class="design-process-content">
						<div class="container">
							<div class="row">
								<div class="col-xs-15"
									style="width: 600px; margin-left: -100px;">
									<div class="pricingTable">
										<div class="pricingTable-header">
											펀딩한 상품
											<div class="pricingContent">
												<div class="payment result">
													<table class="table table-hover">
														<tr>
															<td>제목</a></td>
															<td>내가넣은금액</td>
															<td>내가얻을상품</td>
															<td>목표금액</td>
															<td>현재금액</td>
															<td>달성률</td>
														</tr>
														<c:forEach items="${fundingList }" var="list">
														<tr>
															<td><a href="../funding/goodsView.do?num=${list.goodsNum}">${list.title }</a></td>
															<td>${list.price }</td>
															<td>${list.product }</td>
															<td>${list.wantPrice }</td>
															<td>${list.currentPrice }</td>
															<td>${list.wantPrice/100*list.currentPrice }</td>
														</tr>
														</c:forEach>
														
													</table>
												</div>
											</div>
											<!-- BUTTON BOX-->
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<!-- /  CONTENT BOX-->
				</div>

				<div class="subscription noshow"></div>

				<div class="privacy noshow">D</div>
				<div class="settings noshow">E</div>

			</div>
		</div>

		<br> <br> <br> <br> <br>
</body>

</html>
