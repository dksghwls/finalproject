<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="./resources/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
    $(function(){
        //전역변수
        var obj = [];              
        //스마트에디터 프레임생성
        nhn.husky.EZCreator.createInIFrame({
            oAppRef: obj,
            elPlaceHolder: "fcontent",
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
	    $("#faqinsertBoard").click(function(){
	        //id가 smarteditor인 textarea에 에디터에서 대입
	        obj.getById["fcontent"].exec("UPDATE_CONTENTS_FIELD", []);
	        //폼 submit
	        $("#faqinsertBoardFrm").submit();
	    });
    });
    
    
  </script>
</head>
<body>
<br>
	<div class="container">
	<form method="post" action="/faqinsertok" onsubmit="return faqCheck()" id="faqinsertBoardFrm" name="faqform">
	
	<label for="sel1">카테고리</label>
	 <select name="fcno"class="form-control" id="sel1"> 
		<option value="1">배송</option>
		<option value="2">주문</option>
		<option value="3">회원</option>
	</select><br>
	<br>
	<label for="focusedInput">제목</label>
	<input type="text" name="ftitle" class="form-control" id="focusedInput" value="" >
	<div id="result"></div><br>
	
	<br>
	<label for="fcontent">내용</label>
	<textarea class="form-control" rows="5" id="fcontent" name="fcontent" value=" style="width: 100%;">
	 </textarea><div id="result2"></div><br>
	<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
	<input type="submit" class="btn btn-default" id="faqinsertBoard" value="등록">
	</form>
	</div>
	
	<script>
	function faqCheck() {
		var ftitle = document.faqform.ftitle.value; // 제목
		var fcontent = document.faqform.fcontent.value; // 내용
	
		if(ftitle.length == 0) {
				$('#result').text("제목을 입력해주세요.");
				faqform.ftitle.focus();
				return false;
			}
		
		if(fcontent.length == 0) {
				$('#result2').text("내용을 입력해주세요.");
				faqform.fcontent.focus();
				return false;
			}
	}
</script>
	
 </body>
</html>