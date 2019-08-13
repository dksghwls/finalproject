<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<form action="updateresult" method="post" id="insertBoardFrm" enctype="multipart/form-data">
		카테고리번호:<input type="text" name="cno" id="cno"><br>
		상품이름:<input type="text" name="pname" id="pname"><br>
		원가:<input type="text" name="oprice" id="oprice"><br>
		할인가:<input type="text" name="dprice" id="dprice"><br>
		상품설명:<textarea name="content" id="content" style="width: 700px; height: 400px;"></textarea>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
        <input type="submit" id="insertBoard" value="등록" />
    </form>



</body>
</html>