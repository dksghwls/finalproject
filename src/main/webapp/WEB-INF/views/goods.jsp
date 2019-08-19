<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Bootstrap Example</title>
<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<style>
      .dropdown-item{
          font-size: 15px;
      }
      .nav-link { 
          font-size: 20px;
        }
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>

<div class="container">
      <!--<div class="row">
        <div class="col">-->
         <div class="alert alert-primary">
          <h2>Administrator Page</h2>
         </div>
            <ul class="nav nav-pills">
      
          <li data-tab="info" class="nav-item" id="default">
                <a class="nav-link active" href="../adminpage">회원 관리</a>
              </li>
              <li data-tab="product" class="nav-item">
                <a class="nav-link" href="../goods">상품 관리</a>
              </li>
              <!-- <li data-tab="product2" class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#">나의 취소 내역</a>
              </li> -->
              <li data-tab="product" class="nav-item">
                <a class="nav-link" href="../order">주문 관리</a>
              </li>

          </ul>
     </div>
          <br><br>
          
<div class="container">
  <p>페이지 교체 예정</p>
</div>
</body>
</html>