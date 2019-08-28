<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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
	
	#insertbtn:hover {
		background: #EFF5FB;
	}
	
	.expand {
		display: block;
		text-decoration: none;
		color: #555;
		cursor: pointer;
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
	
	.right-arrow {
		margin-top: 0px;
		margin-left: 0px;
		width: 10px;
		height: 100%;
		float: right;
		font-weight: bold;
		font-size: 20px;
	}
</style>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	$(document).on("click", "#rebtn", function() {
		var hno = $(this).data('no');
		$.ajax({
			url : '/recontentmodify/' + hno,
			success : function(data) {
			$('#myModal2 .modal-body').empty().append(data);
			}
		});
	});
</script>
</head>
<body>
	<div class="container">
		<h2>Search</h2>
		<input class="form-control" id="myInput" type="text" placeholder="검색어를 입력하세요">
	 <table class="table table-hover">
		<thead>
			<tr>
		  		<th>답변</th>
				<th>글번호</th>
				<th>회원명</th>
				<th>글제목</th>
				<th>작성일</th>
				<th></th>
			</tr>
		</thead>
		<tbody id="myTable">
		 	<c:forEach var="i" items="${dto }">
				<tr>
			  		<td><span class="glyphicon glyphicon-plus plusIcon"></span>
					<span class="glyphicon glyphicon-minus plusIcon"
								style="display: none"></span>
					<td><a href="/contactdetail/${i.hno }"> 
					<c:out value="${i.hno } "></c:out></a></td>
					<td><c:out value="${i.nickname }"></c:out></td>
					<td><a href="/contactdetail/${i.hno }">
					<c:out value="${i.htitle }"></c:out></a></td>
					<td><c:out value="${i.hdate }"></c:out></td>
					
			<!-- 관리자 로그인 시 나타나게 하기!! -->
				<sec:authorize access="hasRole('ROLE_ADMIN')">
					<td>
					  <input type="button" class="btn btn-default" id="rebtn" data-toggle="modal"
						   data-no="${i.hno}" data-target="#myModal2" value="답변작성">
				</sec:authorize>
									
	 		<!-- Modal -->
		 		 <div class="modal fade" id="myModal2" role="dialog">
					<div class="modal-dialog">
					  <div class="modal-content">
						<div class="modal-header">
				    	 	<button type="button" class="close" data-dismiss="modal">&times;</button>
						    <h4 class="modal-title">문의글 답변하기</h4>
					    </div>
			   		  <div class="modal-body"></div>
					<div class="modal-footer">
				  <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>						
		</tr>
			<tr style="display: none">
			 <td colspan="7">답변: <c:out value="${i.recontent }"></c:out></td>
			</tr>
		</c:forEach>
	</tbody>

</table>
 <br>
		<!-- block 처리 -->
		<ul class="pager">
			<li><c:if test="${page.prev }">
					<a href="contact?currPage=${page.startBlock-1 } ">
					<c:out value="이전"></c:out></a></c:if></li>
			<c:forEach var="i" begin="${page.startBlock }"
				end="${page.endBlock }">
		<li><c:choose>
				<c:when test="${i }==${page.currPage }">
					<c:out value="${i }"></c:out>
				</c:when>
			<c:otherwise>
				<a href="contact?currPage=${i } "> <c:out value="${i}"></c:out></a>
			</c:otherwise>
			</c:choose></li>
			</c:forEach>
		<li><c:if test="${page.next }"><a href="contact?currPage=${page.endBlock+1 } ">
			<c:out value="다음"></c:out></a></c:if></li>
	</ul>
		<sec:authorize access="hasRole('ROLE_USER')">
	 	<input type="button" class="btn btn-default" data-toggle="modal"
		data-target="#myModal" value="글쓰기">
	    </sec:authorize>
	    
		<!-- Modal -->
		<div class="modal fade" id="myModal" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">문의글 남겨주세요^^</h4>
					</div>
				<div class="modal-body">
					<jsp:include page="${request.contextPath}/contactinsert"></jsp:include>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
	</div>
	</div>

	<script>
		$(".plusIcon").on("click", function() {
		var obj = $(this);
		if (obj.hasClass("glyphicon-plus")) {
			obj.hide();
			obj.next().show();
			obj.parent().parent().next().show();
		} else {
			obj.hide();
			obj.prev().show();
			obj.parent().parent().next().hide();
			}
		});
	</script>
</body>
</html>