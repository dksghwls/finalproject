<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
          background-color: white;
      }
     #imgbox img
      {
          margin: 10px;
          width: 300px;
      	  height: 300px;
      	  position: relative;
          left: 150px;
      }
     #sidemenu
      {
          width: 300px;
      }
      #imgbox
      {
          width: 80%;
      }
      p
      {
      	margin: 10px;
      	position: relative;
        left: 160px;
      }
  </style>
</head>
<body>

<div class="container-fluid">
  <div class="row content">
    <div class="col-sm-3 sidenav" id="sidemenu">
     
      <ul class="nav nav-pills nav-stacked">
      <li class="active"><a href="../AllCategory">All Category</a></li>
      	<c:forEach var="item" items="${list }">
      	<li><a href="../CategoryDetail/${item.cno }">${item.cname }</a></li>
      	</c:forEach>
        
      </ul><br>
    </div>
    <div class="col-sm-9" id="imgbox">
      <c:forEach var="dto" items="${dto }">
        <img src="../img/Jellyfish.jpg" alt="a"><br>
        <p>상품이름:<c:out value="${dto.pname }"></c:out></p>
        <p>할인가:<c:out value="${dto.dprice }"></c:out></p>
        <p>원가:<c:out value="${dto.oprice }"></c:out></p><br>
         
      </c:forEach> 
        
    </div>
  </div>
</div>
<a href="coding">상품 추가하기</a>
</body>
</html>