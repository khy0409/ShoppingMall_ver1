<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String ShopId = request.getParameter("ShopId");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Shop Info Update</title>
<link rel="stylesheet" href="../../CSS/Global.css">
<link rel="stylesheet" href="../../CSS/Buyer_Update.css">
</head>
<header>
	<%@ include file="Header.jsp" %>
</header>
<body>
<div class="UpdateProfile">
    <div class="form-container">
        <h2>상점 정보 수정</h2>
        <form action="Shop_UpdateProcess.jsp">
            <label for="ShopId">ShopId</label>
            <input type="text" id="ShopId" name="ShopId" readonly value="<%= ShopId %>">
            
            <label for="ShopNm">ShopNm</label>
            <input type="text" id="ShopNm" name="ShopNm">
            
            <label for="ShopDetail">ShopDetail</label>
            <input type="text" id="ShopDetail" name="ShopDetail">
            
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