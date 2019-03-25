<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 패션 조회 된 페이지 -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Fashion&beauty</title>
<!-- <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"> -->
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<style>
.mainImage{
	position:relative;
	width: 100%;
	height: 100%; 
	text-align: center;
}
.block{
	position: absolute;
	background-color: black;
	opacity: 0.3;
	top: 0px;
	left: 0px;
	z-index: 3;
	width: 100%;
	height: 100%;
}
.faImage{
	width: 100%;
	height: 100%;
	position: absolute;
	top: 0px;
	left: 0px;
	z-index: 2;
}
.fb_text{
	color: white;
	z-index: 99;
	font-size: 60pt;
	position:relative;
	padding-top: 22%;
}
.fb_smallText{
	color: white;
	z-index: 99;
	font-size: 13pt;
	position:relative;
	padding-top: 50px;
}
.goodsList{
	width: 100%;
	padding-left: 143px;
	padding-top: 20px;
}
.goodsDiv{
	width: 320.5px;
	height: 450px;
	float: left;
	margin-right: 45.5px;
	margin-bottom: 57.8px;
	border: 1px solid #CBCACA;
	display: inline-block;
}
.goodsDiv:hover{
	border: 2px solid #7F7F7F;
}
.goodsListBox{
	width: 75%;
	margin: 0 auto;
}
.goodsDiv .imageBox{
	height: 70%;
	overflow: hidden;
}
.goodsDiv img{
	height: 100%;
	width: auto;
	display: block;
	margin: 0 auto;

}
.goodsListBox:after {
	 content:""; 
	 clear:both; 
	 display:block; 
}
.pricingContent ul{
   list-style: none;
   padding: 0;
   margin-bottom: 0;
}
.pricingContent ul li{
    border-bottom:1px solid #ededed;
    color: #9999A5;
    padding: 10px 0 ;
}
.pricingContent ul li:first-child {
    border-top:1px solid #ededed;
}
.searchBox{
	width: 60%;
	margin: 0 auto;
	padding-left: 100px;
	padding-bottom: 50px;
}
body, 
html {
	margin: 0;
	padding: 0;
	width: 100%;
	height: 100%;
	text-align: center;
	font-family: "Nanum Gothic", sans-serif;
}
#searchTable{
	margin-left:500px;
	margin-bottom:30px;
	margin-top:50px;
	
}
</style>
<script>
 function getData(pageNum){
	$("#results").load("getList.do",{"pageNum":pageNum,"field":$("#field option:selected").val(),"word":$("#word").val(),"category":"fashion"},function(data){
		$("#results").html(data);
	})
} 
</script>
</head>
	<%@include file="/resources/includes/navigation.jsp"%>
<body id="results">
	<div class="mainImage">
		<div class="block"></div>
		<img alt="펀딩메인" src="/ctrl/resources/img/crowd2.jpeg" class="faImage">
		<p class="fb_text">Funding</p>
		<p class="fb_smallText">
			심사부터 상환까지 리스크를 최소화한 펀딩플랫폼만의 투자보호정책(FP-6S)<br>
		"최고 수준의 투자보호정책, 오직 펀딩플랫폼에서만 가능합니다."
		</p>
	</div>
	 <div class="goodsList">
		<div class="goodsListBox">
			<c:forEach items="${glist }" var="list">
				<div class="goodsDiv"
					onclick="location.href='goodsView.do?num=${list.num}'">
					<div class="imageBox">
						${list.mainPic}
					</div>
					<div class="pricingContent">
						<ul>
							<li style = "white-space:nowrap; overflow : hidden;"><b>제목 :</b> ${list.title }</li>
							
							<li><b>목표금액 :</b> <fmt:formatNumber value="${list.wantPrice }" type="number"/></li>
							<li><b>현재금액 :</b> <fmt:formatNumber value="${list.currentPrice }" type="number"/></li>
							<li><b><strong> <fmt:formatNumber value="${list.currentPrice/list.wantPrice}" type="percent"/>달성</strong></b></li>
						</ul>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<div align="center">
		<%-- <!-- 이전 -->
		<c:if test="${startpage>blockpage }">
			<a href="javascript:getData(${startpage-blockpage })">[이전]</a>
		</c:if>
		<!-- 페이지출력 -->
		<c:forEach begin="${startpage }" end="${endpage }" var="i">
			<c:if test="${currentPage eq i}" >
				${i }
			</c:if>
			<c:if test="${currentPage ne i}" >
				<a href="javascript:getData(${i })">${i }</a>
			</c:if>
		</c:forEach>
		<!-- 다음 -->
		<c:if test="${endpage<totpage }">
			<a href="javascript:getData(${endpage+1 })">[다음]</a>
		</c:if>
		<br><br><br> --%>
	</div>
	<table id="searchTable" cellpadding="20px">
		<tr>
		   <td>
		   <select id="field" class="form-control" name="field">
		      <option value="title"> 제목
		      <option value="userid"> 작성자
		   </select>
		</td>
		<td>
		   <input type='text' id='word' name='word' class="form-control" placeholder="검색어입력">
		</td>
		<td>
		   <input type='button' class="btn btn-secondary" value="검색" onclick="javascript:getData(1)">
		  </td>
		  <td>
		   <c:if test="${sessionScope.id!=null }">
	 			<input type="button" class="btn btn-secondary" onclick="location.href='fundingInsert.do'" value="상품등록">
		   </c:if>
		   </td>
		   </tr>
		   </table>
	<%@include file="/resources/includes/footer.jsp"%>

</body>
</html>