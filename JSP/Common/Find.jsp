<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Password Find</title>
<link rel="stylesheet" href="../../CSS/Global.css">
<link rel="stylesheet" href="../../CSS/SignIn.css">
</head>
<header>
	<%@ include file="Header.jsp" %>
</header>
<body>
	<div class="SignIn">
	    <div class="form-container">
	        <h2>구매자 로그인 정보 찾기</h2>
	        <form action="FindProcess.jsp" class="formId">
	        	<input type="radio" value="1" id="what" name="what"> Email, PW로 ID 찾기 <br/>
	        	<input type="radio" value="2" id="what" name="what"> Phone, PW로 ID 찾기 <br/>
	        	<input type="radio" value="3" id="what" name="what"> Email, ID로 PW 찾기 <br/>
	        	<input type="radio" value="4" id="what" name="what"> Phone, ID로 PW 찾기 <br/><br/>
				<label for="BuyerId">Email or Phone</label>
				<input type="text" id="BuyerId" name="BuyerId">
				<label for="BuyerPw">ID or PW</label>
				<input type="text" id="BuyerPw" name="BuyerPw">
				
	            <input type="submit" value="Find">
	        </form>
	        <a href="SignIn.jsp">로그인하러 가기</a>
	    </div>
	    <div class="form-container">
	    	<h2>판매자 로그인 정보 찾기</h2>
	        <form action="FindProcess.jsp" class="formId">
	        	<input type="radio" value="1" id="what" name="what"> SellerKey, PW로 ID 찾기 <br/>
	        	<input type="radio" value="2" id="what" name="what"> BusinessNum, PW로 ID 찾기 <br/>
	        	<input type="radio" value="3" id="what" name="what"> SellerKey, ID로 PW 찾기 <br/>
	        	<input type="radio" value="4" id="what" name="what"> BusinessNum, ID로 PW 찾기 <br/><br/>
				<label for="sellerId">SellerKey or BusinessNum</label>
				<input type="text" id="sellerId" name="sellerId">
				<label for="sellerPw">ID or PW</label>
				<input type="text" id="sellerPw" name="sellerPw">
				
	            <input type="submit" value="Find">
	        </form>
	        <a href="SignIn.jsp">로그인하러 가기</a>
	    </div>
	</div>
</body>
<footer>
	<%@ include file="Footer.jsp" %>
</footer>
</html>