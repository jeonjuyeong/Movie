<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>에디터</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
 
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script type="text/javascript" src="/ctrl/resources/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
 <script>
 </script>
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
	border-bottom: 1px solid #fff;
}

#blueone tr:hover td {
	color: #004;
}
#editer_div{
	margin-left:450px;
	margin-top:200px;
}
#btn_insertBoard{
margin-left:900px;
margin-bottom:50px;
margin-top:50px
}
 </style>
</head>

<body>
 	<%@include file="../includes/navigation.jsp"%>

    <form action="./insertBoard.do" method="post" id="insertBoardFrm" enctype="multipart/form-data">
     <div id="editer_div">
    <h1>fund 상품 등록하기</h1>
    <br>
    <input type="hidden" value="${sessionScope.id}">
    <table id="blueone">
    <tr>
    	<td>제목:</td>
    	<td colspan=2><input type="text" id="goods_title" class="form-control"></td>
    </tr>
	<tr>
		<td>시작~종료날짜:</td>	
		<td><input type='text' class="form-control" id='datepicker'/></td>
		<td><input type='text' class="form-control" id='datepicker'/></td>
	</tr>    
	<tr>
		<td>목표금액:</td>
		<td><input type="text" class="form-control" id='currentPrice' name='currentPrice'></td>
		<td><strong>WON</strong></td>
	</tr>
	<tr>
		<td>참여금액:</td>
		<td>
			<input type="text" name="wantPrice" id="wantPrice" placeholder="참여자들이 내는 금액" class="form-control"> 
		</td>
		<td><strong>WON</strong></td>
	</tr>
    </table>
        <textarea name="editor" id="editor" style="height:600px;width:900px;"></textarea>
    </div>
    <div id="btn_insertBoard">
        <input type="button" id="insertBoard" value="등록" class="btn btn-secondary"/>
    </div>
    </form>
 <%@include file="../includes/footer.jsp"%>
</body>
<script type="text/javascript">
    $(function(){
        //전역변수
        var obj = [];              
        //스마트에디터 프레임생성
        nhn.husky.EZCreator.createInIFrame({
            oAppRef: obj,
            elPlaceHolder: "editor",
            sSkinURI: "/ctrl/resources/editor/SmartEditor2Skin.html",
            htParams : {
                // 툴바 사용 여부
                bUseToolbar : true,            
                // 입력창 크기 조절바 사용 여부
                bUseVerticalResizer : true,    
                // 모드 탭(Editor | HTML | TEXT) 사용 여부
                bUseModeChanger : true,
            }
        });
        //전송버튼
        $("#insertBoard").click(function(){
            //id가 smarteditor인 textarea에 에디터에서 대입
            obj.getById["editor"].exec("UPDATE_CONTENTS_FIELD", []);
            //폼 submit
            $("#insertBoardFrm").submit();
        });
    });
    

</script>
</html>