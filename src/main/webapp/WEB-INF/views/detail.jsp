<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>

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



 <c:forEach var="item" items="${dto}">
    
     ${item.pname }
    
      </c:forEach>


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
     ${item.pno }<br>
     ${item.pname }<br>
      ${item.dprice }<br>
      
      
   남은기간: ${ deadline }일<br>
    가격: ${item.oprice }<br>
    스탁: ${item.stock }
   
   
      </c:forEach>
     
    </div>
    
    
    <!-- 폼으로 작성하기 -->
     <c:forEach var="item" items="${dto}">
     <c:if test="${deadline >=0 }">
	     <form action="../Payment/${item.pno }">
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
		 	 <sec:authorize access="isAuthenticated()">
	     <input type="submit" class="btn btn-primary btn-md" value="결제">
	    </sec:authorize>
	     </form>
	     
      </c:if>
      
      <c:if test="${deadline < 0 }">
      <button type="button" class="btn btn-primary btn-md" disabled="disabled">결제</button>
      
      </c:if>
      </c:forEach>
    
  </div>
  <div class="links">
  
  
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
    
     ${ list.rcontent} ${list.nickname }
    <br>
     
     <!-- 현재 접속중인 사람과 댓글 작성자 비교 -->
    <c:if test="${ member.no == list.no || member.no==1 }"> 
    
     <a href="/replydelete2/${list.rno}?pno=${list.pno}">삭제하기</a>
     <a href="/replydetail2/${list.rno}">수정하기</a>
     
     </c:if>
    
 
 
</c:forEach>

    </div>
    </div>
   </div>
    </div>   
      </div>
      
    </div>
   
</body>
</html>
