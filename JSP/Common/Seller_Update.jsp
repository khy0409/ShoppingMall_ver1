<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
getCookies SellerMycookie = new getCookies();
String SellerKey = SellerMycookie.getCookieValue(request, "SellerKey");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Info Update</title>
<link rel="stylesheet" href="../../CSS/Global.css">
<link rel="stylesheet" href="../../CSS/Buyer_Update.css">
</head>
<header>
	<%@ include file="Header.jsp" %>
</header>
<body>
<div class="UpdateProfile">
    <div class="form-container">
        <h2>판매자 정보 수정</h2>
        <form action="Seller_UpdateProcess.jsp">
            <label for="SellerKey">Seller Key</label>
            <input type="text" id="SellerKey" name="SellerKey" readonly value="<%= SellerKey %>">
            
            <label for="Business">Business Number</label>
            <input type="text" id="Business" name="Business">
            
            <label for="ID">Seller ID</label>
            <input type="text" id="ID" name="ID">
            
            <label for="Password">Password</label>
            <input type="password" id="Password" name="Password">
            
            <label for="Email">Email</label>
            <input type="email" id="Email" name="Email">
            
            <label for="Phone">Phone</label>
            <input type="tel" id="Tell" name="Tell" pattern="\d{3}-\d{4}-\d{4}" title="Format: 123-456-7890">
            
            <input type="submit" value="Update">
        </form>
        <a href="SellerMyPage.jsp">마이페이지로 돌아가기</a>
    </div>
</div>
</body>
<footer>
	<%@ include file="Footer.jsp" %>
</footer>
</html>