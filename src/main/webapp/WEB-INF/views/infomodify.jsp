<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap 4</title>
    <link rel="stylesheet"
        href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <!--href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">-->
    <style>
      .nav-link { 
          font-size: 20px;
        }
        p{
            font-weight: bold;
        }
    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
  <script>
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
   </script>
</head>
<body>
<c:set var="member" value="${ sessionScope.user }"></c:set>
<div class="container">
      <!--<div class="row">
        <div class="col">-->
         <div class="alert alert-primary">
          <h2>My Page</h2>
         </div>
            <ul class="nav nav-pills">
             <!--<li data-tab="tab1" class='nav-item' id="default"><a href="#">menu1</a></li>
    <li data-tab="tab2" class='nav-item'><a href="#">menu2</a></li>
      <li data-tab="tab3" class='nav-item'><a href="#">menu3</a></li>-->
      
      <li data-tab="info" class="nav-item" id="default">
                <a class="nav-link" href="../mypage/${member.no }">나의 정보</a>
              </li>
              <li data-tab="product" class="nav-item">
                <a class="nav-link" href="../product?no=${member.no }">나의 주문 내역</a>
              </li>
              <li data-tab="product2" class="nav-item">
                <a class="nav-link" href="../cancellist?no=${member.no }">나의 취소 내역</a>
              </li>
              <li data-tab="product" class="nav-item">
                <a class="nav-link" href="../review/${member.no }">나의 리뷰</a>
              </li>
          </ul>
          <br>
          
          <!--<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>-->

<div class="container">
  <h3>개인 정보 수정 페이지</h3>
  <!-- <p>닉네임, 비밀번호를 수정할 수 있습니다.</p> -->
  <br>
  
   <%-- <table class="table">
    <!--<thead>
      <tr>
        <th>Firstname</th>
        <th>Lastname</th>
        <th>Email</th>
      </tr>
    </thead>-->
    <tbody>
    <c:forEach var="item" items="${mlist }">
      <tr>
        <td class="a">Email</td>
        <td>${item.email }</td>
        <!--<td>mary@example.com</td>-->
      </tr>
      <tr>
        <td class="a">Nickname</td>
        <td><input type="nickname" name="nickname" maxlength="50" 
							value="${item.nickname }"></td>
        <td>${item.nickname }</td>
        <!--<td>john@example.com</td>-->
      </tr>
      
      <tr>
        <td class="a">Password</td>
        <td><input type="password" name="password" maxlength="50" 
							value="${item.pwd }"></td>
        <td>${item.pwd }</td>
        <!--<td>july@example.com</td>-->
      </tr>
      </c:forEach>
    </tbody>
  </table>
  <br>
  <button type="button" class="btn btn-info" onclick="location.href='modifyresult'">수정</button>
  <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#myModal">탈퇴</button> --%>
  
  <form action="../modifyresult" class="was-validated">
  <c:forEach var="item" items="${mlist }">
    <div class="form-group">
     <p>
         <span>이메일: </span>${item.email }
     </p>
    </div>
    <div class="form-group">
      <label for="nickname">닉네임</label>
      <input type="nickname" class="form-control" id="nickname" value="${item.nickname }" style="width: 700px;" name="nickname">
    </div>
    <div class="form-group">
      <label for="name">이름</label>
      <input type="name" class="form-control" id="name" value="${item.name }" style="width: 700px;" name="name">
    </div>
    <div class="form-group">
      <button type="button" id="sample4_postcode" onclick="sample4_execDaumPostcode()" class="btn btn-primary">우편번호 찾기</button>
   	</div>
   	<div class="form-group">
   		<label for="roadAddress">주소</label>
   		<input type="text" id="sample4_roadAddress" value="${item.addr }" class="form-control" style="width: 700px;" name="addr" readonly="readonly">
   	</div>
   	<div class="form-group">
		<label for="name">상세주소</label>
		<input type="text" id="sample4_detailAddress" value="${item.detailaddr }"  class="form-control" style="width: 700px;" name="detailaddr">
   	</div>
    <div class="form-group">
      <label for="phone">전화번호</label>
      <input type="phone" class="form-control" id="phone" value="${item.phone }" style="width: 700px;" name="phone">
    </div>
    <div class="form-group">
      <label for="cpwd">비밀번호</label>
      <input type="password" class="form-control" id="cpwd" placeholder="기존 또는 새 비밀번호를 입력하세요" style="width: 700px;" name="cpwd">
    </div>
     
     <input type="hidden" id="no" name="no" value="${item.no }"/>
     <button type="submit" class="btn btn-info">확인</button>
    <a href="../mypage/${item.no }" class="btn btn-danger">취소</a>
    </c:forEach>
    <!-- <button type="cancel" class="btn btn-danger" onclick="location.href='mypage'">취소</button> -->
  </form>
</div>

<!--</body>
</html>-->

  
          <!--<div id="tabcontent"></div>-->
      </div>
</body>
</html>