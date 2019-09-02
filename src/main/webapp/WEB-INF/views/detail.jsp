<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- <script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	$(document).on("click", "#reviewbtn", function() {
		var dto = $(this).data('dto');
		$.ajax({
			url : '/replyinsertresult/',
			success : function(data) {
			$('#outputt .row2').empty().append(data);
			}
		});
	});
</script> -->
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
  <style>
    /* Add a gray background color and some padding to the footer */
    

    .inner img {
      width: 100%; /* Set width to 100% */
      min-height: 200px;
    }

    /* Hide the carousel text when the screen is less than 600 pixels wide */
    @media (max-width: 600px) {
      .carousel-caption {
        display: none; 
      }
    }
    .btn
    {
      width:100%;
    }
    .well
    {
      height:200px;
      
    
    }
    
    
  </style>
</head>
<body>

<c:set var="member" value="${ sessionScope.user }"></c:set>

<div class="container">
<div class="row">
  <div class="col-sm-8">
  <div class="inner">
   
     <img src="${img.imgname}"> 
   
  
  </div>
    
  </div> 
  <div class="col-sm-4">
    <div class="well">
     <c:forEach var="item" items="${dto}">
     ${item.pno }
     ${item.pname }
    
      </c:forEach>
     
    </div>
    
    <select id="countitem" name="countitem" > 
    
    
    <option value="1">1
    <option value="2">2
    <option value="3">3
    <option value="4">4
    <option value="5">5
    <option value="6">6
    <option value="7">7
    <option value="8">8
    <option value="9">9
    <option value="10">10
    
    </select>
   
    
    
    
     <c:forEach var="item" items="${dto}">
    <a href="../Payment/${item.pno }"><button type="button" class="btn btn-primary btn-md">결제</button></a>
      </c:forEach>
   
  </div>
  <div class="links">
  
  <!-- <img src="img/google.png">
  <img src="img/twitter.png"> -->
  </div>
  
  
  <div class="links">
  
  </div>
  
</div>
<hr>
</div>
<div class="container">
<div class="row">
  <div class="col-sm-12">

<ul class="nav nav-tabs" role="tablist" id="myTab">
      
      <li role="presentation"><a href="#detailpage" aria-controls="detailpage" role="tab" data-toggle="tab">상세페이지</a></li>
      <li role="presentation"><a href="#reviewpage" aria-controls="reviewpage" role="tab" data-toggle="tab">리뷰작성</a></li>
      
    </ul>

    <div class="tab-content">
      <div role="tabpanel" class="tab-pane active" id="detailpage">
      <c:forEach var="item" items="${dto}">
      	${ item.content}
      </c:forEach>
      </div>
      <div role="tabpanel" class="tab-pane" id="reviewpage">
      
      <div role="tabpanel" class="tab-pane" id="reviewpage">
      
    
  
   
    <div class="search">
      <input type="text" class="search" size="20" placeholder="Search" required> <button type="button" class="btn btn-danger">검색하기</button>  
    </div>
 

           <!-- Trigger the modal with a button -->

<div class="container">
   <c:forEach var="item" items="${dto}">
  <form action="/detail/${item.pno }" method="POST">
    <div class="form-group">
      <label for="comment">Comment:</label>
      <input type="hidden" value="${ member.no }" name="no">
    <sec:authorize access="isAnonymous()">
	  <textarea class="form-control" rows="5" id="comment" name="rcontent" disabled="disabled"></textarea>
	  <button id="reviewbtn" disabled="disabled"> 입력하기 </button>
	</sec:authorize>
	<sec:authorize access="isAuthenticated()">
 		<textarea class="form-control" rows="5" id="comment" name="rcontent" required="required"></textarea>
   		<button id="reviewbtn"> 입력하기 </button>
   		
   		
   		
	</sec:authorize>
	</div>
  <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
  
  </form>
  </c:forEach>
</div>
	
   <c:forEach var="list" items="${replylist}">
    
     ${ list.rcontent}<br>
     ${list.no }
     <br>
     <a href="/replydelete2/${list.rno}?pno=${list.pno}">삭제하기</a>
     <a href="/replydetail2/${list.rno}">수정하기</a>
     
     
     ${list.pno }
 
 
</c:forEach>

    </div>
    </div>
   </div>
    </div>   
      </div>
      
    </div>
    </div>
    </div>
    </div>
</body>
</html>
