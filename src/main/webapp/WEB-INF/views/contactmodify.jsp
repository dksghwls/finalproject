<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<br>
	<div class="container">
	<c:set var="member" value="${ sessionScope.user }"></c:set>
	<form method="post" action="/contactmodifyok">
	
	<label for="focusedInput">글번호</label>
	<input type="text" class="form-control" id="focusedInput" name="hno"  value="${dto.hno }" readonly="readonly"><br>
	
	<input type="hidden" name="no" value="${member.no }"><br>
	
	<label for="focusedInput">회원명</label>
	<input type="text" class="form-control" id="focusedInput" name="nickname"  value="${member.nickname }" readonly="readonly"><br>
	<br>
	<label for="sel1">제목</label> 
	<select name="htitle"  class="form-control" id="sel1"  value="${dto.htitle }"><br>
			<option value="계정문의">계정문의</option>
			<option value="개인정보">개인정보</option>
			<option value="할인문의">할인문의</option>
			<option value="기타문의">기타문의</option>
		</select><br>
			<br>
	 
	<label for="comment">내용</label><br>
	<textarea class="form-control" rows="5" id="comment"name="hcontent">${dto.hcontent }</textarea>
 
	<br>
	<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
	<input type="submit" class="btn btn-default" value="수정완료">
	<input type="reset" class="btn btn-default" value="취소">
	 
	</form>
	</div>
</body>
</html>