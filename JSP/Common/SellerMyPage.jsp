<%@page import="SellerDAL.SellerDTO"%>
<%@page import="SellerDAL.SellerDAO"%>
<%@page import="JDBC.getCookies"%>
<%@page import="java.util.ArrayList"%>
<%@page import="BuyerDAL.BuyerDTO"%>
<%@page import="BuyerDAL.BuyerDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
getCookies SellerMycookie = new getCookies();
String SellerKey = SellerMycookie.getCookieValue(request, "SellerKey");
String ShopId = SellerMycookie.getCookieValue(request, "SellerId");
SellerDAO sellerDAO = new SellerDAO();
SellerDTO sellerDTO = sellerDAO.Mypage_Seller(SellerKey);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%= sellerDTO.getSellerId() %></title>
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
				<h3><%= sellerDTO.getSellerId() %>님</h3>
				<p>판매자님의 상점 : <%= sellerDTO.getShopNm() %></p>
			</div>
			<div id="Point">
				<a><img src="https://img.freepik.com/premium-vector/coins-icon_1076610-25020.jpg?w=900" alt="Order"></a>
				<h3><a><%= sellerDTO.getPrice() %>원</a></h3>
				<a>총 판매액</a>
			</div>
			<div id="Order">
				<a><img src="https://img.freepik.com/premium-vector/box-shipment-icon-outline_1076610-24815.jpg?w=740" alt="Order"></a>
				<h3><a><%= sellerDTO.getCnt() %>개</a></h3>
				<a>총 구매갯수</a>
			</div>
		</div>
		
		<div id="Section">
			<div id="Info">
				<div id="Activity">
					<h2>나의 상점</h2>
					<nav>
						<a href="Product.jsp?ShopId=<%=sellerDTO.getShopId()%>&sellerId=<%=sellerDTO.getSellerId()%>">상품 관리</a>
					</nav>
				</div>
				<div id="MyInfo">
					<h2>나의 정보</h2>
					<nav>
						<a href="Seller_Update.jsp?SellerKey=<%=SellerKey%>">판매자 정보 수정</a>
						<a href="Shop_Update.jsp?ShopId=<%=sellerDTO.getShopId()%>">상점 정보 수정</a>
						<a href="Logout.jsp">로그아웃</a>
						<br/>
						<a onclick="sec()">탈퇴</a>
					</nav>
				</div>
			</div>
			<%
			ArrayList<SellerDTO> list = sellerDAO.get_OrderList(sellerDTO.getShopId());
			%>
			<div id="Check">
			    <h2>주문내역 조회</h2>
			    <hr class="thick"/>
			    	<form action="State.jsp">
			    	<%  for(int i=0; i<list.size(); i++) { 
			    		sellerDTO = list.get(i);
			    	%>
				    <div class="product-info">
				        <div class="info-text">
				            <strong>주문번호 : <%= sellerDTO.getItemId() %></strong><br/>
				            <strong><%= sellerDTO.getProductNm()%> : <%= sellerDTO.getCnt() %>개</strong>
				            <p class="Summary">총 가격 : <%= sellerDTO.getPrice() %></p>
				            <p class="Summary">상태 : <%= sellerDTO.getStatus().equals("N") ? "상품 준비 중" : "판매완료" %></p>
					        <input type="button" value="상태 변경하기" onclick="status('<%= sellerDTO.getItemId() %>', '<%=sellerDTO.getStatus()%>')" class="submit-button">
				        </div>
				    </div>
				    </form>
			    <hr/>
			    <%} 
			    	sellerDAO.JDBClose();
			    %>
			</div>
		</div>
	</div>
</body>
<footer>
	<%@ include file="../Common/Footer.jsp" %>
</footer>
<script>
	function sec() {
		var seller = prompt("SellerKey를 입력하세요", "");
		var pass = prompt("Password를 입력하세요", "");
		
		var link = "Secession.jsp?sellerKey=" + seller + "&sellerPw=" + pass;
		location.href= link;
	}
	
	function status(itemid) {
		var link = "State.jsp?itemId=" + itemid;
		location.href= link;
	}
</script>
</html>