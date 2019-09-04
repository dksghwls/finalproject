<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <style>
      .jumbotron{
          text-align: center;
      }
      /*.btn btn-primary{
          margin:auto;
      }*/
  </style>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>
<c:set var="member" value="${ sessionScope.user }"></c:set>
<div class="container">
  <div class="jumbotron">
    <h2>주문 취소가 완료되었습니다.</h2>      
    <!-- <p>그동안 저희 사이트를 이용해주셔서 감사합니다.</p> -->
  </div>
	<center><button type="button" class="btn btn-primary" onclick="location.href='../cancellist?no=${member.no}'">나의 취소 내역으로</button></center> 
</div>
</body>
</html>