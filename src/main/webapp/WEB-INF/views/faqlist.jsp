<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
	<style>
	*, *:before, *:after {
		-webkit-box-sizing: border-box;
		-moz-box-sizing: border-box;
		box-sizing: border-box;
	}
	
	#integration-list {
		font-family: 'Open Sans', sans-serif;
		width: 80%;
		margin: 0 auto;
		display: table;
	}
	
	#integration-list ul {
		padding: 0;
		margin: 20px 0;
		color: #555;
	}
	
	#integration-list ul>li {
		list-style: none;
		border-top: 1px solid #ddd;
		display: block;
		padding: 15px;
		overflow: hidden;
	}
	
	#integration-list ul:last-child {
		border-bottom: 1px solid #ddd;
	}
	
	#integration-list ul>li:hover {
		background: #EFF5FB;
	}
	
	#insertbtn:hover{
		background: #EFF5FB;
	}
	.expand {
		display: block;
		text-decoration: none;
		color: #555;
		cursor: pointer;
	}
	
	h2 {
		padding: 0;
		margin: 0;
		font-size: 17px;
		font-weight: 400;
	}
	
	span {
		font-size: 12.5px;
	}
	
	#left, #right {
		display: table;
	}
	
	#sup {
		display: table-cell;
		vertical-align: middle;
		width: 80%;
	}
	
	.detail a {
		text-decoration: none;
		color: #C0392B;
		border: 1px solid #C0392B;
		padding: 6px 10px 5px;
		font-size: 14px;
	}
	
	.detail {
		margin: 10px 0 10px 0px;
		display: none;
		line-height: 22px;
		height: 150px;
	}
	
	.detail span {
		margin: 0;
	}
	
	.right-arrow {
		margin-top: 12px;
		margin-left: 20px;
		width: 10px;
		height: 100%;
		float: right;
		font-weight: bold;
		font-size: 20px;
	}
</style>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script>
	$(function() {
		$(".expand").on("click", function() {
			$(this).next().slideToggle(200);
			$expand = $(this).find(">:first-child");

			if ($expand.text() == "+") {
				$expand.text("-");
			} else {
				$expand.text("+");
			}
		});
	});
