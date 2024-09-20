<%@page import="JDBC.JSFunction"%>
<%@page import="BuyerDAL.BuyerDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String BuyerId = request.getParameter("BuyerId");
String BuyerNick = request.getParameter("BuyerNick");
String BuyerPw = request.getParameter("BuyerPw");
String Email = request.getParameter("Email");
String Tell = request.getParameter("Tell");

BuyerDAO dao = new BuyerDAO();
int result = dao.Update_BuyerInfo(BuyerNick, BuyerPw, Email, Tell, BuyerId);

JSFunction js = new JSFunction();
if(result == 1) {
	String link = "BuyerMyPage.jsp?BuyerId=" + BuyerId;
	js.JSF(out, "수정 완료", link);
}else {
	String link = "Buyer_Update.jsp?BuyerId=" + BuyerId;
	js.JSF(out, "수정 실패", link);
}
%>