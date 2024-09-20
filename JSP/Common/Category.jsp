<%@page import="CommonDAL.CommonDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="CommonDAL.CommonDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String Category = request.getParameter("Category");
String start = request.getParameter("start");
String end = request.getParameter("end");
String count = request.getParameter("count");

if (start == null) start = "1";
if (end == null) end = "12";
if (count == null) count = "1";

int Start = Integer.parseInt(start);
int End = Integer.parseInt(end);
int Count = Integer.parseInt(count);

CommonDAO getCategory = new CommonDAO();
ArrayList<CommonDTO> list = getCategory.getCategory(Category, Start, End);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%= Category %></title>
<link rel="stylesheet" href="../../CSS/Category.css">
</head>
<header>
	<%@ include file="Header.jsp" %>
</header>
<body>
	<div id="Category">
		<h2><%= Category %></h2>
		
		<div class="product-grid">
		<%  
		boolean check = false;
		for(int i=0; i<list.size(); i++) {
			CommonDTO dto = list.get(i);
			if(list.size() < 12) check = true;
		%>
            <div class="product-item">
            	<% if(dto.getSale() != 0) { %>
            	<img src="../../IMG/SaleIMG.png" alt="Sale" class="SaleImg">
            	<% } %>
                <a href="Detail.jsp?ProductNum=<%=dto.getProductNum() %>"><img src="../../IMG/<%=dto.getImageURL() %>" alt="<%= dto.getProductNm() %>" class="Pimg"></a><br/>
                <p class="NoBr name"><%= dto.getProductNm() %></p>
                <p class="NoBr star"><%= dto.getScope()==0 ? "" : dto.getScope() %></p><br/>
                <%  if(dto.getSale() != 0)  {
                	int Price = dto.getPrice();
                	double Sale = dto.getSale();
                	int Cost = (int)Math.round(Price * (100 - Sale) / 100);
                %>
                <p class="NoBr price">$ <%= dto.getPrice() %></p>
                <p class="NoBr sale">Sale <%= dto.getSale()%>%</p>
                <p class="cost">$<%= Cost %></p>
                <% }else { %>
                <p class="cost">$<%= dto.getPrice() %></p>
                <% }
                %>
            </div>
            <% }
			getCategory.JDBClose();
        	%>
            </div>
		</div>
		
		<div id="pagination">
        	<button id="prevPageButton" class="page-button" <%= Start==1 ? "disabled" : "" %> onclick="prevPages('<%=list.size()%>', '<%= Category %>', '<%=start%>', '<%= end %>', '<%= Count%>')">이전 페이지</button>
        	<span id="pageNumber"><%= Count %></span>
        	<button id="nextPageButton" class="page-button" <%= check ? "disabled" : "" %> onclick="nextPages('<%=list.size()%>', '<%= Category %>', '<%=start%>', '<%= end %>', <%= Count%>)">다음 페이지</button>
   		</div>
</body>
<footer>
	<%@ include file="Footer.jsp" %>
</footer>
<script>
		//다음 페이지로 넘어가는 함수
		function nextPages(listSize, category, start, end, count) {
			if ((start * end) <= listSize, category) {
				start++; 
		        start = 13 * (start-1);
		        end = (parseInt(end) + 13);
		        count++;
		        var link = "Category.jsp?start=" + start + "&end=" + end + "&Category=" + category + "&count=" + count;
		        location.href=link;
		    }
		}
	    // 이전 페이지로 돌아가는 함수
	    function prevPages(listSize, category, start, end, count) {
	        if (start > 1) {
	        	start--;
				start = start - (start - 1);
				end = (parseInt(end) - (start * 13));
	   		 	count--;
	            var link = "Category.jsp?start=" + start + "&end=" + end + "&Category=" + category + "&count=" + count;
	            location.href=link;
	        }
	    }
</script>
</html>