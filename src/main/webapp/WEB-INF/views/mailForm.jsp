<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form"  uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>

	<div class="container">
	  <h1>임시 비밀번호</h1>
	  <form action="${pageContext.request.contextPath}/mailSending" method="post" id="frm" name="frm" class="form-horizontal">
	  	<div class="form-group">
	      <label class="control-label col-sm-2" for="email">Email:</label>
	      <div class="col-sm-8">
	        <input type="text" class="form-control" id="email" placeholder="Enter email" name="tomail">
	      </div>
	    </div>
	    <div align="center">
	      <div id="result"></div>
	    </div>
	    <div class="form-group">
		    <div align="center">
		    	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				<input type="button" class="btn btn-success" id="btn" value="Submit">
		    </div>
	    </div>
	  </form>
	</div>
	
	<script type="text/javascript">
		document.getElementById('btn').onclick = function() {
			
			var email = document.frm.tomail.value; // 이메일
			console.log(email);
			var pattern = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
		        
				if(email.length == 0) {
					$('#result').text("이메일을 입력해주세요.");
					frm.tomail.focus();
					return false;
				}
				
				if(!pattern.test(email)){
					$('#result').text("이메일 형식에 맞게 입력해주세요.");
					frm.tomail.focus();
					return false;
				}
				
				$.ajax({
			        url : "/userCheck",
			        data : {"email" : email},
			        success : function (data) {
			            if (data) {
			            	document.getElementById('frm').submit();
			            	console.log(data);
			            } else {
			            	$('#result').text('가입하지 않은 이메일입니다.');
			            	console.log(data);
			            }             
			        }
			    });
			
	        return false;
	    };
	</script>

</body>
</html> 