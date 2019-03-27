<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.css">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&amp;subset=korean" rel="stylesheet">

<style>
#blueone {
	border-collapse: collapse;
	width: 900px;
}

#blueone th {
	padding: 10px;
	color: #168;
	border-bottom: 3px solid #0B4C5F;
	text-align: center;
}

#blueone td {
	color: #669;
	padding: 10px;
	border-bottom: 1px solid #0B4C5F;
}

#blueone tr:hover td {
	color: #004;
}

.container{
	width: 75%;
	margin: 0 auto;
	padding: 40px;
	text-align: center;
}
.btnbtnBox{
	width: 100%;
	text-align: center;
}
</style>
</head>
<body>
<%@include file="/resources/includes/navigation.jsp"%>
<script>
$(document).ready(function(){
	$("#goodsShow").css("display","none");
	$("#memberShow").css("display","none");
	$("#btnMemberShow").click(function(){
		$("#goodsShow").css("display","none");
		$("#memberShow").css("display","block");
	});
	$("#btnGoodsShow").click(function(){
		$("#memberShow").css("display","none");
		$("#goodsShow").css("display","block");
	});
});
</script>
<div class="container">
 <h2 style="margin-top:200px"> 관리자페이지 입니다 </h2>
	<div id="buttonDiv">
		<input type="button" value="회원 현황" id="btnMemberShow" class="btn btn-secondary">
		<input type="button" value="상품 현황" id="btnGoodsShow" class="btn btn-secondary">
	</div>
		<div id="memberShow">
			<table id="blueone">
				<tr>
					<th>ID</th>
					<th>이름</th>
					<th>전화번호</th>
					<th>이메일</th>
					<th>삭제하기</th>
				</tr>
				<c:forEach items="${mVO}" var="list">
					<tr>
						<td>${list.id}</td>
						<td>${list.name}</td>
						<td>${list.phone}</td>
						<td>${list.email}</td>
						<td><input type="button" value="회원삭제" class="btn btn-primary"
							onclick="location.href='memberDelete?id=${list.id}'"></td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div id="goodsShow">
			<table id="blueone">
				<tr>
					<th>제목</th>
					<th>목표금액</th>
					<th>현재금액</th>
					<th>달성률</th>
					<th>삭제하기</th>
				</tr>
				<c:forEach items="${gVO}" var="list">
					<tr>
						<td><a href="../funding/goodsView.do?num=${list.num}"> <c:if
									test="${fn:length(list.title) > 9}">
       												 					   ${fn:substring(list.title,0,9)}...
       																 </c:if> <c:if test="${fn:length(list.title) <= 9}">
       												 					   ${list.title}
       																 </c:if>
						</a></td>
						<td><fmt:formatNumber value="${list.wantPrice }"
								type="number"/></td>
						<td><fmt:formatNumber value="${list.currentPrice }"
								type="number"/></td>
						<td><fmt:formatNumber
								value="${list.currentPrice/list.wantPrice}" type="percent" /></td>
						<td><input type="button" value="삭제" class="btn btn-primary" onclick="location.href='goodsDelete?num=${list.num}'"></td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<script>
			/*  
			 Morris.Bar({
			 element: 'total_graph',     
			 data: [                              
			 { y: '총 회원  ', value:$("#mem_total").val() },
			 { y: 'FleaMarket 판매글', value:$("#flea_total").val() },
			 { y: 'Store 판매 글', value:$("#store_total").val() },
			 { y: '장바구니 등록 글', value:$("#cart_total").val()},
			 { y: 'QnA 등록 글', value:$("#qna_total").val()}
			 ],
			 xkey: 'y',                          
			 ykeys: ['value'],              
			 labels: ['총 수']
			 });
			
			 Morris.Donut({
			 element: 'flea_graph',    
			 data: [                                    
			 {label: 'Fashion', value:Math.round($("#fashion").val()) },
			 {label: 'Hobby', value: Math.round($("#hobby").val()) },
			 {label: 'Living', value:Math.round($("#living").val()) },
			 {label: 'Food', value: Math.round($("#food").val()) },
			 {label: 'Pet', value:Math.round($("#pet").val())}
			 ],
			 colors: ["#30a1ec", "#76bdee", "#387bb4", "#c4dafe"],
			 formatter: function (y) { return y + "%" } 
			 });
			
			 Morris.Donut({
			 element: 'store_graph',   
			 data: [                                    
			 {label: 'Foraml Dress', value:Math.round( $("#store1").val() )},
			 {label: 'Aesop', value:Math.round( $("#store2").val()) },
			 {label: 'Green Shop', value:Math.round( $("#store3").val()) },
			 {label: 'P.P Flower', value:Math.round( $("#store4").val()) }
			 ],
			 colors: ["#30a1ec", "#76bdee", "#387bb4", "#c4dafe"], 
			 formatter: function (y) { return y + "%" } 
			 });  */
		</script>
	</div>
</body>
</html>