<%@page import="JDBC.getCookies"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
getCookies cookieLoginCheck = new getCookies();
if(cookieLoginCheck.getCookieValue(request, "BuyerId") == null && cookieLoginCheck.getCookieValue(request, "SellerId") == null) { %>
	<script>
		alert("로그인 해주세요");
		location.href = "SignIn.jsp";
	</script>
<%} %>
