<%@page import="SellerDAL.SellerDAO"%>
<%@page import="BuyerDAL.BuyerDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String BuyerId = request.getParameter("buyerId");

if(BuyerId != null) {
	BuyerId = request.getParameter("buyerId");
	String BuyerNick = request.getParameter("buyerNick");
	String BuyerPw = request.getParameter("buyerPw");
	String Email = request.getParameter("email");
	String Tell = request.getParameter("tell");
	
	BuyerDAO buyer = new BuyerDAO();
	int result = buyer.Buyer_SignUp(BuyerId, BuyerNick, BuyerPw, Email, Tell);
	
	buyer.JDBClose();
	
	if(result == 1) { %>
		<script>
			alert("회원가입 완료");
			location.href = "SignIn.jsp";
		</script>
	<%}else {%>
		<script>
			alert("회원가입 실패");
			location.href = "SignUp.jsp";
		</script>
	<%}
} else {
	String SellerKey = request.getParameter("sellerKey");
	String BusinessNum = request.getParameter("businessNum");
	String SellerId = request.getParameter("sellerId");
	String SellerPw = request.getParameter("sellerPw");
	String Email = request.getParameter("sellerEmail");
	String Tell = request.getParameter("sellerTell");
	
	SellerDAO seller = new SellerDAO();
	int result = seller.Seller_SignUp(SellerKey, BusinessNum, SellerId, SellerPw, Email, Tell);
	
	seller.JDBClose();
	if(result == 1) { %>
	<script>
		alert("회원가입 완료");
		location.href = "SignIn.jsp";
	</script>
<%}else {%>
	<script>
		alert("회원가입 실패");
		location.href = "SignUp.jsp";
	</script>
<%} }
%>