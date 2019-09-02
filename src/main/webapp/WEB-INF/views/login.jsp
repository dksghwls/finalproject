<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<div class="container">
	  <h1>로그인</h1>
	  <form class="form-horizontal" action="/loginOK" method="post" onsubmit="return submitCheck()" name="frm">
	    <div class="form-group">
	      <label class="control-label col-sm-2" for="email">Email:</label>
	      <div class="col-sm-8">
	        <input type="text" class="form-control" id="email" placeholder="Enter email" name="email">
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="control-label col-sm-2" for="pwd">Password:</label>
	      <div class="col-sm-8">          
	        <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="pwd">
	      </div>
	    </div>
	    <div class="col-sm-offset-5 col-sm-6">
	        <div id="result"></div>
	    </div>
	    <div class="form-group">
	    	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	    </div>
	    <div class="form-group">
	      <div class="col-sm-offset-5 col-sm-1">
	        <button type="reset" class="btn btn-danger">Reset</button>
	      </div>
	      <div class="col-sm-1">
	        <button type="submit" class="btn btn-success">Submit</button>
	      </div>
	    </div>
	  </form>
	</div>
	
	<script>
		var pw_passed = true;  // 추후 벨리데이션 처리시에 해당 인자값 확인을 위해
	
	    function submitCheck() {
	    	var email = document.frm.email.value; // 이메일
			var pw = document.frm.pwd.value; //비밀번호
	        
	        pw_passed = true;
	
	        var pattern = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
	        
			if(email.length == 0) {
				$('#result').text("이메일을 입력해주세요.");
				frm.email.focus();
				return false;
			}
			
			if(!pattern.test(email)){
				$('#result').text("이메일 형식에 맞게 입력해주세요.");
				frm.email.focus();
				return false;
			}
	        
			if(pw.length == 0) {
				$('#result').text("비밀번호를 입력해주세요.");
				frm.pwd.focus();
				return false;
			}
			
			return true;
		}
	</script>
	
</body>
</html>