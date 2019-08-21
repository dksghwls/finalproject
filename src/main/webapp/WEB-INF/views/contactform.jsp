<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
            elPlaceHolder: "hcontent",
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
	    $("#contactinsert").click(function(){
	        //id가 smarteditor인 textarea에 에디터에서 대입
	        obj.getById["hcontent"].exec("UPDATE_CONTENTS_FIELD", []);
	        //폼 submit
	        $("#contactform").submit();
	    });
    });
    
</script>
</head>
<body>
<br>
	<div class="container">
	<c:set var="member" value="${ sessionScope.user }"></c:set>
	<form method="post" action="/contactok" id="contactform">

		<input type="hidden" name="no" value="${member.no }">
		<label for="focusedInput">회원명</label> 
		<input type="text" name="nickname" class="form-control" id="focusedInput" value="${member.nickname }" readonly="readonly"><br>
		<br>
		 <label for="sel1">제목</label> 
		<select name="htitle" class="form-control" id="sel1">
			<option value="계정문의">계정문의</option>
			<option value="개인정보">개인정보</option>
			<option value="할인문의">할인문의</option>
			<option value="기타문의">기타문의</option>
		</select><br> <br> 
		
		<label for="hcontent">내용</label>
		<textarea class="form-control" rows="5" id="hcontent"name="hcontent" 
			required="required"></textarea>
		<br> <input type="hidden" name="${_csrf.parameterName }"
			value="${_csrf.token }" /> 
			
		<a href="contactfile"><input type="button" class="btn btn-default" value="파일추가"></a>	
			
			<input type="submit" class="btn btn-default" id="contactinsert" value="등록">
	</form>
</div>

</body>
</html>