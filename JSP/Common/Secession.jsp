<%@page import="JDBC.getCookies"%>
<%@page import="BuyerDAL.BuyerDAO"%>
<%@page import="SellerDAL.SellerDAO"%>
<%@page import="JDBC.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
JSFunction js = new JSFunction();
String BuyerId = request.getParameter("buyerId");
getCookies coo = new getCookies();

if(BuyerId == null) {
	String SellerKey = request.getParameter("sellerKey");
	String SellerPw = request.getParameter("sellerPw");
	SellerDAO dao = new SellerDAO();
	int result = dao.Seller_secession(SellerKey, SellerPw);
	
	if(result == 1) {
		coo.removeAllCookies(request, response);
		js.JSF(out, "탈퇴 완료", "Index.jsp");
	}else {
		js.JSF(out, "탈퇴 실패", "SellerMyPage.jsp");
	}
}else {
	String BuyerPw = request.getParameter("buyerPw");
	BuyerDAO dao = new BuyerDAO();
	int result = dao.Buyer_Secession(BuyerId, BuyerPw);
	
	if(result == 1) {
		js.JSF(out, "탈퇴 완료", "Index.jsp");
		coo.removeAllCookies(request, response);
	}else {
		js.JSF(out, "탈퇴 실패", "BuyerMyPage.jsp");
	}
}
%>