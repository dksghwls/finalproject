<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<!-- Theme Made By www.w3schools.com - No Copyright -->
<title></title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 지도 api -->
<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=aaa8b0b5161046e37e60ed382cde1421"></script>
<link href="https://fonts.googleapis.com/css?family=Montserrat"
	rel="stylesheet">


<style>
	body {
		font: '돋움', Dotum, Helvetica, Sans-serif;
		line-height: 1.5;
		color: #f5f6f7;
		
	}	
	.p1{
	font-size: 50px;
	}
	
	.margin {
	margin-top: 10px;
	margin-bottom: 70px;
	 
		 
	}
	.searchform {
		margin-bottom: 50px;
		 
	}
	.bg-2 {
		/* background-color: #474e5d; /* Dark Blue */
		/* color: #ffffff;  */
		color: black;
		font-weight: 200px;
	}
	#helpcenterbg{
	background-image: url("img/helpmain.jpg");
  	background-size: 100%; 
  	background-repeat: no-repeat;
  	background-attachment: fixed;
     
	}
	
	.bg-3 {
		 
		background-color: #ffffff; /* White */
		color: black;
	}
	
	.helppsize {
		font-size: 15px;
		color: gray;
		margin : 20px 0px;
	}

	.btn-default:hover {
	background: #EFF5FB;
	}
	
 	.btn-lg:hover{
	background: #EFF5FB;
	}
	
	h3.margin{
	margin:35px;
	}
	
	 h1.margin{
	margin: 20px;
	 
	}  
	
	.col-sm-4{
	margin-bottom: 30px;
	}
	
	.trysearch{
		padding-top: 3px;
		padding-bottom: 6px;
	}
	
 	</style>
</head>
<body>
	<!-- Second Container -->
	<div class="container-fluid bg-2 text-center" id="helpcenterbg">
		<h1 class="margin">사람들이 시작하는 오늘의 혜택</h1>
		 <p class="p1">Help Center</p> 
		<br>
		<form method="get" action="faq?currPage=${page.startBlock }" class="searchform">
			<input type="hidden" name="search" value="all">
			 
					<input type="text"  class="trysearch" name="keyword">
			  		 
					<button class="btn btn-default" type="submit">
						<span class="glyphicon glyphicon-search"></span>
					</button>
		</form>
	</div>

	<!-- Third Container (Grid) -->
	<div class="container-fluid bg-3 text-center">
		<h3 class="margin"></h3>
		<br>
		<div class="row">
			<div class="col-sm-4">
				<p class="p1">FAQ</p>
				<p class="helppsize">자주 묻는 질문을 모아둔 페이지입니다.</p>
				<br> <a href="/faq" data-toggle="tooltip" title="Click FAQ!"><img
					src="img/test.jpg" class="img-responsive margin"
					style="width: 100%; height: 400px;"  alt="Image"></a>
			</div>
			<div class="col-sm-4">
				<p class="p1">Contact Us</p>
				<p class="helppsize">원하는 질문이 없다면 이 페이지를 이용하세요.</p>
				<br> 
				<sec:authorize access="isAnonymous()">
			   
		     <!-- Modal -->
  			<div class="modal fade" id="myModal4" role="dialog">
 		  	 <div class="modal-dialog modal-sm">
  		   	 <div class="modal-content">
   		     <div class="modal-header">
         	 <button type="button" class="close" data-dismiss="modal">&times;</button>
    	      <h4 class="modal-title">회원 문의글 페이지</h4>
     	 	  </div>
      	 	 <div class="modal-body">
     	    	 <p>로그인 후 이용해주세요^^</p>
      		  </div>
      		  <div class="modal-footer">
      		 <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      		  </div>
     		 </div>
    		</div>
  			</div>
  			<a href="#" data-toggle="modal" data-target="#myModal4"> 
					<img src="img/test.jpg"	class="img-responsive margin" 
					style="width: 100%; height: 400px;" alt="Image"></a>
  				</sec:authorize>
				<sec:authorize access="isAuthenticated()">
				<a href="/contact" data-toggle="tooltip" title="Click Contact Us!">
				<img src="img/test.jpg"	class="img-responsive margin" 
					style="width: 100%; height: 400px;" alt="Image"></a>
				</sec:authorize>
				   					
			</div>
			<div class="col-sm-4">
				<p class="p1">Map</p>
				<p class="helppsize">오시는 길을 검색할 수 있습니다.</p>
				<br>
				<div id="map" style="width: 500px; height: 400px;"></div>
			</div>
		</div>
	</div>
	<!-- 지도 api  -->
	<!-- 	
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(37.570493, 126.985315), // 지도의 중심좌표
			level : 1
		// 지도의 확대 레벨
		};

		var map = new kakao.maps.Map(mapContainer, mapOption);

		// 마커가 표시될 위치입니다 
		var markerPosition = new kakao.maps.LatLng(37.570493, 126.985315);

		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
			position : markerPosition
		});

		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);

		var iwContent = '<div style="padding:5px;">비트캠프 종로 <br><a href="https://map.kakao.com/link/to/비트캠프 종로,37.570493, 126.985315" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
		iwPosition = new kakao.maps.LatLng(37.570493, 126.985315); //인포윈도우 표시 위치입니다

		// 인포윈도우를 생성합니다
		var infowindow = new kakao.maps.InfoWindow({
			position : iwPosition,
			content : iwContent
		});

		// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
		infowindow.open(map, marker);
	</script> -->
</body>
</html>