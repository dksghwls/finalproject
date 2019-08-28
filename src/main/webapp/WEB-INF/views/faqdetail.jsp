<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
 
	<div class="container"><br>
		<div class="panel panel-default">
			<div class="panel-heading">제목: ${dto.ftitle }</div>
			<div class="panel-body">내용: ${dto.fcontent }</div>
		</div>
			<a href=/faq><input type="button" class="btn btn-default" value="목록"></a> 
			<a href="/faqmodify/${dto.fno }"><input	type="button" class="btn btn-default" value="수정"></a>
			<input type="button" class="btn btn-default" data-toggle="modal" data-target="#myModal" value="삭제">
			<!-- Modal -->
			<div class="modal fade" id="myModal" role="dialog">
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
					<button type="button" class="btn btn-secondary"	data-dismiss="modal" onclick="location.href='/faqdelete/${dto.fno }'">예</button>
					<a href="/faqdetail/${dto.fno }">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">아니오</button></a>
				</div>
			</div>
		</div>
	</div>
</div>
 
</body>
</html>