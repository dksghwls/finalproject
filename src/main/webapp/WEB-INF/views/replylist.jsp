<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
 <div role="tabpanel" class="tab-pane" id="reviewpage">
      
      <div class="drop">
  <div class="dropdown">
    <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">분류
    <span class="caret"></span></button>
    <ul class="dropdown-menu">
      <li><a href="#">컴퓨터</a></li>
      <li><a href="#">집가고 싶다</a></li>
      <li><a href="#">아무것도</a></li>
      <li><a href="#">하고 싶지 않음</a></li>      
    </ul>
  </div>

   </div>
  
   
    <div class="search">
      <input type="text" class="search" size="20" placeholder="Search" required> <button type="button" class="btn btn-danger">검색하기</button>  
    </div>
 

   <div class="row">
       <div class="col-xs-6"><textarea class="textarea" rows="5" id="textarea">리뷰작성</textarea>
       <c:forEach var="item" items="${rlist}">
       <c:out value="${item.rcontent }"></c:out>
       
       
       </c:forEach>
       </div>
   
    <!-- Trigger the modal with a button -->
<a href="/replyinsert"></a><button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">리뷰쓰기</button>
<!-- <div class="col-xs-6"><a href="/replyinsert">리뷰쓰기</a> -->
<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
      
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">리뷰를 입력하세요</h4>
      </div>
      <div class="modal-body">
      <!-- <form action="replyinsertresult" method="post">  -->
		
	 <jsp:include page="replyinsert.jsp"></jsp:include> 
		<%-- <input type="hidden" name="${_csrf.parameterName }"
				value="${_csrf.token }" /> --%>
		
	
       
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
   
   
   </div>
    </div>




</body>
</html>