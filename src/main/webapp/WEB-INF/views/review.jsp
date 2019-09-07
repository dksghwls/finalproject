<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Bootstrap Example</title>
  <meta charset="utf-8">
  <!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
  <!-- <link rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css"> -->
   
     <!--href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">-->
  <style>
      .t{
          width: 300px;
      }
      td{
          padding-top: 30px;
          vertical-align: bottom;
      }
      .s{
          margin-left: 40px;
          margin-bottom: 0px;
          line-height: 200%;
      }
      .nav-link { 
          font-size: 20px;
          font-weight: bold;
        }
        /* .p{
        	font-weight: bold;
        	font-size: 15px;
        } */
        .container{
       	margin: auto
       }
        p{
       	font-size: 15px;
       	margin-bottom: -25px;
       }
        #nick{
       	color: blue;
       }
       li{
       	font-size: 15px;
       }
       .sp{
       	font-weight: bold;
       }
       ul{
       	list-style:none;
   		padding-left:0px;
       }
       
       /* 추가 */
       .js-load {
    	display: none;
		}
		.js-load.active {
    	display: block;
		}
		.is_comp.js-load:after {
    	display: none;
		}
		.btn-wrap, .lists, .main {
    	display: block;
		}
		.btn-wrap {
    	text-align: center;
		}
		.button{
		color: white;
		}
       
  </style>
  <script>
  $(window).on('load', function () {
	    load('#js-load', '3');
	    $("#js-btn-wrap .btn").on("click", function () {
	        load('#js-load', '3', '#js-btn-wrap');
	    })
	});
	 
	function load(id, cnt, btn) {
	    var item_list = id + " .js-load:not(.active)";
	    var item_length = $(item_list).length;
	    var item_total_cnt;
	    if (cnt < item_length) {
	        item_total_cnt = cnt;
	    } else {
	        item_total_cnt = item_length;
	        $('.btn-wrap').hide();
	    }
	    $(item_list + ":lt(" + item_total_cnt + ")").addClass("active");
	}
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
                <a class="nav-link active" href="../mypage/${member.no}">나의 정보</a>
              </li>
              <li data-tab="product" class="nav-item">
                <a class="nav-link" href="../product?no=${member.no}">나의 주문 내역</a>
              </li>
              <li data-tab="product2" class="nav-item">
                <a class="nav-link" href="../cancellist?no=${member.no }">나의 취소 내역</a>
              </li>
              <li data-tab="product" class="nav-item">
                <a class="nav-link" data-toggle="tab" href="../review/${member.no}" style="background-color: #6799FF; color: #FFFFFF;">나의 리뷰</a>
              </li>

          </ul>
     <!-- </div> -->
          <br><br>
          
<!--<h2>마이 리뷰</h2>-->
<div class="container">
  <p><span id="nick">${member.nickname }</span> 님의 구매 상품 리뷰 모음입니다.</p>
  <br><br>
 
  <!--<ul>
    <li>-->
     <table id="js-load" class="main">
        <tbody class="lists">
        <c:forEach var="item" items="${dlist }">
         <tr class="lists__item js-load">
            <td class="t">
              <a href="../detail/${item.pno }"><img src="${item.imgname }" alt="Card image" class="img-rounded" width="300" height="192.66"></a>
            </td>
            <td>
            	<div class="s">
            		<%-- <p class="p">${item.pname}</p><br> --%>
            		<h3>${item.pname}</h3><br>
            		<ul>
        				<li><span class="sp">판매가: &nbsp;</span>${item.dprice}원</li>
        				<li><span class="sp">마감일: &nbsp;</span>${item.deadline}</li>
        			</ul>
        			<p class="rc">${item.rcontent}</p><br>
                </div>
            </td>
            </tr>
            </c:forEach>   
         </tbody>
    </table>
    <br><br>
   </div>
   <c:if test="${dlist!=null }">
   	<div id="js-btn-wrap" class="btn-wrap"><a href="javascript:;" class="btn btn-danger" style="width:300px">리뷰 더 보기</a></div>
   </c:if>
	<br><br>
  </div>
</body>
</html>