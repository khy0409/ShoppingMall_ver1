<%@page import="JDBC.JSFunction"%>
<%@page import="JDBC.getCookies"%>
<%@page import="SellerDAL.SellerDAO"%>
<%@page import="java.security.SecureRandom"%>
<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign Up</title>
<link rel="stylesheet" href="../../CSS/Global.css">
<link rel="stylesheet" href="../../CSS/SignUp.css">
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
	<div class="SignUp">
	    <div class="form-container">
	        <h2>구매자 회원가입</h2>
	        <form action="SignUpProcess.jsp">
			    <label for="buyerId">Buyer ID</label>
			    <input type="text" id="buyerId" name="buyerId">
			    
			    <label for="buyerNick">Nickname</label>
			    <input type="text" id="buyerNick" name="buyerNick">
			    
			    <label for="buyerPw">Password</label>
			    <input type="password" id="buyerPw" name="buyerPw">
			    
			    <label for="email">Email</label>
			    <input type="email" id="email" name="email">
			    
			    <label for="tell">Phone</label>
			    <input type="tel" id="tell" name="tell" pattern="\d{3}-\d{4}-\d{4}" title="Format: 123-456-7890">
			    
			    <input type="submit" value="Register">
	        </form>
	        <a href="../Common/SignIn.jsp">구매자 로그인하러 가기</a>
	        <a href="https://kauth.kakao.com/oauth/authorize?client_id=3eeb51eeb0a9e3fa23bfa53caee0a951&redirect_uri=http://localhost:8081/ShoppingMall_ver3/callback.jsp&response_type=code&prompt=login">카카오 로그인/회원가입하러 가기</a>
	    </div>
	    <div class="form-container">
	    	<% 
	    		String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
		        SecureRandom random = new SecureRandom();
		        StringBuilder sb = new StringBuilder(6); // 6글자의 문자열을 생성할 준비
		        SellerDAO seller = new SellerDAO();
		        boolean result;
	    	do {
		        for (int i = 0; i < 8; i++) {
		            int randomIndex = random.nextInt(characters.length());
		            sb.append(characters.charAt(randomIndex));
		        }
		        String SellerKey = sb.toString();
		        result = seller.Check_SellerKey(SellerKey);
	    	} while (result);
	    	%>
	        <h2>판매자 회원가입</h2>
	        <form action="SignUpProcess.jsp">
				<label for="sellerKey">Seller Key</label>
				<input type="text" id="sellerKey" name="sellerKey" readonly value="<%= sb.toString()%>" title="중요">
				
				<label for="businessNum">Business Number</label>
				<input type="text" id="businessNum" name="businessNum">
				
				<label for="sellerId">Seller ID</label>
				<input type="text" id="sellerId" name="sellerId">
				
				<label for="sellerPw">Password</label>
				<input type="password" id="sellerPw" name="sellerPw">
				
				<label for="sellerEmail">Email</label>
				<input type="email" id="sellerEmail" name="sellerEmail">
				
				<label for="sellerTell">Phone</label>
				<input type="tel" id="sellerTell" name="sellerTell" pattern="\d{3}-\d{4}-\d{4}" title="Format: 123-456-7890">
				
	            <input type="submit" value="Register">
	        </form>
	        <a href="../Common/SignIn.jsp">판매자 로그인하러 가기</a>
	    </div>
	</div>
</body>
<footer>
	<%@ include file="Footer.jsp" %>
</footer>
</html>