<%@page import="SellerDAL.SellerDAO"%>
<%@page import="BuyerDAL.BuyerDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String check = request.getParameter("what");
String Id = request.getParameter("BuyerId"); //Email or Tell

if(check == null || check == "") { %>
	<script>
		alert("체크해주세요");
		location.href = "Find.jsp";
	</script>
<%}else {

if(Id != null) {
	BuyerDAO buyer = new BuyerDAO();
	String Find = null;
	String BuyerPw = null;
	if(check.equals("1")) {
		BuyerPw = request.getParameter("BuyerPw");
		Find = buyer.Forgot_BuyerId_Email(BuyerPw, Id);
	}else if(check.equals("2")) {
		BuyerPw = request.getParameter("BuyerPw");
		Find = buyer.Forgot_BuyerId_Tell(BuyerPw, Id);
	}else if(check.equals("3")) {
		BuyerPw = request.getParameter("BuyerPw");
		Find = buyer.Forgot_BuyerPw_Email(BuyerPw, Id);
	}else if(check.equals("4")) {
		BuyerPw = request.getParameter("BuyerPw");
		Find = buyer.Forgot_BuyerPw_Tell(BuyerPw, Id);
	}
	
	if(Find == null) { %>
		<script>
			alert("다시 입력해주세요");
			location.href = "Find.jsp";
		</script>
	<%}else { %>
		<script>
			alert("Find : <%=Find%>");
			location.href = "SignIn.jsp";
		</script>
	<%}
} else {
	SellerDAO seller = new SellerDAO();
	String Find = null;
	String SellerPw = null;
	Id = request.getParameter("sellerId");
	if(check.equals("1")) {
		SellerPw = request.getParameter("sellerPw");
		Find = seller.Forgot_SellerId_SellerKey(Id, SellerPw);
	}else if(check.equals("2")) {
		SellerPw = request.getParameter("sellerPw");
		Find = seller.Forgot_SellerId_BusinessNum(Id, SellerPw);
	}else if(check.equals("3")) {
		SellerPw = request.getParameter("sellerPw");
		Find = seller.Forgot_SellerPw_SellerKey(Id, SellerPw);
	}else if(check.equals("4")) {
		SellerPw = request.getParameter("sellerPw");
		Find = seller.Forgot_SellerPw_BusinessNum(Id, SellerPw);
	}
	
	if(Find == null) { %>
	<script>
		alert("다시 입력해주세요");
		location.href = "Find.jsp";
	</script>
<%}else { %>
	<script>
		alert("Find : <%=Find%>");
		location.href = "SignIn.jsp";
	</script>
<% }
}
} %>