<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <style>
      .nav-link { 
          font-size: 20px;
        }
    </style>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
      <!--<div class="row">
        <div class="col">-->
         <div class="alert alert-primary">
          <h2>Administrator Page</h2>
         </div>
            <ul class="nav nav-pills">
      
          <li data-tab="member" class="nav-item" id="default">
                <a class="nav-link active" href="../adminpage">ȸ�� ����</a>
              </li>
              <li data-tab="goods" class="nav-item">
                <a class="nav-link" href="../goods">��ǰ ����</a>
              </li>
              <li data-tab="order" class="nav-item">
                <a class="nav-link" href="../order">�ֹ� ����</a>
              </li>
          </ul>
</div>
          
<div class="container">
  <h2>��� ���� ����</h2><br>
  <!-- <p>��� ���¸� �����Ͻʽÿ�.</p> -->
  <form action="../smodifyresult">
    <div class="form-group">
      <!--<label for="sel1">Select list (select one):</label>-->
      <select class="form-control" name="shipping" id="sel1" style="width: 300px;">
        <option value="��� �غ�">��� �غ�</option>
        <option value="��� ��">��� ��</option>
        <option value="��� �Ϸ�">��� �Ϸ�</option>
      </select>
    </div>
    <button type="submit" class="btn btn-info" name="bno" value="${bno }">����</button>
  	<a href="../order" class="btn btn-danger">���</a>
  </form>
  
</div>
</body>
</html>