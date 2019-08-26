<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script> 
  <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
  <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
  <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
  <script>
    $(document).ready(function(){
         
        
    $("#check_module").click(function(){
        var IMP = window.IMP; 
        IMP.init("imp64882191"); 
       
        IMP.request_pay({
            pg: 'inicis', 
           
            pay_method: 'card',
           
            merchant_uid: 'merchant_' + new Date().getTime(),
           
            name: '주문명:결제테스트',
            
            amount: 1000, 
            //가격 
            buyer_email: 'iamport@siot.do',
            buyer_name: '구매자이름',
            buyer_tel: '010-1234-5678',
            buyer_addr: '서울특별시 강남구 삼성동',
            buyer_postcode: '123-456',
            m_redirect_url: 'https://www.yourdomain.com/payments/complete'
            
        }, function (rsp) {
            console.log(rsp);
            if (rsp.success) {
                var msg = '결제가 완료되었습니다.';
                msg += '고유ID : ' + rsp.imp_uid;
                msg += '상점 거래ID : ' + rsp.merchant_uid;
                msg += '결제 금액 : ' + rsp.paid_amount;
                msg += '카드 승인번호 : ' + rsp.apply_num;
            } else {
                var msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
            }
            alert(msg);
        });
    });
});
    
       function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
      
      
      
    
    </script>

  <style>
    /* Remove the navbar's default margin-bottom and rounded borders */ 
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
    }
    
    /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
    .row.content {height: 450px}
    
    /* Set gray background color and 100% height */
    .sidenav {
      padding-top: 20px;
     /*  background-color: #f1f1f1; */
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
      .row.content {height:auto;} 
    }
   
     img
      {
          width: 200px;
          height: 200px;
          position: relative;
          left: 50px;
         
          
      }
      section
      {
          position: relative;
          left: 500px;
          top: 100px;
      }
     #addresinfo form
     {
     	position: relative;
		left:500px;
     }
     #sideorder
    {
   		 position: relative;
   		 right:100px;
    }
    #shopping
    {
    	position: relative;
		left:300px;
    }
    section h2
    {
    	position: relative;
		left:200px;
    }
    
  </style>
</head>
<body>
	<section>
	<c:forEach var="dto" items="${dto }">
        <h2>${dto.pname }</h2>
    </c:forEach>
   </section>
  <img src="img/Jellyfish.jpg" alt="a" id="shopping">   
   
  
<div class="container-fluid text-center" id="orderdetail">    
  <div class="row content">
    
    <div class="col-sm-8 text-left" id="addresinfo">
    <form action="payok" method="post">
    	<label for="name">이름</label><br>
    	<input type="text" class="form-control" name="name" placeholder="name" style="width: 700px;" ><br>
    	<label for="phone">전화번호</label><br>
    	<input type="text" id="phone" name="phone" placeholder="phone" class="form-control" style="width: 700px;"><br>
    	<label for="email">이메일</label><br>
    	<input type="email" id="email" name="email"  placeholder="email" class="form-control" style="width: 700px;" ><br>
           <input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" class="btn btn-primary btn-lg" >
           <input type="text" id="sample4_postcode" placeholder="우편번호" class="form-control" style="width: 700px;">
           <input type="text" id="sample4_roadAddress" placeholder="도로명주소" class="form-control" readonly="readonly" style="width: 700px;">
           <input type="hidden" id="sample4_jibunAddress" name="addr" placeholder="지번주소" class="form-control" style="width: 700px;">
           <span id="guide" style="color:#999;display:none"></span>
           <input type="text" id="sample4_detailAddress" name="addrdetail" placeholder="상세주소" class="form-control" style="width: 700px;">
           <input type="hidden" id="sample4_extraAddress" placeholder="참고항목" class="form-control" style="width: 700px;"><br><br>
    </form>
    </div>
    <div class="col-sm-2 sidenav" id="sideorder">
     <h3>Order Detail</h3>
      <p>운송 및 취급:택배</p>
      <c:forEach var="dto" items="${dto }">
      <p>총금액:${dto.dprice }</p>
      </c:forEach>
      <hr>
      <h3>결제수단</h3>
      <input type="radio" value="신용카드" checked>신용카드<br><br>   
    </div> 
     <!-- <div class="col-sm-2 sidenav">
      <div class="well">
        <p>ADS</p>
      </div>
      <div class="well">
        <p>ADS</p>
      </div>
    </div> -->
  </div>
<button type="button" class="btn btn-primary btn-lg" id="check_module">결제하기</button>
<br><br>

</div>
</body>
</html>