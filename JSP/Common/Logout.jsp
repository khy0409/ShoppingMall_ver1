<%@page import="JDBC.JSFunction"%>
<%@page import="JDBC.getCookies"%>
<%@page import="BuyerDAL.BuyerDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	getCookies coo = new getCookies();
	coo.removeAllCookies(request, response);
	JSFunction js = new JSFunction();
	js.JSF(out, "로그아웃 성공", "../Common/Index.jsp");
%>