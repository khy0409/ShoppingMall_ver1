<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String BuyerId = request.getParameter("BuyerId");
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
        <h2>회원정보 수정</h2>
        <form action="Buyer_UpdateProcess.jsp">
            <label for="buyerId">Buyer ID</label>
            <input type="text" id="BuyerId" name="BuyerId" readonly value="<%= BuyerId %>">
            
            <label for="buyerNick">Nickname</label>
            <input type="text" id="BuyerNick" name="BuyerNick">
            
            <label for="buyerPw">New Password</label>
            <input type="password" id="BuyerPw" name="BuyerPw">
            
            <label for="email">Email</label>
            <input type="email" id="Email" name="Email">
            
            <label for="tell">Phone</label>
            <input type="tel" id="Tell" name="Tell" pattern="\d{3}-\d{4}-\d{4}" title="Format: 123-456-7890">
            
            <input type="submit" value="Update">
        </form>
        <a href="BuyerMyPage.jsp">마이페이지로 돌아가기</a>
    </div>
</div>
</body>
<footer>
	<%@ include file="Footer.jsp" %>
</footer>
</html>