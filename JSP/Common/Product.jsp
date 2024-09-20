<%@page import="SellerDAL.SellerDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="SellerDAL.SellerDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String ShopId = request.getParameter("ShopId");
String sellerId = request.getParameter("sellerId");

SellerDAO dao = new SellerDAO();
ArrayList<SellerDTO> list = dao.get_MyProduct(ShopId);
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><%= ShopId %>의 상품들</title>
    <link rel="stylesheet" href="../../CSS/Product.css">
</head>
<header>
	<%@ include file="Header.jsp" %>
</header>
<body>
        <section class="product-list">
        <% for(int i=0; i<list.size(); i++) {
        	SellerDTO dto = list.get(i);
        	%>
            <article class="product-item">
                	<div>
                    <a href="ProductUpdate.jsp?ProductNum=<%= dto.getProductNum()%>&ShopId=<%=ShopId%>"><img src="../../IMG/<%= dto.getProfileImg() %>" alt="제품 이미지 1"></a>
                    <div class="product-details">
                        <h2><%= dto.getProductNm() %></h2>
                        <p>Price: <%= dto.getPrice() %>원</p>
                        <p>Sale: <%= dto.getSale()%>%</p>
                        <% if(dto.getSale() != 0)  {
                        	int Price = dto.getPrice();
                        	double Sale = dto.getSale();
                        	int Cost = (int)Math.round(Price * (100 - Sale) / 100);
                        %>
                        <p>Cost: <%= Cost %>
                        <% } %>
                        <p>Summary: <%= dto.getSummary() %></p>
                    </div>
                    </div>
            </article>
            <% } 
            if(list.size() == 0) {
            %>
            	<p id="noSearch">등록된 상품이 없습니다!</p>
            <% } %>
        </section>
        <a href="ProductAdd.jsp?ShopId=<%=ShopId%>" id="add">상품 추가하기</a>
</body>
<footer>
	<%@ include file="Footer.jsp" %>
</footer>
</html>