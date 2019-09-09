<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#codingform form
{
	position: relative;
	left:600px;
}
</style>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="./resources/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"/>
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script>

<script type="text/javascript">
    $(function(){
        //전역변수
        var obj = [];              
        //스마트에디터 프레임생성
        nhn.husky.EZCreator.createInIFrame({
            oAppRef: obj,
            elPlaceHolder: "content",
            sSkinURI: "./resources/editor/SmartEditor2Skin.html",
            htParams : {
                // 툴바 사용 여부
                bUseToolbar : true,            
                // 입력창 크기 조절바 사용 여부
                bUseVerticalResizer : true,    
                // 모드 탭(Editor | HTML | TEXT) 사용 여부
                bUseModeChanger : true,
            }
        });
        
      //전송버튼
	    $("#insertBoard").click(function(){
	        //id가 smarteditor인 textarea에 에디터에서 대입
	        obj.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
	        //폼 submit
	        $("#insertBoardFrm").submit();
	    });
    });
    
    $(function(){
        $("#date3").datepicker({
            onSelect:function(dateText, inst) {
                console.log(dateText);
            }
        });
    });
</script>
</head>
<body>
	<div id="codingform">
	<form action="insertBoard" method="post" id="insertBoardFrm" enctype="multipart/form-data" onsubmit="return submitCheck()" name="frm" >
		카테고리:<select id="cno" name="cno" class="form-control" style="width: 700px;">
				<option value="1">시계
				<option value="2">스포츠용품
				<option value="3">컴퓨터
				<option value="4">사무용품
				<option value="5">악세사리
				<option value="6">의류/잡화
				<option value="7">건강식품
		</select><br>
		상품이름:<input type="text" name="pname" id="pname" class="form-control input-lg" style="width: 700px;"><br>
		원가:<input type="text" name="oprice" id="oprice" class="form-control input-lg" style="width: 700px;"><br>
		할인가:<input type="text" name="dprice" id="dprice" class="form-control input-lg" style="width: 700px;"><br>
		상품설명:<textarea name="content" id="content" class="form-control" style="width: 700px; height: 400px;"></textarea>
		<input type="text" name="deadline" id="date3" size="12" readonly="readonly"/>
		<input type="button" value="달력" onclick="$('#date3').datepicker('show');" /><br><br>
		재고:<input type="text" name="stock" class="form-control input-lg" style="width: 700px;">
		<input type="file" name="file1" id="file1" class="form-control input-lg" style="width: 700px;"><br>
		 <div id="result"></div>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
        <input type="button" id="insertBoard" value="등록" class="btn btn-primary btn-lg" />
	       
    </form>
    </div>
    <script>
    function submitCheck() {
    	var pname  = document.frm.pname.value; // 상품이름
    	var oprice  = document.frm.oprice.value; //원가
    	var dprice  = document.frm.dprice.value; //할인가
    	var content  = document.frm.content.value; //상품설명
    	var deadline  = document.frm.deadline.value; //마감일
    	var stock  = document.frm.stock.value; //재고수량
    	
    	if(pname.length == 0) {
			$('#result').text("상품명을 입력해주세요.");
			frm.pname.focus();
			return false;
		}
    	if(oprice.length == 0) {
			$('#result').text("원가를 입력해주세요.");
			frm.oprice.focus();
			return false;
		}
    	if(dprice.length == 0) {
			$('#result').text("할인가를 입력해주세요.");
			frm.dprice.focus();
			return false;
		}
    	
    	if(content.length == 0) {
			$('#result').text("원가를 입력해주세요.");
			frm.content.focus();
			return false;
		}
    	if(deadline.length == 0) {
			$('#result').text("원가를 입력해주세요.");
			frm.deadline.focus();
			return false;
		}
    	if(stock.length == 0) {
			$('#result').text("재고수량을 입력해주세요.");
			frm.stock.focus();
			return false;
		}
    	
    }
    </script>
</body>
</html>