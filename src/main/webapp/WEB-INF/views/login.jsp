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
	  <form class="form-horizontal" action="/loginOK" method="post">
	    <div class="form-group">
	      <label class="control-label col-sm-2" for="email">Email:</label>
	      <div class="col-sm-8">
	        <input type="email" class="form-control" id="email" placeholder="Enter email" name="email">
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="control-label col-sm-2" for="pwd">Password:</label>
	      <div class="col-sm-8">          
	        <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="pwd">
	      </div>
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
	
</body>
</html>