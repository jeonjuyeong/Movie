<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"> -->
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<link
	href="https://fonts.googleapis.com/css?family=Nanum+Gothic&amp;subset=korean"
	rel="stylesheet">
<link rel="stylesheet" href="../fm/style.css" type="text/css">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="../fm/script.js"></script>
<script>
	$(document).ready(function() {
		$("#payBtn").click(function() {
			alert("결제하시겠습니까?");
			pay_frm.submit();
		});
	});
</script>
<style>
.viewbody {
	padding: 30px;
	width: 75%;
	border: 2px dotted gray;
	margin: 0 auto;
	margin-top: 10px;
}

.upDiv {
	width: 100%;
	height: 200px;
}

.upDiv:after {
	content: "";
	clear: both;
	display: block;
}

.upDiv .viewImg {
	text-align: center;
	width: 100%;
	height: 100%;
	float: left;
}

.upDiv .viewImg img {
	vertical-align: middle;
	width: auto;
	max-width: 100%;
	height: 100%;
	overflow: hidden;
}

.upDiv .sideDiv {
	padding-top: 170.2px;
	width: 100%;
	float: center;
}

.upDiv .sideDiv .viewText {
	width: 100%;
}

.viewText .pricingContent {
	margin: 0;
	text-align: center;
	padding-bottom: 10px;
}

.pBtn {
	text-align: center;
}

.pricingContent ul {
	list-style: none;
	padding: 0;
	margin-bottom: 0;
}

.pricingContent ul li {
	size: 50px;
	border-bottom: 1px solid #ededed;
	color: #9999A5;
	padding: 10px 0;
}

.pricingContent ul li:first-child {
	border-top: 1px solid #ededed;
}

.note {
	float: none;
}
</style>
<title>여기에 제목을 입력하십시오</title>
</head>
<body>
	<%@include file="/resources/includes/navigation.jsp"%>
	<div class="viewbody">
		<div class="upDiv">
			<div class="sideDiv">
				<div class="viewText">

					<div class="pricingContent">
						<ul>
							<li><b>제목 :</b> ${gVO.title }</li>
							<li><b>판매자 :</b>${gVO.userid }</li>
						</ul>
					</div>
				</div>

			</div>
		</div>
		<div class="note">
			<br> <br> <br> ${gVO.content }
		</div>
		<form name="pay_frm" method="post" action="fundPay">
			<div class="pricingContent">
			<input type="hidden" name="goodsNum" value="${gVO.num}"> 
			<input type="hidden" name="userid" value="${sessionScope.id}">
				<b>참여금액 선택 :</b> 
				<select id="priceSelect" name="priceSelect"
					class="form-control">
					<c:forEach items="${pList}" var="i">
						<option>${i.price}:${i.product}</option>
					</c:forEach>
				</select>
				<br>
				<div class="pBtn">
					<input type="button" class="btn btn-success" id="payBtn"
						value="참여하기">
					<c:if
						test="${sessionScope.id!=gVO.userid and sessionScope.id !=null and cart ==null}">
						<input type="button" class="btn btn-success"
							onclick="location.href='gVOCartin.do?num=${gVO.num}&id=${sessionScope.id }'"
							value="관심목록에 담기">
					</c:if>
					<c:if
						test="${sessionScope.id==gVO.userid or sessionScope.id=='master'}">
						<input type="button" class="btn btn-default"
							onclick="location.href='gVOUpdate.do?num=${gVO.num}'" value="수정">
						<input type="button" class="btn btn-default"
							onclick="location.href='gVODelete.do?num=${gVO.num}'" value="삭제">
					</c:if>
				</div>

			</div>
		</form>
	</div>
	<br>
	<br>
	<br>
	<br>
	<%@include file="/resources/includes/footer.jsp"%>
</body>

</html>