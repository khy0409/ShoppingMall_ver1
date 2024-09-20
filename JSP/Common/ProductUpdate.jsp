<%@page import="SellerDAL.SellerDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String ShopId = request.getParameter("ShopId");
String ProductNum = request.getParameter("ProductNum");
SellerDAO dao = new SellerDAO();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product Registration</title>
<link rel="stylesheet" href="../../CSS/Global.css">
<link rel="stylesheet" href="../../CSS/ProductAdd.css">
</head>
<header>
	<%@ include file="Header.jsp" %>
</header>
<body>
<div class="product-registration-form">
    <h2>상품 수정</h2>
    <form action="ProductUpdateProcess.jsp" method="post" enctype="multipart/form-data">
        <label for="productNum">Product Number</label>
        <input type="number" id="productNum" name="productNum" readonly value="<%= ProductNum %>">
        
        <label for="productName">Product Name</label>
        <input type="text" id="productName" name="productName">
        
        <label for="productDetail">Product Detail</label>
        <textarea id="productDetail" name="productDetail" rows="4" cols="50"></textarea>
        
        <label for="summary">Summary</label>
        <input type="text" id="summary" name="summary">
        
        <label for="price">Price</label>
        <input type="text" id="price" name="price">
        
        <label for="sale">Sale (%)</label>
        <input type="text" id="sale" name="sale">
        
        <label for="shopId">Shop ID</label>
        <input type="text" id="shopId" name="shopId" readonly value=<%=ShopId %>>
        
        <label for="category">Category</label>
        <input type="text" id="category" name="category">
        
        <label for="imageUpload">Upload Image</label>
        <input type="file" id="imageUpload" name="imageUpload" multiple accept="image/*">
        
       	<div id="submitBtn">
        <input type="submit" value="Register Product">
        </div>
    </form>
</div>
<footer>
	<%@ include file="Footer.jsp" %>
</footer>
</html>