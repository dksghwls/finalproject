<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<form method="get" action="faq?currPage=${page.startBlock }">
		<select name="search" class="form-control" id="sel1"
			style="width: 15%;">
			<option value="ftitle">제목</option>
			<option value="fcontent">내용</option>
		</select>
		<!-- <input type="text" class="form-control" placeholder="Search" name="keyword" style="width: 12%;">  -->
		<!-- <input type="text" name="keyword" class="form-control" > -->

		<div class="input-group" >
			<input type="text" class="form-control" placeholder="검색어를 입력하세요"
				name="keyword" >
			<div class="input-group-btn">
				<button class="btn btn-default" type="submit">
					<i class="glyphicon glyphicon-search" ></i>
				</button>
			</div>
		</div>
	</form>
</body>
</html>