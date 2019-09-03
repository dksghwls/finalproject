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
          font-size: 22px;
        }
        .p1{
        	color: blue;
        }
        .p2{
        	color: red;
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
<script>
	var bno;
	$(document).on("click", "#modify_btn", function () { 
		bno = $(this).data('bno');
		
	});
		
	function modify_func1(currPage){
		var sel=document.getElementById("sel2");
		var shipping;
		for(i=0; i<sel.options.length; i++){
			if(sel.options[i].selected==true){
				shipping=sel.options[i].value;
				break;
			}
		}
		
		location.href="../smodifyresult?bno="+bno+"&shipping="+shipping+"&currPage="+currPage;
	}
	
	function modify_func2(currPage, cno){
		var sel=document.getElementById("sel2");
		var shipping;
		for(i=0; i<sel.options.length; i++){
			if(sel.options[i].selected==true){
				shipping=sel.options[i].value;
				break;
			}
		}
		
		location.href="../smodifyresult/"+bno+"?shipping="+shipping+"&currPage="+currPage+"&cno="+cno;
	}
	
</script>
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
              <!-- <li data-tab="product2" class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#">나의 취소 내역</a>
              </li> -->
              <li data-tab="product" class="nav-item">
                <a class="nav-link" href="../order">주문 완료</a>
              </li>
			  <li data-tab="product" class="nav-item">
                <a class="nav-link" href="../ordercancel">주문 취소</a>
              </li>
          </ul>
     <!-- </div> -->
          <br><br>
          
<div class="container">
  <p>주문 완료 내역을 확인할 수 있습니다.</p>

	<form>
    <div class="form-group" style="width: 150px; float: right;">
      <select class="form-control" id="sel1" onchange="location.href=this.value">
        <option>카테고리</option>
        <option value="../order">전체</option>
        <c:forEach var="item" items="${clist }">
        	<option value="../order/${item.cno }">${item.cname }</option>
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
        <th><div class="content1">주문자 이메일</div></th>
        <th><div class="content1">주문 수량</div></th>
        <th><div class="content1">주문 금액</div></th>
        <th><div class="content1">주문 일자</div></th>
        <th><div class="content1">배송 상태</div></th>
        <th><div class="content1">배송 상태 수정</div></th>
        <th><div class="content1">회원 상태</div></th>
      </tr>
    </thead>
    <tbody>
    <c:forEach var="item" items="${olist }">
      <tr>
        <td><div class="content2"><c:out value="${item.bno }"></c:out></div></td>
        <td><a href="#"><img src="../img/Jellyfish.jpg" class="rounded" alt="Cinque Terre" width="150" height="112"></a></td>
        <td><div class="content2"><c:out value="${item.pname }"></c:out></div></td>
        <td><div class="content2"><c:out value="${item.email }"></c:out></div></td>
        <td><div class="content2"><c:out value="${item.bcount }"></c:out></div></td>
        <td><div class="content2"><c:out value="${item.pay }"></c:out></div></td>
        <td><div class="content2"><c:out value="${item.bdate }"></c:out></div></td>
        <td><div class="content2"><c:out value="${item.shipping }"></c:out></div></td>
        <td><c:if test="${item.no!='0'}"><button id="modify_btn" type="button" class="btn btn-info" data-bno="${item.bno}" data-toggle="modal" data-target="#myModal">수정</button></c:if></td>
        <td>
        	<c:choose>
        		<c:when test="${item.no!='0'}">
        			<p class="p1">가입 회원</p>
        		</c:when>
        		<c:otherwise>
        			<p class="p2">탈퇴 회원</p>
        		</c:otherwise>
        	</c:choose> 
        </td>
      </tr>
            <div class="modal fade" id="myModal">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
      
       <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">배송 상태 수정</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          <!-- <form action="../smodifyresult"> -->
    		<div class="form-group">
      			<select class="form-control" name="shipping" id="sel2" style="width: 200px;">
        			<option value="배송 준비">배송 준비</option>
       				<option value="배송 중">배송 중</option>
        			<option value="배송 완료">배송 완료</option>
      			</select>
    		</div>
    		
    		<c:choose>
        		<c:when test="${cno==null || cno==''}">
        			<button onclick="modify_func1(${page.currPage})" id="yes_btn" type="submit" class="btn btn-info" data-dismiss="modal">수정</button>
  					<a href="../order?currPage=${page.currPage}" class="btn btn-danger">취소</a>
        		</c:when>
        		<c:otherwise>
        			<button onclick="modify_func2(${page.currPage}, ${cno})" id="yes_btn" type="submit" class="btn btn-info" data-dismiss="modal">수정</button>
  					<a href="../order/${cno}?currPage=${page.currPage}" class="btn btn-danger">취소</a>
        		</c:otherwise>
        	</c:choose> 
        </div>
        
        <!-- Modal footer
        <div class="modal-footer">
          <button id="yes_btn" type="button" class="btn btn-secondary" data-dismiss="modal">예</button>
          <button type="button" class="btn btn-secondary" data-dismiss="modal">아니오</button>
        </div> -->
        
      </div>
    </div>
  </div>
     </c:forEach>
    </tbody>
  </table>
  
  <form method="get" action="../order/${cno}?currPage=${page.currPage }">
	<select name="search" style="width: 100px;height: 30px;">
		<option>검색 조건 </option>
		<option value="pname">상품명</option>
		<option value="bno">주문 번호</option>
		<option value="email">주문자 이메일</option>
	</select>
	<input type="text" name="searchtxt" style="height: 30px;">
	<input type="submit" class="btn btn-info" value="검색">
    </form>
  
  <div class="text-center">
  <ul class="pagination">
  <li class="page-item">
    <c:if test="${page.prev }">
    <%-- <c:if test="${page.startBlock>1 }"> --%>
	<a class="page-link" href="../order/${cno}?currPage=${page.startBlock-1 }&search=${search}&searchtxt=${searchtxt}">
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
				<a href="../order/${cno}?currPage=${index}&search=${search}&searchtxt=${searchtxt}">
				<c:out value="${index}"/></a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
   
  </li>
  <li class="page-item">
  <c:if test="${page.next }">
  <%-- <c:if test="${page.endBlock<totalPage }"> --%>
	<a  class="page-link" href="../order/${cno}?currPage=${page.endBlock+1 }&search=${search}&searchtxt=${searchtxt}">
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