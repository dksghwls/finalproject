<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

 <style>
    /* Set height of the grid so .sidenav can be 100% (adjust if needed) */
    .row.content {height: 1500px}
    
    /* Set gray background color and 100% height */
    .sidenav {
      background-color: #f1f1f1;
      height: 100%;
    }
    
    /* Set black background color, white text and some padding */
    footer {
      background-color: #555;
      color: white;
      padding: 15px;
    }
    
    /* On small screens, set height to 'auto' for sidenav and grid */
    @media screen and (max-width: 767px) {
      .sidenav {
        height: auto;
        padding: 15px;
      }
      .row.content {height: auto;} 
    }
    .row
      {
          background-color: white;
      }
    #imgbox img
      {
          margin: 10px;
          width: 300px;
      	  height: 300px;
      	 
      }
     #sidemenu
      {
          width: 300px;
      }
      #imgbox
      {
          width: 80%;
      }
      p
      {
      	margin: 10px;
      	position: relative;
        left: 10px;
      }
      #iimg
      {
      	margin-left: 10px;
      }
  </style>

</head>
<body>

<div class="container-fluid">
  <div class="row content">
    <div class="col-sm-3 sidenav" id="sidemenu">
     
      <ul class="nav nav-pills nav-stacked">
      <li class="active"><a href="../AllCategory">All Category</a></li>
      	<c:forEach var="item" items="${list }">
      	<li>
      		<a href="../AllCategory/${item.cno }">
      		${item.cname }</a>
      	</li>
      	</c:forEach>
        
      </ul><br>
    </div>
   
   <div id="imgbox" class="container">
   <div class="row">
      <c:forEach var="dto" items="${dto}">
      <div class="col-sm-3" id="iimg">

        <%-- <img src="resources/editor/multiupload/"+${ dto.imgname }><br> --%>
        <img alt="a" src="../img/Penguins.jpg">
        <p><c:out value="${dto.pno}"></c:out></p>
        <p><c:out value="${dto.pname}"></c:out></p>
        <p><c:out value="${dto.dprice}"></c:out></p>
        <p><c:out value="${dto.oprice}"></c:out></p><br>
        
      </div>   
      </c:forEach> 
      </div>
    </div>
  </div>
</div>
</body>
</html>