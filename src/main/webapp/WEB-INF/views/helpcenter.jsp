<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<!-- Theme Made By www.w3schools.com - No Copyright -->
<title></title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Montserrat"
	rel="stylesheet">

<style>
body {
	font: '돋움', Dotum, Helvetica, Sans-serif;
	line-height: 1.5;
	color: #f5f6f7;
}

p {
	font-size: 50px;
}

.margin {
	margin-bottom: 120px;
}

.bg-2 {
	/* background-color: #474e5d; /* Dark Blue */
	/* color: #ffffff;  */
	color: black;
}

.bg-3 {
	background-color: #ffffff; /* White */
	color: black;
}

.helppsize {
	font-size: 15px;
	color: gray;
}
</style>
</head>
<body>


	<!-- Second Container -->
	<div class="container-fluid bg-2 text-center">
		<h3 class="margin">사람들이 시작하는 오늘의 혜택</h3>
		<p>Help Center</p>
		<a href="#" class="btn btn-default btn-lg"> <span
			class="glyphicon glyphicon-search"></span> Search
		</a>
	</div>

	<!-- Third Container (Grid) -->
	<div class="container-fluid bg-3 text-center">
		<h3 class="margin"></h3>
		<br>
		<div class="row">
			<div class="col-sm-4">
				<p>FAQ</p>
				<p class="helppsize">자주 묻는 질문을 모아둔 페이지입니다.</p>
				<br> <a href="/faq" data-toggle="tooltip" title="Click!"><img
					src="img/Jellyfish.jpg" class="img-responsive margin"
					style="width: 100%" alt="Image"></a>
			</div>
			<div class="col-sm-4">
				<p>Contact Us</p>
				<p class="helppsize">원하는 질문이 없다면 이 페이지를 이용하세요.</p>
				<br> <a href="/contact" data-toggle="tooltip" title="Click!"><img
					src="img/Jellyfish.jpg" class="img-responsive margin"
					style="width: 100%" alt="Image"></a>
			</div>
			<div class="col-sm-4">
				<p>Map</p>
				<p class="helppsize">오시는 길을 검색할 수 있습니다.</p>
				<br> <a href="#" data-toggle="tooltip" title="Click!"><img
					src="img/Jellyfish.jpg" class="img-responsive margin"
					style="width: 100%" alt="Image"></a>
			</div>
		</div>
	</div>

</body>
</html>