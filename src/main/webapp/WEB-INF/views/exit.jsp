<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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
${session.validate }
<div class="container">
  <div class="jumbotron">
    <h2>회원 탈퇴가 완료되었습니다.</h2>      
    <p>그동안 저희 사이트를 이용해주셔서 감사합니다.</p>
  </div>
  
  <center><button type="button" class="btn btn-primary" onclick="location.href='../home'">홈으로</button></center>
  
	<a href="#" onclick="document.getElementById('logout-form').submit();"><span class="glyphicon glyphicon-log-out"></span> 로그아웃</a>
	<form id="logout-form" action="/logout" method="POST">
		<input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
	</form>
          
</div>
</body>
</html>