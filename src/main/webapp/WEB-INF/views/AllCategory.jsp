<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <style>
    /* Set height of the grid so .sidenav can be 100% (adjust if needed) */
    .row.content {height: 1500px}
    
    /* Set gray background color and 100% height */
    .sidenav {
      background-color: #f1f1f1;
      height: 100%;
    }
    
    /* Set black background color, white text and some padding */
    footer {
      background-color: #555;
      color: white;
      padding: 15px;
    }
    
    /* On small screens, set height to 'auto' for sidenav and grid */
    @media screen and (max-width: 767px) {
      .sidenav {
        height: auto;
        padding: 15px;
      }
      .row.content {height: auto;} 
    }
    .row
      {
          background-color: silver;
      }
     #imgbox img
      {
          margin: 10px;
          width: 350px;
      	  height: 350px;
      }
    
  </style>
</head>
<body>

<div class="container-fluid">
  <div class="row content">
    <div class="col-sm-3 sidenav">
     
      <ul class="nav nav-pills nav-stacked">
      <li class="active"><a href="#section1">All Category</a></li>
      	<c:forEach var="item" items="${list }">
      	
      	<li><a href="#section3"><c:out value="${item.cname }"></c:out></a></li>
      	</c:forEach>
        
<!--         <li><a href="#section2">Watch</a></li>
        <li><a href="#section3">Sport Equipment</a></li>
        <li><a href="#section3">Office Supplies</a></li>
        <li><a href="#section3">Accessory</a></li>
        <li><a href="#section3">Clothing goods</a></li>
        <li><a href="#section3">Health food</a></li> -->
      </ul><br>
    </div>
    <div class="col-sm-9" id="imgbox">
        <img src="img/Jellyfish.jpg" alt="a">
        <img src="img/Jellyfish.jpg" alt="a">
        <img src="img/Jellyfish.jpg" alt="a">
        <img src="img/Jellyfish.jpg" alt="a">
        <img src="img/Jellyfish.jpg" alt="a">
        <img src="img/Jellyfish.jpg" alt="a">
        <img src="img/Jellyfish.jpg" alt="a">
        <img src="img/Jellyfish.jpg" alt="a">
        <img src="img/Jellyfish.jpg" alt="a">
        <img src="img/Jellyfish.jpg" alt="a">
        <img src="img/Jellyfish.jpg" alt="a">
        <img src="img/Jellyfish.jpg" alt="a">
    </div>
  </div>
</div>
<a href="coding">상품 추가하기</a>
</body>
</html>