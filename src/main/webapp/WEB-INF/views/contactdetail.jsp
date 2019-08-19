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

<div class="panel panel-default">
    <div class="panel-heading"> ${dto.htitle }</div>
    <div class="panel-body"> ${dto.hcontent }</div>
    
  </div>
 
	<a href=/contact><input type="button" value="목록"></a>
	<a href="/contactmodify/${dto.hno }"><input type="button"
		value="수정"></a>
	<a href="/contactdelete/${dto.hno }"><input type="button"
		value="삭제"></a>
</body>
</html>