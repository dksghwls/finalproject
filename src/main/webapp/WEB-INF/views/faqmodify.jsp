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
	<div class="container">
	<br>
	<form method="post" action="/faqmodifyok">
	
	
	<label for="focusedInput">글번호</label>
	<input type="text" name="fno" class="form-control" id="focusedInput" value="${dto.fno }" readonly="readonly"><br>
	<br>
	<label for="sel1">카테고리</label>
 	<select name="fcno" class="form-control" id="sel1" value="${dto.fcname }"> 
	<option value="1">1.배송</option>
	<option value="2">2.주문</option>
	<option value="3">3.회원</option>
	</select><br>
	<%-- <label for="fcname">카테고리번호</label>
	<input type="text" name="fcname" id="fcname" value="${dto.fcname }" readonly="readonly"><br> --%>
	<br>
	<label for="focusedInput">제목</label>
	<input type="text" name="ftitle" class="form-control" id="focusedInput" value="${dto.ftitle }"><br>
	<br>
	<label for="conmment">내용</label><br>
	<textarea class="form-control" rows="5" id="comment"name="fcontent">${dto.fcontent }</textarea><br>
	<br>
	<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
	<input type="submit" class="btn btn-default" value="수정완료">
	<input type="reset" class="btn btn-default" value="취소">
	 
	</form>
	</div>
</body>
</html>