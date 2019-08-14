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
	
	<form action="/updateresult" method="post">
	
		<input type="hidden" name="pno" id="pno" value="${dto.pno }">
		상품이름:<input type="text" name="pname" id="pname" value="${dto.pname}" ><br>
		원가:<input type="text" name="oprice" id="oprice" value="${dto.oprice}" ><br>
		할인가:<input type="text" name="dprice" id="dprice" value="${dto.dprice }"><br>
		상품설명:<textarea name="content" id="content" style="width: 700px; height: 400px;"></textarea>

		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
        <input type="submit"  value="등록" />
    </form>



</body>
</html>