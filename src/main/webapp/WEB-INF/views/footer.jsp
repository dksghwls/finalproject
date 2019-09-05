<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#MOVE_TOP_BTN {
    position: fixed;
    right: 2%;
    bottom: 95px;
    display: none;
    z-index: 999;
    color:black;
}
</style>
</head>
<script>
    $(function() {
        $(window).scroll(function() {
            if ($(this).scrollTop() > 50) {
                $('#MOVE_TOP_BTN').fadeIn();
            } else {
                $('#MOVE_TOP_BTN').fadeOut();
            }
        });
        
        $("#MOVE_TOP_BTN").click(function() {
            $('html, body').animate({
                scrollTop : 0
            }, 50);
            return false;
        });
    });
</script>
<body>
	<!-- top 버튼  -->
		<div>
		<a id="MOVE_TOP_BTN" href="#" ><img src="../img/up.png"></a>
		</div>
	<footer>
		<p>비트캠프 종로센터</p>
		<p>서울특별시 종로구 종로2가 종로 69 7층</p>
		<p><span class="glyphicon glyphicon-earphone"></span> 02-722-1481 <span class="glyphicon glyphicon-envelope"></span> bit@bitacademy.net</p>
	</footer>
	
</body>
</html>