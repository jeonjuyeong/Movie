<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>에디터</title>
 
<script src="https://code.jquery.com/jquery-latest.js"></script>

<link rel="stylesheet" href="/post_inc/datetimepicker/bootstrap-datepicker.css">
<script src="/post_inc/datetimepicker/bootstrap-datepicker.js"></script>

 <link rel="stylesheet" href="/post_inc/datetimepicker/bootstrap-datetimepicker.css">
<script src="/post_inc/datetimepicker/bootstrap-datetimepicker.js"></script>
<link rel="stylesheet" href="/post_inc/datetimepicker/bootstrap-datetimepicker_3d.css">
<script src="/post_inc/datetimepicker/moment-with-locales.js"></script>
<script src="/post_inc/datetimepicker/bootstrap-datetimepicker_3d.js"></script>

<script type="text/javascript" src="/ctrl/resources/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
 <style>
#editer_div{
	margin-left:450px;
	margin-top:200px;
}
 </style>
</head>
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

        $(function(){
        	$('#dd').datepicker({format:"yyyy-mm-dd"}).datepicker("setDate", new Date(1985,10,01));
        	$('#tt').datetimepicker({format:"YYYY-MM-DD HH:mm:ss"}).data('DateTimePicker').date(new Date(1985,11,01,11,30,21));
        });
    });
</script>
<body>
 	<%@include file="../includes/navigation.jsp"%>

    <form action="./insertBoard.do" method="post" id="insertBoardFrm" enctype="multipart/form-data">
     <div id="editer_div">
    <h1>fund 상품 등록하기</h1>
    <input type="hidden" value="${sessionScope.id}">
    <table>
    <tr>
    	<td>제목:</td>
    	<td><input type="text" id="goods_title" class="form-control"></td>
    </tr>
	<tr>	
	<td>
	<div class='col-sm-6'>
		datepicker 
		<input type="text" class="form-control" id="dd"><br>
	</div>
</td>
	<td><div class='col-sm-6'>
		datetimepicker 
		<input type='text' class="form-control" id='tt' />
	</div></td>
	</tr>    
	
    </table>
    

        <textarea name="editor" id="editor" style="height:600px;width:900px;"></textarea>
    </div>
        <input type="button" id="insertBoard" value="등록" />
    </form>
 <%@include file="../includes/footer.jsp"%>
</body>
</html>
