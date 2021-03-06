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
        .p{
        	color: red;
        }
        .container{
       	margin: auto
       }
       .success{
       	font-size: 15px;
       }
       #nick{
       	color: blue;
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
<script>

	$(document).on("click", "#cancel_btn", function () { 
		var bno = $(this).data('id');
		var mno = $(this).data('mem');
		var pno=$(this).data('pno');
		var bcount=$(this).data('bcount');
		/* onclick="location.href='../cancel/11?no=${member.no}'" */
		document.getElementById("yes_btn").setAttribute("onclick", "location.href='../cancel/" + bno+ "?no=" + mno + "&pno="+pno+"&bcount="+bcount+"'");
    });
</script>
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
                <a class="nav-link" href="../product?no=${member.no }" style="background-color: #6799FF; color: #FFFFFF;">나의 주문 내역</a>
              </li>
              <li data-tab="product2" class="nav-item">
                <a class="nav-link" href="../cancellist?no=${member.no }">나의 취소 내역</a>
              </li>
              <li data-tab="product" class="nav-item">
                <a class="nav-link" href="../review/${member.no }">나의 리뷰</a>
              </li>

          </ul>
     <!-- </div> -->
          <br><br>
          
<div class="container">
  <p><span id="nick">${member.nickname }</span> 님의 주문 완료 상품입니다(이미지 클릭 시 상품 페이지로 이동).</p>
  <p class="p">(* 배송 준비 상품만 주문 취소할 수 있습니다).</p>

<form>
    <div class="form-group" style="width: 150px; float: right;">
      <select class="form-control" id="sel1" onchange="location.href=this.value">
        <!-- <option>카테고리</option> -->
        <option value="../product?no=${member.no }">전체</option>
        <c:forEach var="item" items="${clist }">
        	<c:choose>
        		<c:when test="${cno==item.cno}">
        			<option value="../product/${item.cno }?no=${member.no}" selected>${item.cname }</option>
        		</c:when>
        		<c:otherwise>
        			<option value="../product/${item.cno }?no=${member.no}">${item.cname }</option>
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
        <th><div class="content1"  style="margin-left: 35px;">상품 이미지</div></th>
        <th><div class="content1">상품명</div></th>
        <th><div class="content1">주문 일자</div></th>
        <th><div class="content1">주문 수량(개)</div></th>
        <th><div class="content1">주문 금액(원)</div></th>
        <th><div class="content1" style="margin-left: 50px;">배송 주소</div></th>
        <th><div class="content1">배송 상태</div></th>
        <th><div class="content1">주문 취소</div></th>
      </tr>
    </thead>
    <tbody>
    <c:forEach var="item" items="${plist }">
      <tr>
      	<td><div class="content2" style="text-align: center;"><c:out value="${item.bno }"></c:out></div></td>
      	<td><a href="../detail/${item.pno}"><img src="${item.imgname }" class="rounded" alt="Cinque Terre" width="150" height="112"></a></td>
        <td><div class="content2"><c:out value="${item.pname }"></c:out></div></td>
        <td><div class="content2"><c:out value="${item.bdate }"></c:out></div></td>
        <td><div class="content2" style="margin-left: 35px;"><c:out value="${item.bcount }"></c:out></div></td>
        <td><div class="content2" style="margin-left: 25px;"><fmt:formatNumber value="${item.pay }" pattern="#,###"/></div></td>
        <td><div class="content2"><c:out value="${item.addr }"></c:out><br><c:out value="${item.detailaddr }"></c:out></div></td>
        <td>
        	<c:choose>
        		<c:when test="${item.shipping=='배송 준비'}">
        			<span class="glyphicon glyphicon-time" style="display: block; color: #980000; font-size: 30px; margin-left: 15px; margin-bottom: 10px;"></span>
        			<div class="content2" style="color: #980000;"><c:out value="${item.shipping }"></c:out></div>
        		</c:when>
        		<c:when test="${item.shipping=='배송 중'}">
        			<span class="glyphicon glyphicon-plane" style="display: block; color: #980000; font-size: 30px; margin-left: 15px; margin-bottom: 10px;"></span>
        			<div class="content2" style="color: #980000; margin-left: 5px;"><c:out value="${item.shipping }"></c:out></div>
        		</c:when>
        		<c:when test="${item.shipping=='배송 완료'}">
        			<span class="glyphicon glyphicon-gift" style="display: block; color: #980000; font-size: 30px; margin-left: 15px; margin-bottom: 10px;"></span>
        			<div class="content2" style="color: #980000;"><c:out value="${item.shipping }"></c:out></div>
        		</c:when>
        	</c:choose>
        </td>
        <td>
        	<c:if test="${item.shipping=='배송 준비' }">
        		<button id="cancel_btn" type="button" class="btn btn-danger" data-id= "${item.bno}" data-mem="${member.no}" data-pno="${item.pno}" data-bcount="${item.bcount}" data-toggle="modal" data-target="#myModal">취소</button>
        	</c:if>
        </td>
      </tr> 
   <div class="modal fade" id="myModal">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">취소 확인</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          정말로 취소하시겠습니까?
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button id="yes_btn" type="button" class="btn btn-secondary" data-dismiss="modal" >예</button>
          <input type="hidden" name="tmp_name" id="tmp_id" value="" >
          <button type="button" class="btn btn-secondary" data-dismiss="modal">아니오</button>
        </div>
        
      </div>
    </div>
  </div>
     
     </c:forEach>
    </tbody>
  </table>
  
  <form method="get" action="../product/${cno}?currPage=${page.currPage }">
	<select name="search" style="width: 100px;height: 30px;">
		<!-- <option>검색 조건 </option> -->
		<c:choose>
			<c:when test="${search=='bno'}">
				<option value="pname">상품명</option>
				<option value="bno" selected>주문 번호</option>
			</c:when>
			<c:otherwise>
				<option value="pname" selected>상품명</option>
				<option value="bno">주문 번호</option>
			</c:otherwise>
		</c:choose>
	</select>
	<input type="hidden" id="no" name="no" value="${member.no }"/>
	<input type="text" name="searchtxt" style="height: 30px;">
	<!-- <input type="submit" class="btn btn-info" value="검색"> -->
	<input id="submit_btn" type="submit" class="btn btn-info" value="검색">
    </form>
  
  <div class="text-center">
  <ul class="pagination">
  
  <li class="page-item">
    <c:if test="${page.prev }">
    <%-- <c:if test="${page.startBlock>1 }"> --%>
	<a class="page-link" href="../product/${cno}?no=${member.no }&currPage=${page.startBlock-1 }&search=${search}&searchtxt=${searchtxt}">
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
				<li><a href="../product/${cno}?no=${member.no }&currPage=${index}&search=${search}&searchtxt=${searchtxt}">
				<c:out value="${index}"/></a></li>
			</c:otherwise>
		</c:choose>
	</c:forEach>
  
  <li class="page-item">
  <c:if test="${page.next }">
  <%-- <c:if test="${page.endBlock<totalPage }"> --%>
	<a  class="page-link" href="../product/${cno}?no=${member.no }&currPage=${page.endBlock+1 }&search=${search}&searchtxt=${searchtxt}">
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