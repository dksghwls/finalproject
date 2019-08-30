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
</head>
<body>
<br>
	<div class="container">
	<c:set var="member" value="${ sessionScope.user }"></c:set>
	<form method="post" action="/contactmodifyok" id="contactmodi">
	<input type="hidden" class="form-control" id="focusedInput" name="hno" 
	 value="${dto.hno }" style="width: 15%;" readonly="readonly"><br>
	<input type="hidden" name="no" value="${member.no }"> 
	<label for="focusedInput">회원명</label>
	<input type="text" class="form-control" id="focusedInput" name="nickname" 
	 value="${member.nickname }" style="width: 15%;" readonly="readonly" ><br>
	<br>
	<label for="htitle">제목</label> 
		<textarea class="form-control" rows="1" id="htitle" name="htitle"
				style="width: 27%;" >${dto.htitle }</textarea>
	 <br>
	<label for="hcontent">내용</label><br>
	<textarea class="form-control" rows="5" id="hcontent"
	 name="hcontent" style="width: 48%;">${dto.hcontent }</textarea><br>
	<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
	<input type="submit" class="btn btn-default" id="contactmodiboard" value="수정완료">
	<input type="reset" class="btn btn-default" value="취소">
	 </form>
	</div>
</body>
</html>