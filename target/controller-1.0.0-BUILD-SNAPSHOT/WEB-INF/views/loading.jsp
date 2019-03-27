<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style type="text/css">
#loading {
	width: 100%;
	height: 100%;
	top: 0px;
	left: 0px;
	position: fixed;
	display: block;
	opacity: 0.7;
	background-color: #fff;
	z-index: 99;
	text-align: center;
}

#loading-image {
	position: absolute;
	top: 100px; /* <-- 이부분과 */
	left: 500px; /*  <-- 이부분을 50% 로 하면 화면 정 가운데에 로딩 이미지가 나타난다 */
	margin : 0 auto;
	z-index: 100;
}
</style>
<script>   
$(window).load(function() {     
 $('#loading').hide();   
}); 
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- loading -->
	<div id="loading">
		<img id="loading-image" src="/ctrl/resources/img/loading/loading.gif"
			alt="Loading..." />
	</div>

</body>
<script>
location.href = "main/getMovieRank";
</script>
</html>