</script>
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<h2>
		<a href="/helpcenter" data-toggle="tooltip" title="HelpCenter!">FAQ</a>
		<sec:authorize access="hasRole('ROLE_ADMIN')">
		<a href="faqinsert">
		<input type="button" class="btn btn-default" id="insertbtn" value="글쓰기"></a>
		</sec:authorize>
		</h2>
		<br>
		<ul class="nav nav-pills">
			<li class="active"><a data-toggle="pill" onclick="location.href='/faq'">전체</a></li>
			<li><a data-toggle="pill" href="#menu1">배송</a></li>
			<li><a data-toggle="pill" href="#menu2">주문</a></li>
			<li><a data-toggle="pill" href="#menu3">회원</a></li>
		</ul>
		<div class="tab-content">
			<div id="home" class="tab-pane fade in active">
				<table class="table table-hover">
				<!-- 아코디언 효과 -->
				<tbody>
				<div id="integration-list">
					<ul>
						<c:forEach var="i" items="${list }">
						<li>
						<sec:authorize access="hasRole('ROLE_ADMIN')">
						<a href="/faqdetail/${i.fno }">
						</sec:authorize>
						 <c:out	value="${i.fno } "></c:out></a> 
						 <c:out value="${i.fcname }"></c:out>
						<a class="expand"><div class="right-arrow">+</div>
					<div>
						<h4>
						<c:out value="${i.ftitle }"></c:out>
						</h4>
					</div></a>
					<div class="detail">
					<div id="left" style="width: 15%; float: left; height: 50%;">
						<div id="sup"></div>
					</div>
						<div id="right"	style="width: 85%; float: right; height: 50%; padding-left: 20px;">
						<div id="sup">
						<div>
							<span>${i.fcontent }</span>
						</div>
						</div>
						</div>
						</div></li>
							</c:forEach>
						</ul>
						</div>
					</tbody>
				</table>
				<br>
				<!-- 검색 -->
			<form method="get" action="faq?currPage=${page.startBlock }">
				<select name="search" class="form-control" id="sel1" style="width: 15%;">
					<option value="ftitle" <c:if test="${search eq 'ftitle'}"> selected</c:if>>제목</option>
 					<option value="fcontent" <c:if test="${search eq 'fcontent'}"> selected</c:if>>내용</option>
 					<option value="all" <c:if test="${search eq 'all'}"> selected</c:if>>제목+내용</option>
				</select>
					<div class="input-group">
						<input type="text" class="form-control" placeholder="검색어를 입력하세요"
						name="keyword" style="width: 308px;">
						<button class="btn btn-default" type="submit">
						<i class="glyphicon glyphicon-search"></i></button>
					</div>
			</form>	<br>
				<!-- block 처리 -->
				<ul class="pager">
					<li><c:if test="${page.prev }">
							<a href="faq?currPage=${page.startBlock-1 }&search=${search}&keyword=${keyword}">
							<c:out value="이전"></c:out></a>
						</c:if></li>
					<c:forEach var="i" begin="${page.startBlock }" end="${page.endBlock }">
						<li><c:choose>
								<c:when test="${i }==${page.currPage }">
									<c:out value="${i }"></c:out>
								</c:when>
								<c:otherwise>
							<a href="faq?currPage=${i }&search=${search}&keyword=${keyword}">
							<c:out value="${i}"></c:out></a>
								</c:otherwise>
							</c:choose></li>
					</c:forEach>
					<li><c:if test="${page.next }">
						<a href="faq?currPage=${page.endBlock+1 }&search=${search}&keyword=${keyword}">
						<c:out value="다음"></c:out></a>
						</c:if></li>
				</ul>
			</div>
	<div id="menu1" class="tab-pane fade">
		<table class="table table-hover">
		<!-- 아코디언 효과 -->
			<tbody>
				<div id="integration-list">
				<ul>
					<c:forEach var="i" items="${shiplist }">
					<c:if test="${i.fcno ==1 }">
				<li>
					<sec:authorize access="hasRole('ROLE_ADMIN')">
						<a href="/faqdetail/${i.fno }">
					</sec:authorize>
					<c:out value="${i.fno } "></c:out></a> 
					<c:out value="${i.fcname }"></c:out>
					<a class="expand"><div class="right-arrow">+</div>
				<div>		
					<h4><c:out value="${i.ftitle }"></c:out></h4>
				</div>
				</a>
		     	<div class="detail">
					<div id="left" style="width: 15%; float: left; height: 50%;">
			 			<div id="sup"></div>
					</div>
				<div id="right"	style="width: 85%; float: right; height: 50%; padding-left: 20px;">
					<div id="sup">
						<div>
							<span>${i.fcontent }</span>
						</div>
					</div>
				</div>
			</div>
				</c:if>
				</c:forEach>
				</li>
				</ul>
				</div>
				</table>
			</div>
	<div id="menu2" class="tab-pane fade">
		<table class="table table-hover">
		<!-- 아코디언 효과 -->
			<tbody>
				<div id="integration-list">
				<ul>
					<c:forEach var="i" items="${orderlist }">
						<c:if test="${i.fcno ==2 }">
						<li>
						<sec:authorize access="hasRole('ROLE_ADMIN')">
						<a href="/faqdetail/${i.fno }">
						</sec:authorize>
						<c:out	value="${i.fno } "></c:out></a> 
						<c:out value="${i.fcname }"></c:out>
						<a class="expand">
					<div class="right-arrow">+</div>
					<div>
						<h4><c:out value="${i.ftitle }"></c:out></h4>
					</div>
					</a>
	<div class="detail">
		<div id="left" style="width: 15%; float: left; height: 50%;">
		<div id="sup"></div>
	</div>
	<div id="right" style="width: 85%; float: right; height: 50%; padding-left: 20px;">
	<div id="sup">
		<div>
		<span>${i.fcontent }</span>
			</div>
			</div>
			</div>
		</div>
		</c:if>
		</c:forEach>
			</li>
		</ul>
		</div>
	</table>
	</div>
	<div id="menu3" class="tab-pane fade">
	<table class="table table-hover">
	<!-- 아코디언 효과 -->
	<tbody>
	<div id="integration-list">
		<ul>
		<c:forEach var="i" items="${cuslist }">
			<c:if test="${i.fcno ==3 }">
			<li>
			<sec:authorize access="hasRole('ROLE_ADMIN')">
			<a href="/faqdetail/${i.fno }">
			</sec:authorize>
			<c:out	value="${i.fno } "></c:out></a> 
			<c:out value="${i.fcname }"></c:out>
			<a class="expand">
			<div class="right-arrow">+</div>
			<div>
			<h4><c:out value="${i.ftitle }"></c:out></h4>
			</div>
		</a>
			<div class="detail">
				<div id="left" style="width: 15%; float: left; height: 50%;">
				<div id="sup"></div>
				</div>
					<div id="right" style="width: 85%; float: right; height: 50%; padding-left: 20px;">
					<div id="sup">
						<div><span>${i.fcontent }</span></div>
				</div>
			</div>
			</div>
		</c:if>
		</c:forEach>
		</li>
		</ul>
		</div>
		</table>
		</div>
		</div>
	</div>
</body>
</html>