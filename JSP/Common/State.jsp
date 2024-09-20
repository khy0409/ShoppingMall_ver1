<%@page import="JDBC.JSFunction"%>
<%@page import="SellerDAL.SellerDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String ItemId = request.getParameter("itemId");
SellerDAO dao = new SellerDAO();
int result = dao.Change_Status("Y", ItemId);

JSFunction js = new JSFunction();
if(result == 1) {
	js.JSF(out, "상태 변경 완료", "SellerMyPage.jsp");
}else {
	js.JSF(out, "상태 변경 실패", "SellerMyPage.jsp");
}
%>