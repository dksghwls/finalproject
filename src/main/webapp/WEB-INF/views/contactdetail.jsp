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

<br>
<!-- 관리자일 경우 글쓰기 보여지는 것 -->
<%--  <sec:authorize access="hasRole('ROLE_ADMIN')"> --%>

 <sec:authorize access="hasRole('ROLE_USER')">
	 <div class="container">
		<div class="panel panel-default">
		<div class="panel-heading">회원번호: ${dto.no }</div>
			<div class="panel-heading">제목: ${dto.htitle }</div>
			<div class="panel-body">내용: ${dto.hcontent }</div>
		</div>

		<a href=/contact><input type="button" class="btn btn-default" value="목록"></a>
		<%-- <a href="/contactmodify/${dto.hno }"><input type="button" class="btn btn-default" id="btn"
			value="수정"></a> --%>
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
  		<input type="button" class="btn btn-default" data-toggle="modal" data-target="#myModal" value="수정">
	  
	  
	  <a href="/contactdelete/${dto.hno }">
	  <input type="button" id="delbtn" class="btn btn-default"	value="삭제"></a>  
			
 </div>
 
 </sec:authorize>
 <script>
$(document).ready(function() {
	 
	    $('#delbtn').click(function() {
	            alert('삭제하시겠습니까?');
	            location.href="/contact"
	    });
	});
</script>
</body>
</html>



