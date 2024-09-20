<%@page import="JDBC.JSFunction"%>
<%@page import="SellerDAL.SellerDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String SellerKey = request.getParameter("SellerKey");
String Business = request.getParameter("Business");
String SellerId = request.getParameter("ID");
String SellerPw = request.getParameter("Password");
String Email = request.getParameter("Email");
String Tell = request.getParameter("Tell");

SellerDAO dao = new SellerDAO();
int result = dao.Update_SellerInfo(SellerKey, Business, SellerId, SellerPw, Email, Tell);

JSFunction js = new JSFunction();
if(result == 1) {
	Cookie SellerKeyCookie = new Cookie("SellerKey", SellerKey);
	Cookie SellerIdCookie = new Cookie("SellerId", SellerId);
	
	SellerIdCookie.setMaxAge(24 * 60 * 60);
	SellerIdCookie.setPath("/");
	response.addCookie(SellerIdCookie);
	
	SellerKeyCookie.setMaxAge(24 * 60 * 60);	
	SellerKeyCookie.setPath("/");	
	response.addCookie(SellerKeyCookie);
	String link = "SellerMyPage.jsp";
	js.JSF(out, "수정 완료", link);
}else {
	String link = "Seller_Update.jsp";
	js.JSF(out, "수정 실패", link);
}
%>