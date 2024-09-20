<%@page import="CommonDAL.CommonDTO"%>
<%@page import="CommonDAL.CommonDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String ProductNum = request.getParameter("ProductNum");
CommonDAO dao = new CommonDAO();
CommonDTO dto = dao.Product_Detail(ProductNum);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Detail</title>
    <link rel="stylesheet" href="../../CSS/Global.css">
    <link rel="stylesheet" href="../../CSS/Detail.css">
</head>
<header>
	<%@ include file="Header.jsp" %>
</header>
<body>
    <div class="product-page">
    	<div class="flex">
        <img src="../../IMG/<%= dto.getImageURL() %>" id="IMGClass">
        <div class="product-info">
            <h2 class=""><%= dto.getProductNm() %></h2>
            <% if(dto.getSale() != 0) {
            	int Price = dto.getPrice();
            	double Sale = dto.getSale();
            	int Cost = (int)Math.round(Price * (100 - Sale) / 100);	
            %>
            <p class="NoBr price"><%= Price %></p>
            <p class="NoBr sale"><%= Sale %>%</p>
            <div class="pricing">
                <span>$ <%= Cost %></span><br/>
            <% } else {%>
            <div class="pricing">
                <span class="">$ <%= dto.getPrice() %></span><br/>
            <% }
            getCookies cookie = new getCookies();
            String BuyerId = cookie.getCookieValue(request, "BuyerId");
            
            if(BuyerId != null) {
            %>
                <button onclick="cart(<%= ProductNum%>)">Add to Cart</button>
                <button onclick="wish(<%= ProductNum%>)">Add to Wish</button>
            <% } %>
            </div>
        </div>
        </div>
        <p class="DetailSummary"><%= dto.getShopNm() %> <br/> <%= dto.getProductDetail() %></p>
    </div>
    </div>
</body>
<footer>
	<%@ include file="Footer.jsp" %>
</footer>
<script>
	function cart(productNum) {
		var link = "CartProcess.jsp?ProductNum=" + productNum;
		location.href = link;
	}
	
	function wish(productNum) {
		var link = "WishProcess.jsp?ProductNum=" + productNum;
		location.href = link;
		
	}
</script>
</html>