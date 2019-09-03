<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <style>
      .dropdown-item{
          font-size: 15px;
      }
      .nav-link { 
          font-size: 22px;
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
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"> -->
</script>
<script>
function del(pno)
{
	location.href="../delete/"+pno;
}
function update(pno)
{
	location.href="../update/"+pno;
}
</script>
</head>
<body>
 <div class="container">
<div class="alert alert-primary">
          <h1>Administrator Page</h1>
         </div>
            <ul class="nav nav-pills">
      
          <li data-tab="member" class="nav-item" id="default">
                <a class="nav-link active" href="../adminpage">회원 관리</a>
              </li>
              <li data-tab="goods" class="nav-item">
                <a class="nav-link" href="../adminproduct">상품 관리</a>
              </li>
              <li data-tab="order" class="nav-item">
                <a class="nav-link" href="../order">주문 완료</a>
              </li>
              <li data-tab="product" class="nav-item">
                <a class="nav-link" href="../ordercancel">주문 취소</a>
              </li>
              
          </ul>
    <!-- </div> -->
          <br><br>

<div class="container">
  <p>사이트에 등록된 상품 정보를 확인할 수 있습니다.</p>
  
  
<form>
    <div class="form-group" style="width: 150px; float: right;">
    
      <select class="form-control" id="sel1" onchange="location.href=this.value">
      	<option>선택하세요
      	<option value="../adminproduct">전체
        <c:forEach var="item" items="${clist }">
        <option value="../adminproduct/${item.cno }">${item.cname }
        </c:forEach>
      </select>
    </div>
    </form>
<br>
<table class="table">
    <thead>
      <tr class="info">
        <th><div class="content1">상품 이미지</div></th>
        <th><div class="content1">상품 번호</div></th>
        <th><div class="content1">상품명</div></th>
        <th><div class="content1">정가</div></th>
        <th><div class="content1">판매가</div></th>
        <th><div class="content1">판매량</div></th>
        <th><div class="content1">재고량</div></th>
        <th><div class="content1">총 판매액</div></th>
        <th><div class="content1">등록일</div></th>
        <th><div class="content1">마감일</div></th>
        <th>삭제</th>
      </tr>
    </thead>
    <tbody>
    <c:forEach var="dto" items="${list }">
      <tr>
        <td><a href="../detail/${dto.pno}"><img src="${dto.imgname}" class="rounded" width="150" height="112"></a></td>
        <td><div class="content2"><c:out value="${dto.pno }"></c:out></div></td>
        <td><div class="content2"><c:out value="${dto.pname }"></c:out></div></td>
        <td><div class="content2"><c:out value="${dto.oprice }"></c:out></div></td>
        <td><div class="content2"><c:out value="${dto.dprice }"></c:out></div></td>
        <td><div class="content2"><c:out value="${dto.sellcount }"></c:out></div></td>
        <td><div class="content2"><c:out value="${dto.stock }"></c:out></div></td>
        <td><div class="content2"><c:out value="${dto.sellcount * dto.dprice }"></c:out></div></td>
        <td><div class="content2"><c:out value="${dto.regist }"></c:out></div></td>
        <td><div class="content2"><c:out value="${dto.deadline }"></c:out></div></td>
        <td><input type="button" value="삭제" onclick="del(${dto.pno})"></td>
      </tr>
      
       </c:forEach>
    </tbody>
  </table>
  
  <form method="get" action="../adminproduct?currPage=${page.currPage }">
	<select name="search" style="width: 100px;height: 30px;">
		<!-- <option value="pno">상품번호</option> -->
		<option value="pname">상품이름</option>
		<!-- <option value="cno">카테고리번호</option> -->
	</select>
	<input type="text" name="searchtxt" style="height: 30px;">
	<input type="submit" class="btn btn-info" value="검색">
    </form>
  <a href="../coding">상품추가하기</a>
 
  
  <div class="text-center">
  <ul class="pagination">
    <c:if test="${page.prev }">
	<a href="../adminproduct?currPage=${page.startBlock-1 }&search=${search}&searxhtxt=${searchtxt}">
	<c:out value="이전"></c:out>
	</a>
	</c:if>
  <c:forEach var="index" begin="${page.startBlock }" end="${page.endBlock }">
  	<c:choose>
  	<c:when test="${index }==${page.currPage }">
  		<c:out value="${index }"/>
  		</c:when>
  		<c:otherwise>
  		<a href="../adminproduct/${cno }?currPage=${index }&search=${search}&searchtxt=${searchtxt}"><c:out value="${index }"/></a>
  		</c:otherwise>
  	</c:choose>
		
	
</c:forEach>
  <c:if test="${page.next }">
<a href="../adminproduct?currPage=${page.endBlock+1 }&search=${search}&searxhtxt=${searchtxt}">
<c:out value="다음"/>
</a>
</c:if>
  </ul>
  </div>
</div>
</div>

</body>
</html>