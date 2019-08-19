<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="utf-8">
  <!-- Theme Made By www.w3schools.com - No Copyright -->
  <title></title>
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
  <style>
  body {
    font:'돋움',Dotum, Helvetica,Sans-serif;
    font-size:12px;
    line-height: 1.5;
    color: #f5f6f7;
  }
  p {font-size: 50px;}
  .margin {margin-top:120px;,
  margin-bottom: 120px;}
  .bg-1 { 
    background-color: #1abc9c; /* Green */
    color: #ffffff;
  }
  .bg-2 { 
    background-color: #474e5d; /* Dark Blue */
    color: #ffffff;
  }
  .bg-3 { 
    background-color: #ffffff; /* White */
    color: #555555;
  }

  </style>
</head>
<body>


<!-- Second Container -->
<div class="container-fluid bg-2 text-center">
  <h3 class="margin">Help Center</h3>
  <p>전체 검색 </p>
  <a href="#" class="btn btn-default btn-lg">
    <span class="glyphicon glyphicon-search"></span> Search
  </a>
</div>

<!-- Third Container (Grid) -->
<div class="container-fluid bg-3 text-center">    
  <h3 class="margin">무엇을 찾고 있나요?</h3><br>
  <div class="row">
    <div class="col-sm-4">
      <p>FAQ</p>
      <a href="/faq"><img src="birds1.jpg" class="img-responsive margin" style="width:100%" alt="Image"></a>
    </div>
    <div class="col-sm-4"> 
      <p>회원문의</p>
      <img src="birds2.jpg" class="img-responsive margin" style="width:100%" alt="Image">
    </div>
    <div class="col-sm-4"> 
      <p>주문문의</p>
      <img src="birds3.jpg" class="img-responsive margin" style="width:100%" alt="Image">
    </div>
  </div>
</div>

</body>
</html>