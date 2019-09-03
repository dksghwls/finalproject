<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
   <!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
    <title>Bootstrap 4</title>
    <!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css"> -->
    
     <style>
      .nav-link { 
          font-size: 22px;
        }
       .container{
       	margin: auto
       }
       .a{
       	font-weight: bold;
       	line-height: 40px;
       }
       .content{
       	font-size: 15px;
       	line-height: 40px;
       }
       p{
       	font-size: 15px;
       }
       #nick{
       	color: blue;
       }
    </style>
    <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script> -->
  
  <!-- <script>
	$(function() {
		// tab operation
		$('.nav-item').click(function() {
			var activeTab = $(this).attr('data-tab');
			/* $('li').css('background-color', 'white'); */
			$(this>'a').css("background-color", "skyblue");
			$.ajax({
				type : 'GET',                 //get방식으로 통신
				url : activeTab + ".html",    //탭의 data-tab속성의 값으로 된 html파일로 통신
				dataType : "html",            //html형식으로 값 읽기
				error : function() {          //통신 실패시
					alert('통신실패!');
				},
				success : function(data) {    //통신 성공시 탭 내용담는 div를 읽어들인 값으로 채운다.
					$('#tabcontent').html(data);
				}
			});
		});
		$('#default').click();          
	});
  </script>   -->
  
  </head>
<body>
	<c:set var="member" value="${ sessionScope.user }"></c:set>
	<%-- <c:if test="${ member != null }">
	</c:if> --%>
<div class="container">
      <!--<div class="row">
        <div class="col">-->
         <div class="alert alert-primary">
          <h1>My Page</h1>
         </div>
            <ul class="nav nav-pills">
      
          <li data-tab="info" class="nav-item">
                <a class="nav-link" href="../mypage/${member.no }">나의 정보</a>
              </li>
              <li data-tab="product" class="nav-item">
                <a class="nav-link" href="../product?no=${member.no }">나의 주문 내역</a>
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
          <!-- <div id="tabcontent"></div>
      </div> -->
	
<div class="container">
  <p><span id="nick">${member.nickname }</span> 님의 회원 정보입니다.</p>
  <br>            
  <table class="table table-striped">
    <!--<thead>
      <tr>
        <th>Firstname</th>
        <th>Lastname</th>
        <th>Email</th>
      </tr>
    </thead>-->
    <tbody>
    
   <c:forEach var="item" items="${mlist }">
      <tr>
        <td class="a"><div class="content">닉네임</div></td>
        <td><div class="content">${item.nickname }</div></td>
      </tr>
      <tr>
        <td class="a"><div class="content">이메일</div></td>
        <td><div class="content">${item.email }</div></td>
      </tr>
      <tr>
        <td class="a"><div class="content">이름</div></td>
        <td><div class="content">${item.name }</div></td>
      </tr>
      <tr>
        <td class="a"><div class="content">주소</div></td>
        <td><div class="content">${item.addr }</div></td>
      </tr>
      <tr>
        <td class="a"><div class="content">상세주소</div></td>
        <td><div class="content">${item.detailaddr }</div></td>
      </tr>
      <tr>
        <td class="a"><div class="content">전화번호</div></td>
        <td><div class="content">${item.phone }</div></td>
      </tr>
      
    </tbody>
  </table>
  <br>
  <button type="button" class="btn btn-info" onclick="location.href='../infomodify/${item.no}'">수정</button>
  <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#myModal">탈퇴</button>
  <br><br>
  <div class="modal fade" id="myModal">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">탈퇴 확인</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          정말로 탈퇴하시겠습니까?
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="location.href='../exit/${item.no }?email=${item.email }'">예</button>
          <a href="../mypage/${item.no }"><button type="button" class="btn btn-secondary" data-dismiss="modal">아니오</button></a>
         <%--  <a href="../mypage/${item.no }" class="btn btn-secondary" data-dismiss="modal">아니오</a> --%>
        </div>
        
      </div>
    </div>
  </div>
  </c:forEach>
</div>
</div>
</body>
</html>