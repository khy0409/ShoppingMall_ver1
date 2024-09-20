<%@page import="CommonDAL.CommonDTO"%>
<%@page import="CommonDAL.CommonDAO"%>
<%@page import="BuyerDAL.BuyerDTO"%>
<%@page import="BuyerDAL.BuyerDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
getCookies cookieLogin = new getCookies();
cookieLogin.getCookieValue(request, "BuyerId");

Cookie[] cookies = request.getCookies();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cart</title>
<link rel="stylesheet" href="../../CSS/Global.css">
<link rel="stylesheet" href="../../CSS/Cart.css">
</head>
<header>
	<%@ include file = "../Common/Header.jsp" %>
</header>
<body>
	<%@ include file="../Common/LoginCheck.jsp" %>
    <div id="CartTitleWrapper">
        <p>장바구니</p>
    </div>
	<div id="CartWrapper">
        <div id="Cart">
            <form id="Products" name="Products" method="post" action="Order.jsp">
                <div class="product-list">
                    	<% 
                        for (Cookie cookie : cookies) {
                        	String value = cookie.getValue();
                        	CommonDAO dao = new CommonDAO();
                        	CommonDTO dto = dao.Product_Detail(value);
                        	if(dto.getProductNm() != null) {
                        %>
                    <div class="product-info">
                        <input type="checkbox" class="Order" name="Order" value="<%=dto.getProductNum()%>">
                        <div class="flex">
                        <a href="Detail.jsp?ProductNum=<%=dto.getProductNum()%>"><img src="../../IMG/<%= dto.getImageURL() %>" class="Pimg"></a><br/>
                        <div class="info-text">
                            <strong><%= dto.getProductNm() %></strong>
                            <% 
				            int Cost = 0;
				            if(dto.getSale() != 0) {
				            	int Price = dto.getPrice();
				            	double Sale = dto.getSale();
				            	Cost = (int)Math.round(Price * (100 - Sale) / 100);	
				            }
				            %>
				            <p class="NoBr price">할인가 : <%= dto.getSale()== 0 ? dto.getPrice() : Cost %></p><br>
				            <p class="Summary"><%= dto.getSummary() %></p><br>
                        </div>
                        </div>
                        <div class="info-text">
                            <button type="button" class="delete-btn">X</button>
                            <div class="quantity-controls">
                                <button type="button" class="minus-btn">-</button>
                                <span class="current-quantity">1</span>
                                <button type="button" class="plus-btn">+</button>
                            </div>
                        </div>
                    </div>
                </div>
                    <% } }%>
                    <input type="hidden" value="cart" name="ty" >
                <input type="submit" value="선택 상품 주문" id="OrderBtn">
            </form>
        </div>
        <div class="summary-box">
            <p>Total Price: <span>10000</span></p>
            <p>Shipping Fee: <span>2000</span></p>
            <p>Total Payment: <span>12000</span></p>
        </div>
    </div>
</body>
<footer>
	<%@ include file="../Common/Footer.jsp" %>
</footer>
<script>
document.querySelectorAll('.delete-btn').forEach(button => {
    button.addEventListener('click', function() {
        // Logic to remove item from cart
        console.log('Item deleted');
    });
});
</script>
</html>