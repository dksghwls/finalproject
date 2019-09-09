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
      height:300px;
      
    
    }
    .centerkey{
    position:relative;
    left:500px;
    
    }
    
    
    
  </style>
</head>
  <body onload="init();">

<script>
	var sell_price;
	
	var bcount;

	
	
	function init () {
		sell_price = document.form.sell_price.value;
		bcount = document.form.bcount.value;
		document.form.sum.value = sell_price;
		change();
	}
	
	function add () {
		hm = document.form.bcount;
		sum = document.form.sum;
		if (hm.value < ${stock}) {
			hm.value ++ ;
		}
		
		sum.value = parseInt(hm.value) * sell_price;
	}
	
	function del () {
		hm = document.form.bcount;
		sum = document.form.sum;
			if (hm.value > 1) {
				hm.value -- ;
				sum.value = parseInt(hm.value) * sell_price;
			}
	}
	
	function change () {
		hm = document.form.bcount;
		sum = document.form.sum;
	
			if (hm.value < 0) {
				hm.value = 0;
			}
		sum.value = parseInt(hm.value) * sell_price;
	}  
</script>



<c:set var="member" value="${ sessionScope.user }"></c:set>

        
        
      <c:forEach var="item" items="${dto}">
       
       
       <div class="container">
         <div class="centerkey">
        <%--  <h3><b>${item.pname }</b></h3> --%>
         </div>
       </div>    
      </c:forEach>


   <div class="container">
     <div class="row">
     <div class="col-sm-8">
     <div class="inner">
     <br>
     <img src="${img.imgname}"> 
   
  
  </div>
    
  </div> 
  <div class="col-sm-4">
  <br>
    <div class="well">
     <c:forEach var="item" items="${dto}">   
   <h3><b>${item.pname }</b></h3><br><br>
 <div class="glyphicon glyphicon-usd"></div> 원가: <b>${item.oprice }원</b><br> <br>
 <div class="glyphicon glyphicon-triangle-bottom"></div> 할인된 가격: <b>${item.dprice }원</b><br><br>
      
    <c:if test="${deadline > 0}">
   <div class="glyphicon glyphicon-calendar"> </div>남은 기간: <b>${deadline}일</b><br><br>
    </c:if>
    
    <c:if test="${deadline < 0}">
    남은 기간: 마감<br><br>
    </c:if>
    <c:if test="${deadline == 0}">
    남은 기간: 오늘 마감<br><br>
    </c:if>
    
    
    
    <div class="glyphicon glyphicon-shopping-cart"></div>남은 개수: <b>${item.stock }개</b><br>
   
  
   
      </c:forEach>
       

    </div>
    
    <div>
	        <div id="result"></div>
	    </div>
    
    
    
    <!-- 폼으로 작성하기 -->
     <c:forEach var="item" items="${dto}">
     <c:if test="${deadline >=0 }">
     	 <c:if test="${item.stock==0 }">
               <p>해당 상품은 품절되었습니다. 다른 상품을 이용해주세요.</p>
               <button type="button" class="btn btn-primary btn-md" disabled="disabled">결제</button>
        </c:if>
        
        
        <div>
        <c:if test="${item.stock>0 }">
	    <sec:authorize access="isAuthenticated()"> 
	     <form action="../Payment/${item.pno }" name="form" method="get">
		<div class="glyphicon glyphicon-ok"></div>   수량 : <input type=hidden name="sell_price" value="${item.dprice }">
      <input type="text" name="bcount" id="bcount" value="1" size="3" onchange="change();">
         <input type="button" value=" + " onclick="add();"><input type="button" value=" - " onclick="del();"><br><br>
		<input type="hidden" name="no" value="${ member.no }">
		<input type="hidden" name="pno" value="${ item.pno }">
		<input type="hidden" name="pname" value="${item.pname }">
            <div class="glyphicon glyphicon-hand-right"></div> 금액 : <input type="text" name="sum" size="11" readonly>원
         </sec:authorize>
		</div>
		<br><br>
		<div>
		 	 <sec:authorize access="isAuthenticated()"> 
		 	 <c:if test="${item.stock>0 }">
	    <input type="submit" class="btn btn-primary btn-md" value="결제">
	       </c:if>
	     </sec:authorize>
	     <sec:authorize access="isAnonymous()">
	     <button type="button" class="btn btn-primary btn-md" disabled="disabled">결제</button>
	     </sec:authorize>
	     </div>
	     </form>
	     </c:if>
	     
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
      
      <li role="presentation"><a href="#detailpage" aria-controls="detailpage" role="tab" data-toggle="tab">상세설명</a></li>
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
  <form action="/detail/${item.pno }" method="POST" onsubmit="return submitCheck()" name="frm"   >
    <div class="form-group">
      <label for="comment"><h4>상품 리뷰를 남겨주세요</h4></label>
      <input type="hidden" value="${ member.no }" name="no">
    <sec:authorize access="isAnonymous()">
	  <textarea class="form-control" rows="5" id="comment" name="rcontent" disabled="disabled"></textarea>
	  <button id="reviewbtn" disabled="disabled" class="btn btn-default"> 입력하기 </button> 
	  
	</sec:authorize>
	<sec:authorize access="isAuthenticated()">
 		<textarea class="form-control" rows="5" id="comment" name="rcontent"></textarea><br>
   		<button id="reviewbtn" class="btn btn-default"> 입력하기 </button>
   		
	</sec:authorize>
	</div>
  <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
  
   <%-- 수정 예정
  <input type="hidden" value="${item.pname }" name="pname"/>
  <input type="hidden" value="${item.deadline }" name="deadline"/>
  <input type="hidden" value="${item.dprice }" name="dprice"/>
  DetailController의 "/detail/{pno}"으로 넘김 --%>
    
  </form>
  </c:forEach>
   </div>
	
   <c:forEach var="list" items="${replylist}">
    
     <c:if test="${ member.no != list.no && member.no!=1 }">
     <p>${ list.rcontent}<br>  작성자 : ${list.nickname }</p>
     <hr>
     </c:if>
     
     <!-- 현재 접속중인 사람과 댓글 작성자 비교 -->
    <c:if test="${ member.no == list.no || member.no==1 }"> 
       <p>${ list.rcontent}<br>  작성자 : ${list.nickname }</p>
     <a href="/replydelete2/${list.rno}?pno=${list.pno}">삭제하기</a>
     <a href="/replydetail2/${list.rno}">수정하기</a>
     <br>
     <hr>
     </c:if>
    
 
 
</c:forEach>

    </div>
    </div>
   </div>
    </div>   
      </div>
      
    </div>
   <script>
   function submitCheck() {
	   var rcontent = document.frm.rcontent.value;
	   if(rcontent.length == 0) {
			frm.rcontent.focus();
			return false;
		}
   
   }
   </script>
   
   
   
   <script type="text/javascript">
	   $('#bcount').on('keyup', function() {
		    if (/\D/.test(this.value)) {
		        this.value = this.value.replace(/\D/g, '')
		        this.value = 1;
		       
		    }
		    if (this.value == 0) {
		    	this.value = 1;
			}
		    if (this.value > ${stock}) {
			      this.value = ${stock};
			      
			  }
			});
   </script>
   
</body>
</html>
