<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.item {
		max-height: 400px;
    	overflow: hidden;
	}
	.item > img {
		max-height: initial;
    	margin-top: -15%;
	}
</style>
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
	        <img src="img/main1.jpg" alt="Los Angeles">
	        <div class="carousel-caption">
	          <h3>Los Angeles</h3>
	          <p>LA is always so much fun!</p>
	        </div>
	      </div>
	
	      <div class="item">
	        <img src="img/main2.jpg" alt="Chicago">
	        <div class="carousel-caption">
	          <h3>Chicago</h3>
	          <p>Thank you, Chicago!</p>
	        </div>
	      </div>
	    
	      <div class="item">
	        <img src="img/main3.jpg" alt="New York">
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
				<jsp:useBean id="toDay" class="java.util.Date" />
				<fmt:parseDate value="${ list.deadline }" pattern="yyyy-MM-dd" var="endDate" /> 
				<fmt:parseNumber value="${ toDay.time / (1000*60*60*24) }" integerOnly="true" var="nowDay"/>
				<fmt:parseNumber value="${ endDate.time / (1000*60*60*24) }" integerOnly="true" var="endDay"/>
				<c:if test="${ (endDay - nowDay + 1) == 0 }">
					오늘 마감
					<p><a href="../detail/${list.pno}" class="btn btn-primary" role="button">상품보기</a></p>
				</c:if>
				<c:if test="${ (endDay - nowDay + 1) > 0 }">
					${ endDay - nowDay + 1 }일 남았습니다
					<p><a href="../detail/${list.pno}" class="btn btn-primary" role="button">상품보기</a></p>
				</c:if>
				<c:if test="${ (endDay - nowDay + 1) < 0 }">
					마감
					<p><button class="btn btn-primary" role="button" disabled="disabled">상품보기</button></p>
				</c:if>
	        </div>
	      </div>
	    </div>
	 </c:forEach>
	 </div>  
	</div>
	
</body>
</html>