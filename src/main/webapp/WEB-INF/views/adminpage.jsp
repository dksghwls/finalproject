<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Bootstrap Example</title>
<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<style>
      .dropdown-item{
          font-size: 15px;
      }
      .nav-link { 
          font-size: 20px;
        }
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>

<div class="container">
      <!--<div class="row">
        <div class="col">-->
         <div class="alert alert-primary">
          <h2>Administrator Page</h2>
         </div>
            <ul class="nav nav-pills">
      
          <li data-tab="info" class="nav-item" id="default">
                <a class="nav-link active" href="../adminpage">회원 관리</a>
              </li>
              <li data-tab="product" class="nav-item">
                <a class="nav-link" href="../goods">상품 관리</a>
              </li>
              <!-- <li data-tab="product2" class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#">나의 취소 내역</a>
              </li> -->
              <li data-tab="product" class="nav-item">
                <a class="nav-link" href="../order">주문 관리</a>
              </li>

          </ul>
     </div>
          <br><br>
          
<div class="container">
  <p>사이트에 가입한 회원의 정보를 확인, 삭제할 수 있습니다.</p>

<%-- <form>
    <div class="form-group" style="width: 150px; float: right;">
      <select class="form-control" id="sel1" onchange="location.href=this.value">
        <option>카테고리</option>
        <option value="../product">전체</option>
        <c:forEach var="item" items="${clist }">
        	<option value="../product/${item.cno }">${item.cname }</option>
        </c:forEach>
      </select>
    </div>
    </form> --%>
      
<br>
<table class="table">
    <thead>
      <tr>
        <th>회원 번호</th>
        <th>이메일</th>
        <th>닉네임</th>
        <th>총 주문 횟수</th>
        <th>총 주문 금액</th>
        <th>회원 삭제</th>
      </tr>
    </thead>
    <tbody>
    <c:forEach var="item" items="${plist}">
      <tr>
        <td><c:out value="${item.no }"></c:out></td>
        <td><c:out value="${item.email }"></c:out></td>
        <td><c:out value="${item.nickname }"></c:out></td>
        <td><c:out value="${item.ordercount }"></c:out></td>
        <td><c:out value="${item.ordermoney }"></c:out></td>
        <td><button type="button" class="btn btn-danger" data-toggle="modal" data-target="#myModal">삭제</button></td>
      </tr>
      <div class="modal fade" id="myModal">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">삭제 확인</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          정말로 삭제하시겠습니까?
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="location.href='memberdelete?no=${item.no }'">예</button>
          <button type="button" class="btn btn-secondary" data-dismiss="modal">아니오</button>
        </div>
      </div>
    </div>
  </div>
     </c:forEach>
    </tbody>
  </table>
  
  <form method="get" action="adminpage?currPage=${page.currPage }">
	<select name="search" style="width: 100px;height: 30px;">
		<option>검색 조건 </option>
		<option value="email">이메일</option>
		<option value="nickname">닉네임</option>
	</select>
	<input type="text" name="searchtxt" style="height: 30px;">
	<input type="submit" class="btn btn-info" value="검색">
    </form>
  
  <div class="text-center">
  <ul class="pagination">
  <li class="page-item">
    <c:if test="${page.prev }">
    <%-- <c:if test="${page.startBlock>1 }"> --%>
	<a class="page-link" href="adminpage?currPage=${page.startBlock-1 }&search=${search}&searchtxt=${searchtxt}">
	<c:out value="이전"></c:out>
	</a>
	</c:if>
  </li>
  <li class="page-item">
  
  <%-- <c:forEach var="index" begin="${page.startBlock }" end="${page.endBlock }">
  	
		<a class="page-link" href="product?currPage=${index }&search=${search}&searchtxt=${searchtxt}">
		<c:out value="${index }"/>
		</a>
  </c:forEach> --%>
  
  <%-- <c:forEach var="index" begin="${page.startBlock}" end="${page.endBlock }">
    <c:if test="${index==currpage}">
      <c:out value="${index}"></c:out>
    </c:if>
    <c:if test="${index!=currpage }">
     <a class="page-link" href="product?currpage=${index}&search=${search}&searchtxt=${searchtxt}"><c:out value="${index }"/></a>
    </c:if>
   </c:forEach> --%>
   
   <c:forEach var="index" begin="${page.startBlock}" end="${page.endBlock }">
		<c:choose>
			<c:when test="${index}==${page.currPage}">
				<c:out value="${index}"></c:out>
			</c:when>
			<c:otherwise>
				<a href="adminpage?currPage=${index}&search=${search}&searchtxt=${searchtxt}">
				<c:out value="${index}"/></a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
   
   
   
  </li>
  <li class="page-item">
  <c:if test="${page.next }">
  <%-- <c:if test="${page.endBlock<totalPage }"> --%>
	<a  class="page-link" href="adminpage?currPage=${page.endBlock+1 }&search=${search}&searchtxt=${searchtxt}">
	<c:out value="다음"/>
	</a>
  </c:if>
  </li>
  </ul>
  </div>
  
  <!-- <div class="text-center">
  <ul class="pagination">
   <li><a href="#">이전</a></li>
   <li><a href="#">1</a></li>
   <li><a href="#">2</a></li>
   <li><a href="#">3</a></li>
   <li><a href="#">4</a></li>
   <li><a href="#">5</a></li>
   <li><a href="#">다음</a></li>
   
    <li class="page-item"><a class="page-link" href="#">Previous</a></li>
    <li class="page-item"><a class="page-link" href="#">1</a></li>
    <li class="page-item active"><a class="page-link" href="#">2</a></li>
    <li class="page-item"><a class="page-link" href="#">3</a></li>
    <li class="page-item"><a class="page-link" href="#">Next</a></li>
  </ul>
  </div> -->
  
</div>
</body>
</html>