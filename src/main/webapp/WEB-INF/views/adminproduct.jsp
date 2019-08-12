<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <style>
      .dropdown-item{
          font-size: 15px;
      }
      a { 
          font-size: 20px;
        }
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js">
</script>
<script>
function del(pno)
{
	location.href="delete/"+pno
}
</script>
</head>
<body>
 <div class="container">
<div class="alert alert-primary">
          <h2>Administrator Page</h2>
         </div>
            <ul class="nav nav-pills">
      
          <li data-tab="member" class="nav-item" id="default">
                <a class="nav-link active" data-toggle="tab" href="#">회원 관리</a>
              </li>
              <li data-tab="goods" class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#">상품 관리</a>
              </li>
              <li data-tab="order" class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#">주문 관리</a>
              </li>
              
          </ul>
    </div>
          <br><br>

<div class="container">
  <p>사이트에 등록된 상품 정보를 확인할 수 있습니다(상품 이미지 클릭 시 해당 상품 페이지로 이동).</p>
  
  
<form>
    <div class="form-group" style="width: 150px; float: right;">
      <!--<label for="sel1">Select list (select one):</label>-->
      <select class="form-control" id="sel1" onchange="location.href=this.value">
        <option>전체</option>
        <option value="result.html" id="default">시계</option>
        <option>스포츠용품</option>
        <option>컴퓨터</option>
        <option>사무용품</option>
        <option>액세서리</option>
        <option>의류/잡화</option>
        <option>건강식품</option>
      </select>
    </div>
    </form>
<br>
<table class="table">
    <thead>
      <tr>
        <th>상품 이미지</th>
        <th>상품 번호</th>
        <th>상품명</th>
        <th>정가</th>
        <th>판매가</th>
        <th>판매량</th>
        <th>재고량</th>
        <th>총 판매액</th>
        <th>등록일</th>
        <th>마감일</th>
        <th>삭제</th>
      </tr>
    </thead>
    <tbody>
    <c:forEach var="dto" items="${list }">
      <tr>
      
        <td><a href="main.html"><img src="img/Tulips.jpg" class="rounded" alt="Cinque Terre" width="100" height="75"></a></td>
        <td><c:out value="${dto.pno }"></c:out></td>
        <td><c:out value="${dto.pname }"></c:out></td>
        <td><c:out value="${dto.oprice }"></c:out></td>
        <td><c:out value="${dto.dprice }"></c:out></td>
        <td>null</td>
        <td>null</td>
        <td>null</td>
        <td><c:out value="${dto.regist }"></c:out></td>
        <td><c:out value="${dto.deadline }"></c:out></td>
        <td><input type="button" value="삭제" onclick="del(${dto.pno})"></td>
      </tr>
      
       </c:forEach>
    </tbody>
  </table>
  
  <form method="post" action="${page.currPage }">
	<select name="search" style="width: 100px;height: 30px;">
		<option value="pno">상품번호</option>
		<option value="pname">상품이름</option>
		<option value="cno">카테고리번호</option>
	</select>
	<input type="text" name="searchtxt" style="height: 30px;">
	<input type="submit" class="btn btn-info" value="검색">
    </form>
  <a href="../coding">상품추가하기</a>
 
  
  <div class="text-center">
  <ul class="pagination">
    <c:if test="${page.prev }">
	<a href="list?currPage=${page.startBlock-1 }&search=${search}&searxhtxt=${searchtxt}">
	<c:out value="이전"></c:out>
	</a>
	</c:if>
  <c:forEach var="index" begin="${page.startBlock }" end="${page.endBlock }">
  	
		<a href="list?currPage=${index }&search=${search}&searchtxt=${searchtxt}">
		<c:out value="${index }"/>
		</a>
	
</c:forEach>
  <c:if test="${page.next }">
<a href="list?currPage=${page.endBlock+1 }&search=${search}&searxhtxt=${searchtxt}">
<c:out value="다음"/>
</a>
</c:if>
   
  </ul>
  </div>
</div>

</body>
</html>