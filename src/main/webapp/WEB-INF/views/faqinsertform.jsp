<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<br>
	<div class="container">
<form method="post" action="/faqinsertok">

<label for="sel1">카테고리</label>
 <select name="fcno"class="form-control" id="sel1"> 
<option value="1">1.배송</option>
<option value="2">2.주문</option>
<option value="3">3.회원</option>
</select><br>
<br>
 
<label for="focusedInput">제목</label>
<input type="text" name="ftitle" class="form-control" id="focusedInput" required="required"><br>
<br>
<label for="comment">내용</label>
<textarea class="form-control" rows="5" id="comment"name="fcontent" required="required">
 </textarea><br>

<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>

<input type="submit" class="btn btn-default" value="등록">


</form>
</div>


</body>
</html>