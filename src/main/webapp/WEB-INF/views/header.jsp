<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<c:set var="member" value="${ sessionScope.user }"></c:set>
	
	<nav class="navbar navbar-inverse">
	  <div class="container-fluid">
	    <div class="navbar-header">
	      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>                        
	      </button>
	      <a class="navbar-brand" href="/"><img alt="a" src="../img/facebook_cover_photo_1.png" style="width: 90px;" ></a>
	    </div>
	    <div class="collapse navbar-collapse" id="myNavbar">
	      <ul class="nav navbar-nav">
	        <li><a href="../AllCategory">상품</a></li>
	        <li><a href="../helpcenter">고객센터</a></li>
	        <sec:authorize access="hasRole('ROLE_ADMIN')">
				<li><a href="../adminpage">관리자 페이지</a></li>
			</sec:authorize>
	      </ul>
	      
	    <ul class="nav navbar-nav navbar-right">  
	    <sec:authorize access="isAnonymous()">
		    <li><a href="../join"><span class="glyphicon glyphicon-user"></span> 회원가입</a></li>
			<li><a href="../login"><span class="glyphicon glyphicon-log-in"></span> 로그인</a></li>
		</sec:authorize>
	    <sec:authorize access="isAuthenticated()">
	    	<li>
		    	<a href="../mypage/${ member.no }"><span class="glyphicon glyphicon-user"></span>
		    		<c:if test="${ member != null }">
						<c:out value="${ member.nickname }님"></c:out>
					</c:if>
				</a>
			</li>
			<li><a href="#" onclick="document.getElementById('logout-form').submit();"><span class="glyphicon glyphicon-log-out"></span> 로그아웃</a></li>
			<form id="logout-form" action='<c:url value='/logout'/>' method="POST">
			   <input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
			</form>
		</sec:authorize>
	    </ul>
	    </div>
	  </div>
	</nav>
</body>
</html>