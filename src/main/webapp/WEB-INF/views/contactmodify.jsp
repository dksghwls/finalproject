<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
 
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="./../resources/editor/js/HuskyEZCreator.js"></script>
<!-- <script type="text/javascript">
$(document).ready(function() {

    $(function(){
        //전역변수
        var obj = [];   
        var content = '${dto.hcontent }';
        console.log(content);
        //스마트에디터 프레임생성
        nhn.husky.EZCreator.createInIFrame({
            oAppRef: obj,
            elPlaceHolder: "hcontent",
            sSkinURI: "./../resources/editor/SmartEditor2Skin.html",
            htParams : {
                // 툴바 사용 여부
                bUseToolbar : true,            
                // 입력창 크기 조절바 사용 여부
                bUseVerticalResizer : true,    
                // 모드 탭(Editor | HTML | TEXT) 사용 여부
                bUseModeChanger : true,
            },
            fOnAppLoad : function() {
            	obj.getById["hcontent"].exec("PASTE_HTML", [content]);
			},
			fCreator: "createSEditor2"
        });
        
      //전송버튼
	    ;$("#contactmodiboard").click(function(){
	        //id가 smarteditor인 textarea에 에디터에서 대입
	        obj.getById["hcontent"].exec("UPDATE_CONTENTS_FIELD", []);
	        //폼 submit
	        $("#contactmodi").submit();
	    });
    });
});
</script> -->
</head>
<body>
<br>
	<div class="container">
	<c:set var="member" value="${ sessionScope.user }"></c:set>
	<form method="post" action="/contactmodifyok" id="contactmodi">
	
	<label for="focusedInput">글번호</label>
	<input type="text" class="form-control" id="focusedInput" name="hno" value="${dto.hno }" style="width: 15%;" readonly="readonly"><br>
	
	<input type="hidden" name="no" value="${member.no }"><br>
	
	<label for="focusedInput">회원명</label>
	<input type="text" class="form-control" id="focusedInput" name="nickname" value="${member.nickname }" style="width: 15%;" readonly="readonly" ><br>
	<br>
	<label for="sel1">제목</label> 
	<select name="htitle"  class="form-control" id="sel1" value="${dto.htitle }" style="width: 15%;"><br>
			<option value="계정문의">계정문의</option>
			<option value="개인정보">개인정보</option>
			<option value="할인문의">할인문의</option>
			<option value="기타문의">기타문의</option>
		</select><br>
			<br>
	 
	<label for="hcontent">내용</label><br>
	<textarea class="form-control" rows="5" id="hcontent"name="hcontent" style="width: 48%;">${dto.hcontent }</textarea>
 
	<br>
	<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
	<input type="submit" class="btn btn-default" id="contactmodiboard" value="수정완료">
	<input type="reset" class="btn btn-default" value="취소">
	 
	</form>
	</div>
</body>
</html>