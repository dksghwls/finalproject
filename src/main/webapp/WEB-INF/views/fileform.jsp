<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<form method="post" action="/fileok" enctype="multipart/form-data">
<label for="filename">파일명</label>
<input type="text" name="filename" id="filename"><br>
<label for="file1">파일</label>
<input type="file" name="file1" id="file1"><br>
<input type="hidden" name="${_csrf.parameterName }"
			value="${_csrf.token }" /> 
<input type="submit" value="파일등록">

</form>

</body>
</html>