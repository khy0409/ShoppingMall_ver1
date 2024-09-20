<%@page import="JDBC.JSFunction"%>
<%@page import="JDBC.getCookies"%>
<%@page import="BuyerDAL.BuyerDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
getCookies cookie = new getCookies();
String BuyerId = cookie.getCookieValue(request, "BuyerId");
String ProductNum = request.getParameter("ProductNum");

BuyerDAO dao = new BuyerDAO();
int result = dao.set_wish(BuyerId, ProductNum);

if(result >= 1) {
	JSFunction js = new JSFunction();
	js.JSF(out, "추가 완료", "Wish.jsp");
}else {
	JSFunction js = new JSFunction();
	String link = "Detail.jsp?ProductNum=" + ProductNum;
	js.JSF(out, "추가 실패", link);
}
%>