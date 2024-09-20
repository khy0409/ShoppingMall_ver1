<%@page import="CommonDAL.CommonDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="CommonDAL.CommonDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String category = request.getParameter("BCategory");
if(category == null || category == "") category = "Outer";

CommonDAO BestP = new CommonDAO();
ArrayList<CommonDTO> list = BestP.BestProduct(category);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Best Product</title>
    <link rel="stylesheet" href="../../CSS/Best.css">
</head>
<body>
    <div id="Bests">
        <h2>Best</h2>
        <div class="flex">
        <div class="BestMenu">
		    <a class="BestCategory" id="<%=category.equals("Outer") ? "Select" : "" %>" id="Outer" href="Index.jsp?BCategory=Outer">#Outer</a>
		    <a class="BestCategory" id="<%=category.equals("Top") ? "Select" : "" %>" id="Top" href="Index.jsp?BCategory=Top">#Top</a>
		    <a class="BestCategory" id="<%=category.equals("Bottom") ? "Select" : "" %>" id="Bottom" href="Index.jsp?BCategory=Bottom">#Bottom</a>
		    <a class="BestCategory" id="<%=category.equals("Set") ? "Select" : "" %>" id="Set" href="Index.jsp?BCategory=Set">#Set</a>
		    <a class="BestCategory" id="<%=category.equals("Shoes") ? "Select" : "" %>" id="Shoes" href="Index.jsp?BCategory=Shoes">#Shoes</a>
		</div>
		
        <div class="Bproduct-grid">
        	<% for(int i=0; i<list.size() && i<=3; i++) {
        		CommonDTO dto = list.get(i);
        	%>
            <div class="Bproduct-item">
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
        	BestP.JDBClose();
        	%>
		</div>
        </div>
    </div>
</body>
</html>