<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<style>
	.container>.panel-default>.panel-heading {
    background-color: #EFF5FB;
    }
    
</style>
<head>
<meta charset="utf-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<br>
	<div class="container">
		<div class="panel panel-default">
			<%-- <div class="panel-heading">회원번호: ${dto.no }</div> --%>
			<div class="panel-heading"><h4>제목: ${dto.htitle }</h4></div>
			<div class="panel-body"><h4>내용: ${dto.hcontent }</h4></div>
		</div>
		<a href=/contact><input type="button" class="btn btn-default" value="목록"></a>
		<input type="button" class="btn btn-default" data-toggle="modal" data-target="#myModal" value="수정">
		<!-- Modal -->
		<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">
		<!-- Modal content-->
		<div class="modal-content">
		    <div class="modal-header">
		    <button type="button" class="close" data-dismiss="modal">&times;</button>
		    <h4 class="modal-title">문의글을 수정하세요.</h4>
		    </div>
		<div class="modal-body">
			 <jsp:include page="contactmodify.jsp"></jsp:include>
		</div>
		<div class="modal-footer">
		   <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		</div>
		</div>
		</div>
		</div>
	
	<input type="button" class="btn btn-default" data-toggle="modal" 
	       data-target="#myModal2" value="삭제">
	       </div>
	<!-- Modal -->
	<div class="modal fade" id="myModal2" role="dialog">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">글삭제</h4>
				</div>
				<div class="modal-body">
				  <p>삭제하시겠습니까?</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"	data-dismiss="modal"
						onclick="location.href='/contactdelete/${dto.hno }'">예</button>
					<a href="/contactdetail/${dto.hno }"><button type="button"
							class="btn btn-secondary" data-dismiss="modal">아니오</button></a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
