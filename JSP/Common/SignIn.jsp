<%@page import="JDBC.JSFunction"%>
<%@page import="JDBC.getCookies"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign In</title>
</head>
<link rel="stylesheet" href="../../CSS/Global.css">
<link rel="stylesheet" href="../../CSS/SignIn.css">
</head>
<header>
	<%@ include file="Header.jsp" %>
</header>
<body>
	<%
	getCookies coo = new getCookies();
	JSFunction js = new JSFunction();
	if(coo.getCookieValue(request, "BuyerId") != null) { 
		js.JSF(out, "로그아웃해주세요", "BuyerMyPage.jsp");
	}else if(coo.getCookieValue(request, "SellerId") != null) {
		js.JSF(out, "로그아웃해주세요", "SellerMyPage.jsp");
	}
	%>
	<div class="SignIn">
	    <div class="form-container">
	        <h2>구매자 로그인</h2>
	        <form action="SignInProcess.jsp">
			    <label for="buyerId">Buyer ID</label>
			    <input type="text" id="buyerId" name="buyerId">
			    
			    <label for="buyerPw">Password</label>
			    <input type="password" id="buyerPw" name="buyerPw">
			    
			    <input type="submit" value="Login">
	        </form>
	        <a href="SignUp.jsp">구매자 회원가입하러 가기</a>
	        <a href="./Find.jsp" class="forgot-password-link">비밀번호를 잊어버리셨나요?</a>
	    </div>
	    <div class="form-container">
	    	<h2>판매자 로그인</h2>
	        <form action="SignInProcess.jsp">
				<label for="sellerId">Seller ID</label>
				<input type="text" id="sellerId" name="sellerId">
				
				<label for="sellerPw">Password</label>
				<input type="password" id="sellerPw" name="sellerPw">
				
	            <input type="submit" value="Login">
	        </form>
	        <a href="SignUp.jsp">판매자 회원가입하러 가기</a>
	        <a href="./Find.jsp" class="forgot-password-link">비밀번호를 잊어버리셨나요?</a>
	    </div>
	</div>
</body>
<footer>
	<%@ include file="Footer.jsp" %>
</footer>
</html>