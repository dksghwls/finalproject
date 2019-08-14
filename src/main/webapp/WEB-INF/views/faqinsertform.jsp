<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="post" action="/faqinsertok">
<label for="title">제목</label>
<input type="text" name="ftitle" id="title" required="required"><br>
<br>
<label for="content">내용</label>
<textarea rows="30" cols="100" name="fcontent" id="content" required="required"></textarea><br>

<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>

<input type="submit" value="등록">


</form>


</body>
</html>