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
		<c:set var="member" value="${ sessionScope.user }"></c:set>
		<form method="post" action="/contactok" id="contactform">
   		<input type="hidden" name="no" value="${member.no }"> 
   		<label for="focusedInput">회원명</label>
   		<input type="text" name="nickname" class="form-control" id="focusedInput" 
   		  value="${member.nickname }"	style="width: 15%;" readonly="readonly"><br> 
		<label for="htitle">제목</label> 
		<textarea class="form-control" rows="1" id="htitle" name="htitle"
				style="width: 27%;" required="required"></textarea><br>
		 <br>
	<div class="input-group">
		<span class="input-group-addon">
		<i	class="glyphicon glyphicon-user"></i>
		</span>
		<input id="email" type="text" class="form-control" name="email" placeholder="Email" 
		  value="${member.email }" style="width: 25%;" readonly="readonly">
	</div><br>
		<label for="hcontent">내용</label>
		<textarea class="form-control" rows="5" id="hcontent" name="hcontent"
				style="width: 48%;" required="required"></textarea><br>
		 <input type="hidden" name="${_csrf.parameterName }"value="${_csrf.token }" /> 
		 <input type="submit" class="btn btn-default" id="contactinsert" value="등록">
		</form>
	</div>

</body>
</html>