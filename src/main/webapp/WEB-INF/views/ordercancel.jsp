<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
          font-weight: bold;
        }
        .p1{
        	color: blue;
        }
        .p2{
        	color: #8C8C8C;
        }
        .container{
       		margin: auto
       }
       p{
       	font-size: 15px;
       }
       .content1{
       	font-size: 15px;
       	line-height: 30px;
       }
       .content2{
       	font-size: 15px;
       }
</style>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script> -->
</head>
<body>

<div class="container">
      <!--<div class="row">
        <div class="col">-->
         <div class="alert alert-primary">
          <h1>Administrator Page</h1>
         </div>
            <ul class="nav nav-pills">
      
          <li data-tab="info" class="nav-item" id="default">
                <a class="nav-link active" href="../adminpage">회원 관리</a>
              </li>
              <li data-tab="product" class="nav-item">
                <a class="nav-link" href="../adminproduct">상품 관리</a>
              </li>
              <li data-tab="product2" class="nav-item">
                <a class="nav-link" href="../order">주문 완료</a>
              </li>
              <li data-tab="product" class="nav-item">
                <a class="nav-link" href="../ordercancel" style="background-color: #6799FF; color: #FFFFFF;">주문 취소</a>
              </li>

          </ul>
     <!-- </div> -->
          <br><br>
          
<div class="container">
  <p>주문 취소 내역을 확인할 수 있습니다(이미지 클릭 시 상품 페이지로 이동).</p>

<form>
    <div class="form-group" style="width: 150px; float: right;">
      <select class="form-control" id="sel1" onchange="location.href=this.value">
        <!-- <option>카테고리</option> -->
        <option value="../ordercancel">전체</option>
        <c:forEach var="item" items="${clist }">
        	<c:choose>
        		<c:when test="${cno==item.cno}">
        			<option value="../ordercancel/${item.cno }" selected>${item.cname }</option>
        		</c:when>
        		<c:otherwise>
        			<option value="../ordercancel/${item.cno }">${item.cname }</option>
        		</c:otherwise>
        	</c:choose>
  		</c:forEach>
      </select>
    </div>
    </form>
      
<br>
<table class="table">
    <thead>
      <tr class="info">
      	<th><div class="content1">주문 번호</div></th>
        <th><div class="content1" style="margin-left: 35px;">상품 이미지</div></th>
        <th><div class="content1">상품명</div></th>
        <th><div class="content1" style="margin-left: 10px;">주문회원 이메일</div></th>
        <th><div class="content1">주문 일자</div></th>
        <th><div class="content1">취소 수량(개)</div></th>
        <th><div class="content1">취소 금액(원)</div></th>
        <th><div class="content1">취소 일자</div></th>
        <th><div class="content1">회원 상태</div></th>
      </tr>
    </thead>
    <tbody>
    <c:forEach var="item" items="${oclist }">
      <tr>
      	<td><div class="content2" style="margin-left: 20px;"><c:out value="${item.bno }"></c:out></div></td>
      	<td><a href="../detail/${item.pno}"><img src="${item.imgname }" class="rounded" alt="Cinque Terre" width="150" height="112"></a></td>
        <td><div class="content2"><c:out value="${item.pname }"></c:out></div></td>
        <td><div class="content2"><c:out value="${item.email }"></c:out></div></td>
        <td><div class="content2"><c:out value="${item.bdate }"></c:out></div></td>
        <td><div class="content2" style="margin-left: 30px;"><c:out value="${item.bcount }"></c:out></div></td>
        <td><div class="content2" style="margin-left: 15px;"><fmt:formatNumber value="${item.pay }" pattern="#,###"/></div></td>
        <td><div class="content2"><c:out value="${item.cdate }"></c:out></div></td>
        <td>
        	<c:choose>
        		<c:when test="${item.no!='0'}">
        			<span class="glyphicon glyphicon-user" style="display: block; color: blue; font-size: 30px; margin-left: 15px; margin-bottom: 10px;"></span>
        			<p class="p1">가입 회원</p>
        		</c:when>
        		<c:otherwise>
        			<span class="glyphicon glyphicon-user" style="display: block; color: #8C8C8C; font-size: 30px; margin-left: 15px; margin-bottom: 10px;"></span>
        			<p class="p2">탈퇴 회원</p>
        		</c:otherwise>
        	</c:choose>  
        </td>
      </tr>
     </c:forEach>
    </tbody>
  </table>
  
  <form method="get" action="../ordercancel/${cno}?currPage=${page.currPage }">
	<select name="search" style="width: 100px;height: 30px;">
		<!-- <option>검색 조건 </option> -->
		<c:choose>
			<c:when test="${search=='pname'||search==''}">
				<option value="pname" selected>상품명</option>
				<option value="bno">주문 번호</option>
				<option value="email">회원 이메일</option>
			</c:when>
			<c:when test="${search=='bno'}">
				<option value="pname">상품명</option>
				<option value="bno" selected>주문 번호</option>
				<option value="email">회원 이메일</option>
			</c:when>
			<c:when test="${search=='email'}">
				<option value="pname">상품명</option>
				<option value="bno">주문 번호</option>
				<option value="email" selected>회원 이메일</option>
			</c:when>
		</c:choose>
	</select>
	<input type="text" name="searchtxt" style="height: 30px;">
	<input type="submit" class="btn btn-info" value="검색">
  </form>
  
 <div class="text-center">
  <ul class="pagination">
  <li class="page-item">
    <c:if test="${page.prev }">
	<a class="page-link" href="../ordercancel/${cno}?no=${member.no }&currPage=${page.startBlock-1 }&search=${search}&searchtxt=${searchtxt}">
	<c:out value="이전"></c:out>
	</a>
	</c:if>
  </li>
  
  <c:forEach var="index" begin="${page.startBlock}" end="${page.endBlock }">
		<c:choose>
			<c:when test="${index==page.currPage}">
				<li class="active"><a href=""><c:out value="${index}"></c:out></a></li>
			</c:when>
			<c:otherwise>
				<li><a href="../ordercancel/${cno}?currPage=${index}&search=${search}&searchtxt=${searchtxt}">
				<c:out value="${index}"/></a></li>
			</c:otherwise>
		</c:choose>
	</c:forEach>
  
  <li class="page-item">
  <c:if test="${page.next }">
  <%-- <c:if test="${page.endBlock<totalPage }"> --%>
	<a  class="page-link" href="../ordercancel/${cno}?currPage=${page.endBlock+1 }&search=${search}&searchtxt=${searchtxt}">
	<c:out value="다음"/>
	</a>
  </c:if>
  </li>
  </ul>
  </div>
</div>
</div>
</body>
</html>