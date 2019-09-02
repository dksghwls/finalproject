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
	  <form class="form-horizontal" action="/joinOK" method="post" onsubmit="return submitCheck()" name="frm">
	   <div class="form-group">
	      <label class="control-label col-sm-2" for="email">Nickname:</label>
	      <div class="col-sm-8">
	        <input type="text" class="form-control" id="nickname" placeholder="Enter nickname" name="nickname" value="" maxlength="10">
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="control-label col-sm-2" for="email">Email:</label>
	      <div class="col-sm-8">
	        <input type="email" class="form-control" id="email" placeholder="Enter email" name="email" value="" readonly="readonly">
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="control-label col-sm-2" for="pwd">Password:</label>
	      <div class="col-sm-8">          
	        <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="pwd" maxlength="20">
	      </div>
	    </div>
	    <!-- 로그인 실패 메시지 -->
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
	        <button type="submit" class="btn btn-success" id="submit" >Submit</button>
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
						
						$.ajax({
					        url : "/userCheck",
					        // 사용자가 입력하여 id로 넘어온 값을 서버로 보냅니다.
					        data : {"email" : userEmail},
					        // 성공적으로 값을 서버로 보냈을 경우 처리하는 코드입니다.
					        success : function (data) {
					            // 서버에서 Return된 값으로 중복 여부를 사용자에게 알려줍니다.
					            if (data) {
					            	$('#result').text('사용할 수 없는 아이디 입니다.');
					            	$("#submit").attr("disabled", "disabled");
					            } else {
					            	$('#result').text('사용할 수 있는 아이디 입니다.');
					            	$("#submit").removeAttr("disabled");
					            }
					        }
					    });
						
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
				
				
				$.ajax({
			        url : "/userCheck",
			        data : {"email" : email},
			        success : function (data) {
			            if (data) {
			            	$('#result').text('사용할 수 없는 아이디 입니다.');
			            	$("#submit").attr("disabled", "disabled");
			            } else {
			            	$('#result').text('사용할 수 있는 아이디 입니다.');
			            	$("#submit").removeAttr("disabled");
			            }             
			        }
			    });
				
			}
		});
		
		naverLogin.logout(); 
	</script>

	<script>
		var pw_passed = true;  // 추후 벨리데이션 처리시에 해당 인자값 확인을 위해
	
	    function submitCheck() {
			var nickname = document.frm.nickname.value; // 닉네임
	    	var email = document.frm.email.value; // 이메일
			var pw = document.frm.pwd.value; //비밀번호
	        
	        pw_passed = true;
	
	        var pattern1 = /[0-9]/;
	        var pattern2 = /[a-zA-Z]/;
	        var pattern3 = /[~!@\#$%<>^&*]/; // 원하는 특수문자 추가 제거
	        
			if(email.length == 0) {
				$('#result').text("이메일을 입력해주세요.");
				return false;
			}
			
			if(nickname.length == 0) {
				$('#result').text("닉네임을 입력해주세요.");
				frm.nickname.focus();
				return false;
			}
			
			if(nickname.length < 2) {
				$('#result').text("닉네임을 2글자 이상 입력해주세요.");
				frm.nickname.focus();
				return false;
			}
	        
			if(pw.length == 0) {
				$('#result').text("비밀번호를 입력해주세요.");
				frm.pwd.focus();
				return false;
			}
	
			if(!pattern1.test(pw)||!pattern2.test(pw)||!pattern3.test(pw)||pw.length<6){
				$('#result').text("영문+숫자+특수문자 6자리 이상으로 구성하여야 합니다.");
				frm.pwd.focus();
				return false;
			}
			
			if(pw.indexOf(nickname) > -1) {
				$('#result').text("비밀번호는 닉네임을 포함할 수 없습니다.");
				frm.pwd.focus();
				return false;
			}
	
			var SamePass_0 = 0; //동일문자 카운트
			var SamePass_1 = 0; //연속성(+) 카운드
			var SamePass_2 = 0; //연속성(-) 카운드
	
			for(var i=0; i < pw.length; i++) {
				var chr_pass_0;
				var chr_pass_1;
				var chr_pass_2;
	
				if(i >= 2) {
					chr_pass_0 = pw.charCodeAt(i-2);
	                chr_pass_1 = pw.charCodeAt(i-1);
	                chr_pass_2 = pw.charCodeAt(i);
	                 
	                //동일문자 카운트
	                if((chr_pass_0 == chr_pass_1) && (chr_pass_1 == chr_pass_2)) {
						SamePass_0++;
					} else {
						SamePass_0 = 0;
					}
	
					//연속성(+) 카운드
					if(chr_pass_0 - chr_pass_1 == 1 && chr_pass_1 - chr_pass_2 == 1) {
						SamePass_1++;
					} else {
						SamePass_1 = 0;
	 				}
	
					//연속성(-) 카운드
					if(chr_pass_0 - chr_pass_1 == -1 && chr_pass_1 - chr_pass_2 == -1) {
						SamePass_2++;
					} else {
						SamePass_2 = 0;
					}  
				}     
	
				if(SamePass_0 > 0) {
					$('#result').text("동일문자를 3자 이상 연속 입력할 수 없습니다.");
					frm.pwd.focus();
					pw_passed=false;
				}
	
	            if(SamePass_1 > 0 || SamePass_2 > 0 ) {
	            	$('#result').text("영문, 숫자는 3자 이상 연속 입력할 수 없습니다.");
	            	frm.pwd.focus();
					pw_passed=false;
				} 
	
				if(!pw_passed) {             
					return false;
	                break;
	            }
			}
			return true;
		}
	</script>

</body>
</html>