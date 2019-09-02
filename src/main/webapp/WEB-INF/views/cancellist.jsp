<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Bootstrap Example</title>
<!-- <link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css"> -->
<style>
      .dropdown-item{
          font-size: 15px;
      }
      .nav-link { 
          font-size: 20px;
        }
        .container{
       	margin: auto
       }
</style>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script> -->
</head>
<body>
<c:set var="member" value="${ sessionScope.user }"></c:set>
<div class="container">
      <!--<div class="row">
        <div class="col">-->
         <div class="alert alert-primary">
          <h2>My Page</h2>
         </div>
            <ul class="nav nav-pills">
      
          <li data-tab="info" class="nav-item" id="default">
                <a class="nav-link active" href="../mypage/${member.no }">나의 정보</a>
              </li>
              <li data-tab="product" class="nav-item">
                <a class="nav-link" href="../product?no=${member.no }">나의 주문 내역</a>
              </li>
              <li data-tab="product2" class="nav-item">
                <a class="nav-link" href="../cancellist?no=${member.no }">나의 취소 내역</a>
              </li>
              <li data-tab="product" class="nav-item">
                <a class="nav-link" href="../review/${member.no }">나의 리뷰</a>
              </li>

          </ul>
     </div>
          <br><br>
          
<div class="container">
  <p>${member.nickname } 님의 주문 취소 상품입니다.</p>

<form>
    <div class="form-group" style="width: 150px; float: right;">
      <select class="form-control" id="sel1" onchange="location.href=this.value">
        <option>카테고리</option>
        <option value="../cancellist?no=${member.no }">전체</option>
        <c:forEach var="item" items="${clist }">
        	<option value="../cancellist/${item.cno }?no=${member.no}">${item.cname }</option>
        </c:forEach>
      </select>
    </div>
    </form>
      
<br>
<table class="table">
    <thead>
      <tr>
        <th>상품 이미지</th>
        <th>상품명</th>
        <th>주문 번호</th>
        <th>주문 일자</th>
        <th>구매 가격</th>
        <th>취소 일자</th>
      </tr>
    </thead>
    <tbody>
    <c:forEach var="item" items="${cancellist }">
      <tr>
      	<td><a href="#"><img src="../img/Penguins.jpg" class="rounded" alt="Cinque Terre" width="100" height="75"></a></td>
        <td><c:out value="${item.pname }"></c:out></td>
        <td><c:out value="${item.bno }"></c:out></td>
        <td><c:out value="${item.bdate }"></c:out></td>
        <td><c:out value="${item.dprice }"></c:out></td>
        <td><c:out value="${item.cdate }"></c:out></td>
      </tr>
     </c:forEach>
    </tbody>
  </table>
  
  <form method="get" action="../cancellist/${cno}?currPage=${page.currPage }">
	<select name="search" style="width: 100px;height: 30px;">
		<option>검색 조건 </option>
		<option value="pname">상품명</option>
		<option value="bno">주문 번호</option>
	</select>
	<input type="hidden" id="no" name="no" value="${member.no }"/>
	<input type="text" name="searchtxt" style="height: 30px;">
	<input type="submit" class="btn btn-info" value="검색">
    </form>
  
 <div class="text-center">
  <ul class="pagination">
  <li class="page-item">
    <c:if test="${page.prev }">
	<a class="page-link" href="../cancellist/${cno}?no=${member.no }&currPage=${page.startBlock-1 }&search=${search}&searchtxt=${searchtxt}">
	<c:out value="이전"></c:out>
	</a>
	</c:if>
  </li>
  <li class="page-item">
  
  <c:forEach var="index" begin="${page.startBlock}" end="${page.endBlock }">
		<c:choose>
			<c:when test="${index}==${page.currPage}">
				<c:out value="${index}"></c:out>
			</c:when>
			<c:otherwise>
				<a href="../cancellist/${cno}?no=${member.no }&currPage=${index}&search=${search}&searchtxt=${searchtxt}">
				<c:out value="${index}"/></a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
   
   
   
  </li>
  <li class="page-item">
  <c:if test="${page.next }">
  <%-- <c:if test="${page.endBlock<totalPage }"> --%>
	<a  class="page-link" href="../cancellist/${cno}?no=${member.no }&currPage=${page.endBlock+1 }&search=${search}&searchtxt=${searchtxt}">
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