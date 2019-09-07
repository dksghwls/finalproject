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
          font-weight: bold;
        }
        .container{
       	margin: auto
       }
       p{
       	font-size: 15px;
       }
        #nick{
       	color: blue;
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
<c:set var="member" value="${ sessionScope.user }"></c:set>
<div class="container">
      <!--<div class="row">
        <div class="col">-->
         <div class="alert alert-primary">
          <h1>My Page</h1>
         </div>
            <ul class="nav nav-pills">
      
          <li data-tab="info" class="nav-item" id="default">
                <a class="nav-link active" href="../mypage/${member.no }">나의 정보</a>
              </li>
              <li data-tab="product" class="nav-item">
                <a class="nav-link" href="../product?no=${member.no }">나의 주문 내역</a>
              </li>
              <li data-tab="product2" class="nav-item">
                <a class="nav-link" href="../cancellist?no=${member.no }" style="background-color: #6799FF; color: #FFFFFF;">나의 취소 내역</a>
              </li>
              <li data-tab="product" class="nav-item">
                <a class="nav-link" href="../review/${member.no }">나의 리뷰</a>
              </li>

          </ul>
    <!--  </div> -->
          <br><br>
          
<div class="container">
  <p><span id="nick">${member.nickname }</span> 님의 주문 취소 상품입니다.</p>

<form>
    <div class="form-group" style="width: 150px; float: right;">
      <select class="form-control" id="sel1" onchange="location.href=this.value">
        <!-- <option>카테고리</option> -->
        <option value="../cancellist?no=${member.no }">전체</option>
        <c:forEach var="item" items="${clist }">
        	<c:choose>
        		<c:when test="${cno==item.cno}">
        			<option value="../cancellist/${item.cno }?no=${member.no}" selected>${item.cname }</option>
        		</c:when>
        		<c:otherwise>
        			<option value="../cancellist/${item.cno }?no=${member.no}">${item.cname }</option>
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
        <th><div class="content1">상품 이미지</div></th>
        <th><div class="content1">상품명</div></th>
        <th><div class="content1">주문 일자</div></th>
        <th><div class="content1">취소 수량(개)</div></th>
        <th><div class="content1">취소 금액(원)</div></th>
        <th><div class="content1">취소 일자</div></th>
      </tr>
    </thead>
    <tbody>
    <c:forEach var="item" items="${cancellist }">
      <tr>
      	<td><div class="content2"><c:out value="${item.bno }"></c:out></div></td>
      	<td><a href="../detail/${item.pno}"><img src="${item.imgname }" class="rounded" alt="Cinque Terre" width="150" height="112"></a></td>
        <td><div class="content2"><c:out value="${item.pname }"></c:out></div></td>
        <td><div class="content2"><c:out value="${item.bdate }"></c:out></div></td>
        <td><div class="content2"><c:out value="${item.bcount }"></c:out></div></td>
        <td><div class="content2"><c:out value="${item.pay }"></c:out></div></td>
        <td><div class="content2"><c:out value="${item.cdate }"></c:out></div></td>
      </tr>
     </c:forEach>
    </tbody>
  </table>
  
  <form method="get" action="../cancellist/${cno}?currPage=${page.currPage }">
	<select name="search" style="width: 100px;height: 30px;">
		<!-- <option>검색 조건 </option> -->
		<c:choose>
			<c:when test="${search=='pname'}">
				<option value="pname" selected>상품명</option>
				<option value="bno">주문 번호</option>
			</c:when>
			<c:otherwise>
				<option value="pname">상품명</option>
				<option value="bno" selected>주문 번호</option>
			</c:otherwise>
		</c:choose>
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
</div>
</div>
</body>
</html>