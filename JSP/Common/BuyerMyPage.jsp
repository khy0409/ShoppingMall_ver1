<%@page import="JDBC.getCookies"%>
<%@page import="java.util.ArrayList"%>
<%@page import="BuyerDAL.BuyerDTO"%>
<%@page import="BuyerDAL.BuyerDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
getCookies BuyerMycookie = new getCookies();
String BuyerId = BuyerMycookie.getCookieValue(request, "BuyerId");
BuyerDAO dao = new BuyerDAO();
BuyerDTO dto = dao.Mypage_Buyer(BuyerId);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Page</title>
<link rel="stylesheet" href="../../CSS/Global.css">
<link rel="stylesheet" href="../../CSS/MyPage.css">
</head>
<header>
	<%@ include file="Header.jsp" %>
</header>
<body>
	<%@ include file = "LoginCheck.jsp" %>
	<div id="MyPage">
		<h2>마이페이지</h2>
		
		<div id="Info_box">
			<div id="User">
				<h3><%= dto.getBuyerNick() %>님</h3>
				<p>고객님의 등급은 <%=dto.getGrade() %>입니다</p>
				<p>다음 등급까지 필요 구매건수 <%= 15-dto.getTotalCnt() %>회</p>
			</div>
			<div id="Point">
				<a><img src="https://img.freepik.com/premium-vector/coins-icon_1076610-25020.jpg?w=900" alt="Order"></a>
				<h3><a><%= dto.getPoint() %>원</a></h3>
				<a>총 적립금</a>
			</div>
			<div id="Order">
				<a><img src="https://img.freepik.com/premium-vector/box-shipment-icon-outline_1076610-24815.jpg?w=740" alt="Order"></a>
				<h3><a><%= dto.getTotalCnt() %>개</a></h3>
				<a>총 주문건수</a>
			</div>
		</div>
		
		<div id="Section">
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
						<a href="Logout.jsp">로그아웃</a>
						<br/>
						<a onclick="sec()">탈퇴</a>
					</nav>
				</div>
			</div>
			<%
			BuyerDAO buyer = new BuyerDAO();
			ArrayList<BuyerDTO> list = buyer.MyOrder_List(BuyerId);
			%>
			<div id="Check">
			    <h2>주문내역 조회</h2>
			    <hr class="thick"/>
			    	<%  for(int i=0; i<list.size(); i++) { 
			    		dto = list.get(i);
			    	%>
				    <div class="product-info">
				        <div class="info-text">
				            <strong>주문번호 : <%= dto.getOrderId() %></strong><br/>
				            <strong><%= dto.getProductNm()%> 외 <%= dto.getTotalCnt()-1 %>건</strong>
				            <p class="Summary">총 가격 : <%= dto.getTotalPrice() %></p>
				            <p class="Summary">구매 날짜 : <%= dto.getOrderDate() %></p>
				        </div>
				    </div>
			    <hr/>
			    <%} %>
			</div>
		</div>
	</div>
	<% dao.JDBClose();
	buyer.JDBClose();
	%>
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