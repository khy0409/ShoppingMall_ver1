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
int result = dao.Delete_Wish(BuyerId, ProductNum);

JSFunction js = new JSFunction();
if(result == 1) {
	js.JSF(out, "주문 완료", "Wish.jsp");
}else {
	js.JSF(out, "주문 실패", "Wish.jsp");
}
%>