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


  <form action="/replyupdateresult2" method="POST">
    
      <label for="comment">Comment:</label>
      <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
      <textarea class="form-control" rows="5" id="comment">${dto.rcontent }</textarea>
      <input type="submit" class="btn btn-info" value="수정하기">
      <input type="reset" class="btn btn-info" value="취소하기">
    
  </form>



</body>
</html>
