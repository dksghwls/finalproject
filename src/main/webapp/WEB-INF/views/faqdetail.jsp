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

	<!-- 관리자일 경우 글쓰기 보여지는 것 -->
	<%-- <sec:authorize access="hasRole('ROLE_ADMIN')"> --%>
	<sec:authorize access="hasRole('ROLE_USER')">
		<div class="container">
			<br>
			<div class="panel panel-default">
		
				<div class="panel-heading">제목: ${dto.ftitle }</div>
				<div class="panel-body">내용: ${dto.fcontent }</div>
			</div>

			<%-- 	<table>
		<thead>
			<tr>
				<th>카테고리</th>
				<th>번호</th>
				<th>제목
				<th>내용</th>
			</tr>
		</thead>
		<tbody>
		
			<tr>
				<td>${dto.fcname }</td>
				<td>${dto.fno }</td>
				<td>${dto.ftitle }</td>
				<td>${dto.fcontent }</td>
			</tr>
			
		</tbody>
	</table>
 --%>
			<a href=/faq><input type="button" class="btn btn-default" value="목록"></a> <a
				href="/faqmodify/${dto.fno }"><input type="button" class="btn btn-default" value="수정"></a>
			<a href="/faqdelete/${dto.fno }"><input type="button" class="btn btn-default" value="삭제"></a>
			</div>
	</sec:authorize>
</body>
</html>