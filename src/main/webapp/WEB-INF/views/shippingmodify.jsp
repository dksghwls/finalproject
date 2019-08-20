<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <style>
      .nav-link { 
          font-size: 20px;
        }
    </style>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
      <!--<div class="row">
        <div class="col">-->
         <div class="alert alert-primary">
          <h2>Administrator Page</h2>
         </div>
            <ul class="nav nav-pills">
      
          <li data-tab="member" class="nav-item" id="default">
                <a class="nav-link active" href="../adminpage">회원 관리</a>
              </li>
              <li data-tab="goods" class="nav-item">
                <a class="nav-link" href="../goods">상품 관리</a>
              </li>
              <li data-tab="order" class="nav-item">
                <a class="nav-link" href="../order">주문 관리</a>
              </li>
          </ul>
</div>
          
<div class="container">
  <h2>배송 상태 수정</h2><br>
  <!-- <p>배송 상태를 선택하십시오.</p> -->
  <form action="../smodifyresult">
    <div class="form-group">
      <!--<label for="sel1">Select list (select one):</label>-->
      <select class="form-control" name="shipping" id="sel1" style="width: 300px;">
        <option value="배송 준비">배송 준비</option>
        <option value="배송 중">배송 중</option>
        <option value="배송 완료">배송 완료</option>
      </select>
    </div>
    <button type="submit" class="btn btn-info" name="bno" value="${bno }">수정</button>
  	<a href="../order" class="btn btn-danger">취소</a>
  </form>
  
</div>
</body>
</html>