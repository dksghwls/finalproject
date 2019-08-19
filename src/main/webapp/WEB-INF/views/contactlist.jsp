<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
 <h2>Search</h2>
<input class="form-control" id="myInput" type="text" placeholder="검색어를 입력하세요">
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
	<sec:authorize access="hasRole('ROLE_USER')">
	<a href="/contactinsert"><input type="button" value="글쓰기"></a>
		</sec:authorize>
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
</script>
</body>
</html>