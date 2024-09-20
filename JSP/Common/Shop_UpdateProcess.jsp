<%@page import="JDBC.JSFunction"%>
<%@page import="SellerDAL.SellerDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String ShopNm = request.getParameter("ShopNm");
String ShopDetail = request.getParameter("ShopDetail");
String ShopId = request.getParameter("ShopId");

SellerDAO dao = new SellerDAO();
int result = dao.Update_ShopInfo(ShopNm, ShopDetail, ShopId);

JSFunction js = new JSFunction();
if(result == 1) {
	String link = "SellerMyPage.jsp";
	js.JSF(out, "수정 완료", link);
}else {
	String link = "Shop_Update.jsp";
	js.JSF(out, "수정 실패", link);
}
%>