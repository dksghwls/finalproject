<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
	  $("#btn").click(function(){
	    $("/detail.jsp").append(" <b>Appended text</b>.");
	  });
	  /* $("#btn2").click(function(){
	    $("ol").append("<li>Appended item</li>");
	  }); */
	});
  
  
  



</script>


</head>
<body>
<form action="/replyinsertresult" method="post">
		
		<label for="rcontent">�ۼ��� ����</label><input type="text" name="rcontent" id="rcontent">
		<input type="submit" value="���" id="btn">
	<input type="hidden" name="${_csrf.parameterName }"
				value="${_csrf.token }" />
	
	
	</form>







</body>
</html>