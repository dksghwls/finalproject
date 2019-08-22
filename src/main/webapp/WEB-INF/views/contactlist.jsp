<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
 
<div class="container">
 <h2>Search</h2>
<input class="form-control" id="myInput" type="text" placeholder="검색어를 입력하세요">
<%-- 	<sec:authorize access="hasRole('ROLE_USER')"> --%>
	<table class="table table-hover">
		<thead>
			<tr>
				<th>글번호</th>
				<th>회원명</th>
				<th>글제목</th>
				<th>작성일</th>
			 
			</tr>
		</thead>
		<tbody id="myTable">
		<c:forEach var="i" items="${dto }">
			<tr>
				<td><a href="/contactdetail/${i.hno }"> <c:out
												value="${i.hno } "></c:out></a> </td>
				<td><c:out value="${i.nickname }"></c:out></td>
				<td><c:out value="${i.htitle }"></c:out></td>
				<td><c:out value="${i.hdate }"></c:out></td>	
			 			 
			</tr>
			</c:forEach>
		</tbody>

	</table>
	<!-- 관리자일 경우 글쓰기 보여지는 것 -->
    <%-- <sec:authorize access="hasRole('ROLE_ADMIN')"> --%>
	<%-- <input type="button" class="btn btn-default" id="btn" value="글쓰기">
	</div>
	<!-- include 시도 -->
	<div class="insertshow" >
	<jsp:include page="${request.contextPath}/contactinsert"></jsp:include>
		</sec:authorize>
 </div> --%>
 
   <input type="button" class="btn btn-default" data-toggle="modal" data-target="#myModal" value="글쓰기"></button>

  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">문의글을 작성하세요.</h4>
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
	$(document).ready(function(){
	  $("#myInput").on("keyup", function() {
	    var value = $(this).val().toLowerCase();
	    $("#myTable tr").filter(function() {
	      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
	    });
	  });
	});
	
	/*글쓰기 버튼 */
/* 	$(document).ready(function() {
	 
	    $('#btn').click(function() {
	            $('.insertshow').slideToggle("fast");
	    });
	});
	 */
</script>
</body>
</html>