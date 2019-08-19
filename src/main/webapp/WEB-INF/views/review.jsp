<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
   
     <!--href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">-->
  <style>
      .t{
          width: 300px;
      }
      td{
          padding-top: 30px;
          vertical-align: bottom;
      }
      .s{
          margin-left: 40px;
          margin-bottom: 0px;
      }
      .nav-link { 
          font-size: 20px;
        }
        .p{
        	font-weight: bold;
        }
  </style>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container">
      <!--<div class="row">
        <div class="col">-->
         <div class="alert alert-primary">
          <h2>My Page</h2>
         </div>
            <ul class="nav nav-pills">
      
          <li data-tab="info" class="nav-item" id="default">
                <a class="nav-link active" href="mypage">나의 정보</a>
              </li>
              <li data-tab="product" class="nav-item">
                <a class="nav-link" href="product">나의 주문 내역</a>
              </li>
              <!-- <li data-tab="product2" class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#">나의 취소 내역</a>
              </li> -->
              <li data-tab="product" class="nav-item">
                <a class="nav-link" data-toggle="tab" href="review">나의 리뷰</a>
              </li>

          </ul>
     </div>
          <br><br>
          
<!--<h2>마이 리뷰</h2>-->
<div class="container">
  <p>구매 상품 리뷰 모음입니다.</p>
  <br>
 
  <!--<ul>
    <li>-->
     <table>
        <tbody>
        <c:forEach var="item" items="${dlist }">
         <tr>
            <td class="t">
              <a href="#"><img src="img/Tulips.jpg" alt="Card image" class="img-rounded" style="width:100%"></a>
            </td>
            <td>
            	<div class="s">
            		<p class="p">${item.pname}</p><br>
        			<li><span>판매가: </span>${item.dprice}원</li>
        			<li><span>마감일: </span>${item.deadline}</li><br>
        			<p>${item.rcontent}</p><br>
                </div>
            </td>
            </tr>
            </c:forEach>
            
         </tbody>
    </table>
   </div>
</body>
</html>