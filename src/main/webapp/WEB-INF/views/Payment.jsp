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
  <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
  <script>
    $(document).ready(function(){
         
        
    $("#check_module").click(function(){
        var IMP = window.IMP; 
        IMP.init("imp64882191"); 
        
        /* ajax로 보낼 정보 */
        var no = ${no};
        console.log(no);
        var pno = ${pno};
        console.log(pno);
        var email = document.frm.email.value;
        console.log(email);
        var bcount = ${bcount};
        console.log(bcount);
        var sum = ${sum};
        console.log(sum);
        var name = document.frm.name.value;
        console.log(name);
        var phone = document.frm.phone.value;
        console.log(phone);
        var addr = document.frm.addr.value;
        console.log(addr);
        var detailaddr = document.frm.detailaddr.value;
        console.log(detailaddr);
        
        IMP.request_pay({
            pg: 'inicis', 
           
            pay_method: 'card',
           
            merchant_uid: 'merchant_' + new Date().getTime(),
           
			name: '${pname}',
            
            amount: ${sum}, 
            //가격 
            buyer_email: document.frm.email.value,
            buyer_name: document.frm.name.value,
            buyer_tel: document.frm.phone.value,
            buyer_addr: '서울특별시 강남구 삼성동',
            buyer_postcode: '123-456',
            m_redirect_url: 'https://www.yourdomain.com/payments/complete'
            
        }, function (rsp) {
            console.log(rsp);
            if (rsp.success) {
            	
            	/* ajax부분 예시 */
                $.ajax({
			        url : "/payok",
			        data : {"no" : no,
			        		"pno" : pno,
			        		"name" : name,
			        		"phone" : phone,
			        		"email" : email,
			        		"bcount" : bcount,
			        		"pay" : sum,
			        		"addr" : addr,
			        		"detailaddr" : detailaddr
			        }
			    });
            	
                location.href = "/paysuccess";
            } else {
            	
            	
            	 location.href = "/payfail";
            }
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
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
    }
    .row.content {height: 450px}
    .sidenav {
      padding-top: 20px;
      height: 100%;
    }

    @media screen and (max-width: 767px) {
      .sidenav {
        height: auto;
        padding: 15px;
      }
      .row.content
       {height:auto;} 
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
     #orderdetail
     {
     	position: relative;
		left:500px;
     }
     #sideorder
    {
   		 position: relative;
   		 right:100px;
    }
    section h2
    {
    	position: relative;
		left:500px;
    }
    
  </style>
</head>
<body>

	<c:set var="member" value="${ sessionScope.user }"></c:set>
	
	<section>
	<c:forEach var="dto" items="${dto }">
        <h2>${dto.pname }</h2>
    </c:forEach>
   </section>
   <c:forEach var="dto" items="${dto }">
  <img src="${dto.imgname }" alt="a" id="shopping" style="width: 200px; height: 200px; position: relative; left: 500px;"> 
   </c:forEach>
  
<div class="container-fluid text-center" id="orderdetail">   
<form action="/payok" method="post" name="frm"> 
  <div class="col-sm-2 sidenav" id="sideorder">
     <h3>Order Detail</h3>
      <p>운송 및 취급:택배</p>
      <c:forEach var="dto" items="${dto }">
      <p>총금액:${ sum }</p>
      </c:forEach>
      <hr>
      <h3>결제수단</h3>
      <input type="radio" value="신용카드" checked>신용카드<br><br> 
      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
      <button type="button" class="btn btn-primary btn-lg" id="check_module">결제하기</button>
      
    </div> 
  <div class="row content">
    <div class="col-sm-8 text-left" id="addresinfo">
    <input type="hidden" name="no" value="${member.no }">
    <c:forEach var="dto" items="${dto }">
    	<input type="hidden" name="pno" value="${dto.pno }">
    <%-- 	<input type="hidden" name="pay" value="${dto.pay }"> --%>
    </c:forEach>
    	<input type="hidden" name="bcount" value="${bcount }">
    	<label for="name">이름</label><br>
    	<input type="text" class="form-control" name="name" placeholder="name" style="width: 700px;" value="${member.name }"><br>
    	<label for="phone">전화번호</label><br>
    	<input type="text" id="phone" name="phone" placeholder="phone" class="form-control" style="width: 700px;" value="${member.phone }"><br>
    	<label for="email">이메일</label><br>
    	<input type="email" id="email" name="email"  placeholder="email" class="form-control" style="width: 700px;" value="${member.email}" readonly="readonly" ><br>
           <input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" class="btn btn-primary btn-lg" >
           <input type="hidden" id="sample4_postcode" placeholder="우편번호" class="form-control" style="width: 700px;">
           <input type="text" name="addr" id="sample4_roadAddress" placeholder="도로명주소" class="form-control" readonly="readonly"  value="${member.addr}" style="width: 700px;">
           <input type="hidden" id="sample4_jibunAddress"  placeholder="지번주소" class="form-control" style="width: 700px;">
           <span id="guide" style="color:#999;display:none"></span>
           <input type="text" name="detailaddr" id="sample4_detailAddress" name="addrdetail" placeholder="상세주소" class="form-control" value="${member.detailaddr}" style="width: 700px;">
           <input type="hidden" id="sample4_extraAddress" placeholder="참고항목" class="form-control" style="width: 700px;"><br><br>
  
    </div>
  </div>
</form>
<br><br>
</div>
</body>
</html>