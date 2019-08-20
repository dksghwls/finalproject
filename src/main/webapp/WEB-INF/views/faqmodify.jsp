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
	
	<form method="post" action="/faqmodifyok">
	
	
	<label for="fno">글번호</label>
	<input type="text" name="fno" id="fno" value="${dto.fno }" readonly="readonly"><br>
	<br>
	<label for="fcno">카테고리</label>
 	<select name="fcno" id="fcno" value="${dto.fcname }"> 
	<option value="1">1.배송</option>
	<option value="2">2.주문</option>
	<option value="3">3.회원</option>
	</select><br>
	<%-- <label for="fcname">카테고리번호</label>
	<input type="text" name="fcname" id="fcname" value="${dto.fcname }" readonly="readonly"><br> --%>
	<br>
	<label for="title">제목</label>
	<input type="text" name="ftitle" id="title" value="${dto.ftitle }"><br>
	<br>
	<label for="content">내용</label>
	<input type="text" name="fcontent" id="fcontent" value="${dto.fcontent }"><br>
	<br>
	<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
	<input type="submit" value="수정완료">
	<input type="reset" value="취소">
	 
	</form>
</body>
</html>