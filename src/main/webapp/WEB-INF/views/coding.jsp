<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#codingform form
{
	position: relative;
	left:600px;
}
</style>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="./resources/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
    $(function(){
        //전역변수
        var obj = [];              
        //스마트에디터 프레임생성
        nhn.husky.EZCreator.createInIFrame({
            oAppRef: obj,
            elPlaceHolder: "content",
            sSkinURI: "./resources/editor/SmartEditor2Skin.html",
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
	        obj.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
	        //폼 submit
	        $("#insertBoardFrm").submit();
	    });
    });
</script>
</head>
<body>
	<div id="codingform">
	<form action="insertBoard" method="post" id="insertBoardFrm" enctype="multipart/form-data" >
		카테고리번호:<input type="text" name="cno" id="cno" class="form-control input-lg" style="width: 700px;"><br>
		상품이름:<input type="text" name="pname" id="pname" class="form-control input-lg" style="width: 700px;"><br>
		원가:<input type="text" name="oprice" id="oprice" class="form-control input-lg" style="width: 700px;"><br>
		할인가:<input type="text" name="dprice" id="dprice" class="form-control input-lg" style="width: 700px;"><br>
		상품설명:<textarea name="content" id="content" class="form-control" style="width: 700px; height: 400px;"></textarea>
		<label for="filename">파일명</label>
		<input type="text" name="filename" id="filename" class="form-control input-lg" style="width: 700px;"><br>
		<label for="file1">파일</label>
		<input type="file" name="file1" id="file1" class="form-control input-lg" style="width: 700px;"><br>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
        <input type="button" id="insertBoard" value="등록" class="btn btn-primary btn-lg" />
    </form>
    </div>
</body>
</html>