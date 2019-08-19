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
		<div class="panel panel-default">
		<div class="panel-heading">회원번호: ${dto.no }</div>
			<div class="panel-heading">제목: ${dto.htitle }</div>
			<div class="panel-body">내용: ${dto.hcontent }</div>
		</div>

		<a href=/contact><input type="button" value="목록"></a>
		<a href="/contactmodify/${dto.hno }"><input type="button"
			value="수정"></a>
		<a href="/contactdelete/${dto.hno }"><input type="button"
			value="삭제"></a>
 </div>
</body>
</html>



