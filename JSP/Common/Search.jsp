<%@page import="CommonDAL.CommonDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="CommonDAL.CommonDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String Keyword = request.getParameter("keyword");
Keyword = Keyword.replace("+", " ");
Keyword = "%" + Keyword + "%";

CommonDAO dao = new CommonDAO();
ArrayList<CommonDTO> list = dao.Search_Product(Keyword);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search</title>
<link rel="stylesheet" href="../../CSS/Category.css">
</head>
<header>
	<%@ include file="Header.jsp" %>
</header>
<body>
	<div id="Category">
		<% if(list.size() > 1) { %>
		
		<h2>검색 결과</h2>
		<div class="product-grid">
		<%  for(int i=0; i<list.size(); i++) {
			CommonDTO dto = list.get(i);
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
                <% } %>
            </div>
            <% }
				dao.JDBClose();
        	%>
            </div>
		</div>
		
		<div id="pagination">
        	<button id="prevPageButton" class="page-button" disabled>이전 페이지</button>
        	<span id="pageNumber">1</span>
        	<button id="nextPageButton" class="page-button">다음 페이지</button>
   		</div>
   		<% }else { %>
   			<p id="noSearch">검색결과가 없습니다!</p>
   		<%} %>
</body>
<footer>
	<%@ include file="Footer.jsp" %>
</footer>
 <script>
    document.addEventListener('DOMContentLoaded', function() {
        const productList = document.querySelector('#product-list');
        const prevPageButton = document.querySelector('#prevPageButton');
        const nextPageButton = document.querySelector('#nextPageButton');
        const pageNumber = document.querySelector('#pageNumber');
        let currentPage = 1;
        const productsPerPage = 12; // 한 페이지에 보여줄 상품 수

        // 현재 페이지의 상품 목록을 렌더링하는 함수
        function renderProducts(page) {
            productList.innerHTML = ''; // 기존 상품 목록을 지웁니다.
            const start = (page - 1) * productsPerPage;
            const end = page * productsPerPage;
            const currentProducts = products.slice(start, end);

            // 페이지 번호를 업데이트합니다.
            pageNumber.textContent = page;

            // 이전/다음 페이지 버튼의 활성화 상태를 업데이트합니다.
            prevPageButton.disabled = page === 1;
            nextPageButton.disabled = end >= products.length;
        }

        // 다음 페이지로 넘어가는 함수
        function nextPage() {
            if ((currentPage * productsPerPage) < products.length) {
                currentPage++;
                renderProducts(currentPage);
            }
        }

        // 이전 페이지로 돌아가는 함수
        function prevPage() {
            if (currentPage > 1) {
                currentPage--;
                renderProducts(currentPage);
            }
        }

        // 초기 상품 목록 렌더링
        renderProducts(currentPage);

        // 버튼 클릭 이벤트 리스너 추가
        nextPageButton.addEventListener('click', nextPage);
        prevPageButton.addEventListener('click', prevPage);
    });
</script>
</html>