<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	  <div id="myCarousel" class="carousel slide" data-ride="carousel">
	    <!-- Indicators -->
	    <ol class="carousel-indicators">
	      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
	      <li data-target="#myCarousel" data-slide-to="1"></li>
	      <li data-target="#myCarousel" data-slide-to="2"></li>
	    </ol>
	
	    <!-- Wrapper for slides -->
	    <div class="carousel-inner">
	
	      <div class="item active">
	        <img src="img/Jellyfish.jpg" alt="Los Angeles" style="width:100%; max-height: 500px !important;">
	        <div class="carousel-caption">
	          <h3>Los Angeles</h3>
	          <p>LA is always so much fun!</p>
	        </div>
	      </div>
	
	      <div class="item">
	        <img src="img/Penguins.jpg" alt="Chicago" style="width:100%; max-height: 500px !important;">
	        <div class="carousel-caption">
	          <h3>Chicago</h3>
	          <p>Thank you, Chicago!</p>
	        </div>
	      </div>
	    
	      <div class="item">
	        <img src="img/Tulips.jpg" alt="New York" style="width:100%; max-height: 500px !important;">
	        <div class="carousel-caption">
	          <h3>New York</h3>
	          <p>We love the Big Apple!</p>
	        </div>
	      </div>
	  
	    </div>
	
	    <!-- Left and right controls -->
	    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
	      <span class="glyphicon glyphicon-chevron-left"></span>
	      <span class="sr-only">Previous</span>
	    </a>
	    <a class="right carousel-control" href="#myCarousel" data-slide="next">
	      <span class="glyphicon glyphicon-chevron-right"></span>
	      <span class="sr-only">Next</span>
	    </a>
	  </div>

	<div class="container"> 
	 <div class="row">
	 <h1>최신 등록상품<a href="../AllCategory"><small>더보기</small></a></h1>
	 <c:forEach var="list" items="${ clist }">
	 	<div class="col-sm-6 col-md-3 ">
	      <div class="thumbnail">
	        <img src="${ list.imgname }">
	          <div class="caption">
	            <h3>${ list.pname }</h3>
	            <p><a href="../detail/${list.pno}" class="btn btn-primary" role="button">상품보기</a></p>
	        </div>
	      </div>
	    </div>
	 </c:forEach>
	 </div>  
	</div>
	
</body>
</html>