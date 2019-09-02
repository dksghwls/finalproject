<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body> 

<div class="container">
  <h2>작성자</h2>
  <div class="well">회원번호:${dto.no }</div>
  ${dto.rcontent }
  
  ${ dto.rno}
</div>
<div class="container">
  <h2>작성자</h2>
  <div class="well">${dto.rcontent }</div>
</div>
<a href="/replyupdate2/${dto.rno }" class="btn btn-info" role="button">수정하기</a>
<a href="/detail/${dto.rno}" class="btn btn-info" role="button">돌아가기</a>


</body>
</html>
