<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<br>
	<div class="container">
	 		<form method="post" action="/recontentok">
	 		<input type="hidden" name="hno" value="${dto.hno}">
	 		<label for="hcontent">문의내용</label><br>
		<textarea class="form-control" rows="5" id="hcontent"
			name="hcontent" style="width: 48%;" readonly="readonly">${dto.hcontent }</textarea>
		<br>
		<label for="recontent">답변내용</label><br>
		<textarea class="form-control" rows="5" id="recontent"name="recontent" style="width: 48%;"></textarea>
		<br> <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
		<input type="submit" class="btn btn-default" value="답변등록">
		</form>
	</div>

</body>
</html>