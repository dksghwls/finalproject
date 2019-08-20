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
              <!-- <li data-tab="product2" class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#">나의 취소 내역</a>
              </li> -->
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
      <input type="nickname" class="form-control" id="nickname" value="${item.nickname }" name="nickname">
    </div>
    <div class="form-group">
      <label for="name">이름</label>
      <input type="name" class="form-control" id="name" value="${item.name }" name="name">
    </div>
    <div class="form-group">
      <label for="addr">주소</label>
      <input type="addr" class="form-control" id="addr" value="${item.addr }" name="addr">
    </div>
    <div class="form-group">
      <label for="detailaddr">상세주소</label>
      <input type="detailaddr" class="form-control" id="detailaddr" value="${item.detailaddr }" name="detailaddr">
    </div>
    <div class="form-group">
      <label for="phone">전화번호</label>
      <input type="phone" class="form-control" id="phone" value="${item.phone }" name="phone">
    </div>
     <div class="form-group">
      <label for="cpwd">비밀번호</label>
      <input type="cpwd" class="form-control" id="cpwd" value="" name="cpwd" placeholder="새 비밀번호를 입력하세요">
    </div>
    <!-- <div class="form-group form-check">
      <label class="form-check-label">
        <input class="form-check-input" type="checkbox" name="remember" required> 위 정보를 수정하겠습니다.
        <div class="valid-feedback">Valid.</div>
        <div class="invalid-feedback">Check this checkbox to continue.</div>
      </label>
    </div> -->
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