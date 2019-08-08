<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js"></script>
</head>
<body>
	
	<div class="container">
	  <h1>회원가입</h1>
	  <form class="form-horizontal" action="/joinOK" method="post">
	   <div class="form-group">
	      <label class="control-label col-sm-2" for="email">Nickname:</label>
	      <div class="col-sm-8">
	        <input type="text" class="form-control" id="nickname" placeholder="Enter nickname" name="nickname" value="">
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="control-label col-sm-2" for="email">Email:</label>
	      <div class="col-sm-8">
	        <input type="email" class="form-control" id="email" placeholder="Enter email" name="email" value="" disabled="disabled">
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
	  
		<div>
			<div class="col-sm-offset-5">
				<!-- 네이버 로그인 -->
				<div id="naverIdLogin"></div>​
			</div>	 
			<div class="col-sm-offset-5">
				<!-- 카카오 로그인 -->
				<a id="kakao-login-btn"></a>
			</div>
		</div>
	  
	</div>
	
	<script>
		//<![CDATA[
		// 사용할 앱의 JavaScript 키를 설정해 주세요.
		Kakao.init('239d9fcf21dfdb804a2da715064ad72d');
		   
		// 카카오 로그인 버튼을 생성합니다.
		Kakao.Auth.createLoginButton({
			container: '#kakao-login-btn',
			success: function(authObj) {
		     
				// 로그인 성공시, API를 호출합니다.
				Kakao.API.request({
					url: '/v1/user/me',
					success: function(res) {
						console.log(res);
			       				
						var userID = res.id;      //유저의 카카오톡 고유 id
						var userEmail = res.kaccount_email;   //유저의 이메일
						var userNickName = res.properties.nickname; //유저가 등록한 별명
						        
						$('input[name=nickname]').val(userNickName);
						$('input[name=email]').val(userEmail);
						        
						console.log(userID);
						console.log(userEmail);
						console.log(userNickName);
		      		},
		      		fail: function(error) {
		       			alert(JSON.stringify(error));
		      		}
		     	});
		    },
		    fail: function(err) {
		    	alert(JSON.stringify(err));
		    }
		});
		//]]>
	</script>
			
	<!-- NAVER API -->
	<script>
		var naverLogin = new naver.LoginWithNaverId({
			clientId: "g7fWXbg52ZMTQHwlTR1Z",
			callbackUrl: "http://localhost:8080/join",
			isPopup: false,
			callbackHandle: false,
			loginButton: {color: "green", type: 3, height: 48} /* 로그인 버튼의 타입을 지정 */
		});

		naverLogin.init();
				
		naverLogin.getLoginStatus(function (status) {
			if (status) {
				var email = naverLogin.user.getEmail();
				var name = naverLogin.user.getNickName();
				var profileImage = naverLogin.user.getProfileImage();
				var birthday = naverLogin.user.getBirthday();
				var uniqId = naverLogin.user.getId();
				var age = naverLogin.user.getAge();
						
				console.log(email);
				console.log(name);
				
				$('input[name=nickname]').val(name);
				$('input[name=email]').val(email);
			}
		});
		
		naverLogin.logout(); 
	</script>

</body>
</html>