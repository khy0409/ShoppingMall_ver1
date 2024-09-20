<%@page import="CommonDAL.CommonDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="CommonDAL.CommonDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
CommonDAO newP = new CommonDAO();
ArrayList<CommonDTO> lists = newP.NewProduct();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New Product</title>
<link rel="stylesheet" href="../../CSS/New.css">
</head>
<body>
	<div id="News">
        <h2>New</h2>
        
        <div class="Nproduct-grid">
        	<% for(int i=0; i<lists.size() && i<=7; i++) {
        		CommonDTO dto = lists.get(i);
        	%>
            <div class="Nproduct-item">
            	<% if(dto.getSale() != 0) {%>
            	<img src="../../IMG/SaleIMG.png" alt="Sale" class="SaleImg">
            	<%} %>
                <a href="Detail.jsp?ProductNum=<%=dto.getProductNum() %>"><img src="../../IMG/<%=dto.getImageURL() %>" alt="<%= dto.getProductNm() %>" class="Pimg"></a><br/>
                <p class="NoBr name"><%= dto.getProductNm() %></p>
                <p class="NoBr star"><%= dto.getScope()==0 ? "" : dto.getScope() %></p><br/>
                <%  if(dto.getSale() != 0)  {
                	int Price = dto.getPrice();
                	double Sale = dto.getSale();
                	int Cost = (int)Math.round(Price * (100 - Sale) / 100);
                %>
                <p class="NoBr price">$<%= dto.getPrice() %></p>
                <p class="NoBr sale">Sale <%= dto.getSale()%>%</p>
                <p class="cost">$<%= Cost %></p>
                <% }else { %>
                <p class="cost">$<%= dto.getPrice() %></p>
                <% } %>
            </div>
            <% }
        	newP.JDBClose();
        	%>
		</div>
    </div>
</body>
</html>