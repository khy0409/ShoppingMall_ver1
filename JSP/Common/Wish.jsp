<%@page import="CommonDAL.CommonDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="BuyerDAL.BuyerDTO"%>
<%@page import="BuyerDAL.BuyerDAO"%>
<%@page import="JDBC.getCookies"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
getCookies coo = new getCookies();
String BuyerId = coo.getCookieValue(request, "BuyerId");
BuyerDAO daoo = new BuyerDAO();
ArrayList<BuyerDTO> listt = daoo.get_Wish(BuyerId);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Wish List</title>
<link rel="stylesheet" href="../../CSS/Global.css">
<link rel="stylesheet" href="../../CSS/Wish.css">
</head>
<header>
	<%@ include file="../Common/Header.jsp" %>
</header>
<body>
	<%@ include file = "../Common/LoginCheck.jsp" %>
	<div id="Wish">
		<div id="Info">
			<div id="Activity">
				<h2>나의 활동</h2>
				<nav>
					<a href="Cart.jsp">장바구니</a>
					<a href="Wish.jsp">위시리스트</a>
				</nav>
			</div>
			<div id="MyInfo">
				<h2>나의 정보</h2>
				<nav>
					<a href="Buyer_Update.jsp?BuyerId=<%=BuyerId%>">회원 정보 수정</a>
					<a href="Logout.jsp?buyerId='<%= BuyerId %>'">로그아웃</a>
					<br/>
					<a onclick="sec()">탈퇴</a>
				</nav>
			</div>
		</div>
		
		<div id="Check">
		    <h2>위시리스트</h2>
		    <hr class="thick"/>
		    	<form id="Products" name="Products" action="Order.jsp">
		    		<% for(int i=0; i<listt.size(); i++) {
		    		BuyerDTO dtoo = listt.get(i);
		    		%>
				    <div class="product-info">
				    	<input type="checkbox" id="ProductNum" name="ProductNum" value="<%= dtoo.getProductNum() %>">
                		<a href="Detail.jsp?ProductNum=<%= dtoo.getProductNum()%>"><img src="../../IMG/<%= dtoo.getImageURL() %>" alt="<%= dtoo.getProductNm() %>" class="square-image"></a><br/>
				        <div class="info-text">
				            <strong><%= dtoo.getProductNm() %></strong>
				            <% 
				            int Cost = 0;
				            if(dtoo.getSale() != 0) {
				            	int Price = dtoo.getPrice();
				            	double Sale = dtoo.getSale();
				            	Cost = (int)Math.round(Price * (100 - Sale) / 100);	
				            }
				            %>
				            <p class="NoBr price">할인가 : <%= dtoo.getSale()== 0 ? dtoo.getPrice() : Cost %></p><br>
				            <p class="Summary"><%= dtoo.getSummary() %></p><br>
				        </div>
				    </div>
				    <%} %>
				    <hr/>
					<input type="submit" value="선택 상품 주문" id="OrderBtn">
			 </form>
		</div>
	</div>
</body>
<footer>
	<%@ include file="../Common/Footer.jsp" %>
</footer>
<script>
	function sec() {
		var buyer = prompt("BuyerId를 입력하세요", "");
		var pass = prompt("Password를 입력하세요", "");
		
		var link = "Secession.jsp?buyerId=" + buyer + "&buyerPw=" + pass;
		location.href= link;
	}
</script>
</html>