<%@page import="JDBC.JSFunction"%>
<%@page import="JDBC.getCookies"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
getCookies cookie = new getCookies();
String BuyerId = cookie.getCookieValue(request, "BuyerId");
String ProductNum = request.getParameter("ProductNum");

String name = "CartProduct" + ProductNum;
Cookie CookieProductNum = new Cookie(name, String.valueOf(ProductNum)); // ProductNum을 문자열로 변환하여 쿠키 값으로 설정

CookieProductNum.setMaxAge(24 * 60 * 60); // 쿠키의 유효 기간 설정 (예: 1일)
CookieProductNum.setPath("/"); // 쿠키의 유효 경로 설정 (루트 경로로 설정할 경우 전체 사이트에서 접근 가능)
response.addCookie(CookieProductNum); // 응답에 쿠키 추가

String Product = cookie.getCookieValue(request, name);

	JSFunction js = new JSFunction();
if(Product == null || Product == "") {
	js.JSF(out, "추가 성공", "Cart.jsp");
}else {
	String link = "Detail.jsp?ProductNum=" + ProductNum;
	js.JSF(out, "추가 실패", link);
}
%>