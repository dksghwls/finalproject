<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
  <style>
    /* Add a gray background color and some padding to the footer */
    

    .inner img {
      width: 100%; /* Set width to 100% */
      min-height: 200px;
    }

    /* Hide the carousel text when the screen is less than 600 pixels wide */
    @media (max-width: 600px) {
      .carousel-caption {
        display: none; 
      }
    }
    .btn
    {
      width:100%;
    }
    .well
    {
      height:200px;
      
    
    }
    
    
  </style>
</head>
<body>



<div class="container">
<div class="row">
  <div class="col-sm-8">
  <div class="inner">
  <img src="https://placehold.it/800x400?text=IMAGE" alt="Image">
  </div>
    
  </div> 
  <div class="col-sm-4">
    <div class="well">
     <c:forEach var="item" items="${dto}">
     ${item.pno }
     ${item.pname }
      </c:forEach>
    </div>
    
     <c:forEach var="item" items="${dto}">
    <a href="../Payment/${item.pno }"><button type="button" class="btn btn-primary btn-md">결제</button></a>
      </c:forEach>
   
  </div>
  <div class="links">
  
  <!-- <img src="img/google.png">
  <img src="img/twitter.png"> -->
  </div>
  
  
  <div class="links">
  
  </div>
  
</div>
<hr>
</div>
<div class="container">
<div class="row">
  <div class="col-sm-12">

<ul class="nav nav-tabs" role="tablist" id="myTab">
      
      <li role="presentation"><a href="#detailpage" aria-controls="detailpage" role="tab" data-toggle="tab">상세페이지</a></li>
      <li role="presentation"><a href="#reviewpage" aria-controls="reviewpage" role="tab" data-toggle="tab">리뷰작성</a></li>
      
    </ul>

    <div class="tab-content">
      <div role="tabpanel" class="tab-pane active" id="detailpage"></div>
      <div role="tabpanel" class="tab-pane" id="reviewpage">
      
      <div class="drop">
  <div class="dropdown">
    <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">분류
    <span class="caret"></span></button>
    <ul class="dropdown-menu">
      <li><a href="#">컴퓨터</a></li>
      <li><a href="#">집가고 싶다</a></li>
      <li><a href="#">아무것도</a></li>
      <li><a href="#">하고 싶지 않음</a></li>      
    </ul>
  </div>

   </div>
  
   
    <div class="search">
      <input type="text" class="search" size="20" placeholder="Search" required> <button type="button" class="btn btn-danger">검색하기</button>  
    </div>
 

   <div class="row">
       <div class="col-xs-6"><textarea class="textarea" rows="5" id="textarea">리뷰작성</textarea></div>
   <div class="col-xs-6"><button class="reviewbtn">리뷰</button></div>
    </div>
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      </div>
      
    </div>
    </div>
    </div>
    </div>
</body>
</html>
