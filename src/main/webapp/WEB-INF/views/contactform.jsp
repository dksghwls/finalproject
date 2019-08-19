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
	<form method="post" action="/contactok">

		<label for="no">회원번호</label> <input type="text" name="no" id="no"><br>
		<br> <label for="title">제목</label> <select name="htitle"
			id="title">
			<option value="계정문의">계정문의</option>
			<option value="개인정보">개인정보</option>
			<option value="할인문의">할인문의</option>
			<option value="기타문의">기타문의</option>
		</select><br> <br> <label for="content">내용</label>
		<textarea rows="30" cols="100" name="hcontent" id="content"
			required="required"></textarea>
		<br> <input type="hidden" name="${_csrf.parameterName }"
			value="${_csrf.token }" /> 
			
		<a href="contactfile"><input type="button" value="파일추가"></a>	
			
			<input type="submit" value="등록">
	</form>


</body>
</html>