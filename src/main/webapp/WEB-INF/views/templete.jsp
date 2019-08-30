<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style>
	textarea {
		resize: none;
	}
	
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
    }
    
    footer {
      background-color: #333333;
      padding: 25px;
    }
    
    footer > p {
		color: #9D9D9D;
		margin: 0px;
	}
</style>
</head>
<body>

	<jsp:include page="header.jsp"></jsp:include>
	<c:set var="page" value="${ param.page }"></c:set>
	<c:if test="${ page!=null }">
		<jsp:include page="${ page }"></jsp:include>
	</c:if>
	<c:if test="${ page==null }">
		
	</c:if>
	<jsp:include page="footer.jsp"></jsp:include>
	
</body>
</html>