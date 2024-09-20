<%@page import="SellerDAL.SellerDTO"%>
<%@page import="SellerDAL.SellerDAO"%>
<%@page import="BuyerDAL.BuyerDTO"%>
<%@page import="BuyerDAL.BuyerDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String BuyerId = request.getParameter("buyerId");

if(BuyerId != null) {
	BuyerId = request.getParameter("buyerId");
	String BuyerPw = request.getParameter("buyerPw");
	
	BuyerDAO buyer = new BuyerDAO();
	BuyerDTO buyerDto = buyer.Login_Buyer(BuyerId, BuyerPw);
	
	if(buyerDto.getBuyerId() != null) { 
		Cookie BuyerNickCookie = new Cookie("BuyerNick", buyerDto.getBuyerNick());
		
		BuyerNickCookie.setMaxAge(24 * 60 * 60);
		BuyerNickCookie.setPath("/");
		response.addCookie(BuyerNickCookie);
		
		Cookie BuyerIdCookie = new Cookie("BuyerId", buyerDto.getBuyerId());
		
		BuyerIdCookie.setMaxAge(24 * 60 * 60);
		BuyerIdCookie.setPath("/");
		response.addCookie(BuyerIdCookie);
		
		buyer.JDBClose();
	%>
		<script>
			alert("로그인 완료");
			location.href = "Index.jsp";
		</script>
	<%}else {%>
		<script>
			alert("로그인 실패");
			location.href = "SignIn.jsp";
		</script>
	<%}
} else {
	String SellerId = request.getParameter("sellerId");
	String SellerPw = request.getParameter("sellerPw");
	
	SellerDAO seller = new SellerDAO();
	SellerDTO sellerDto = seller.Login_Seller(SellerId, SellerPw);
	
	if(sellerDto.getSellerId() != null) {
		Cookie SellerKeyCookie = new Cookie("SellerKey", sellerDto.getSellerKey());
		Cookie SellerIdCookie = new Cookie("SellerId", sellerDto.getSellerId());
		
		SellerIdCookie.setMaxAge(24 * 60 * 60);
		SellerIdCookie.setPath("/");
		response.addCookie(SellerIdCookie);
		
		SellerKeyCookie.setMaxAge(24 * 60 * 60);	
		SellerKeyCookie.setPath("/");	
		response.addCookie(SellerKeyCookie);
		
		seller.JDBClose();
	%>
	<script>
		alert("로그인 완료");
		location.href = "Index.jsp";
	</script>
<%}else {%>
	<script>
		alert("로그인 실패");
		location.href = "SignIn.jsp";
	</script>
<%} }
%>