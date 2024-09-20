<%@page import="JDBC.getCookies"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>Shopping Mall Header</title>
	<link rel="stylesheet" href="../../CSS/Header.css">
	<link rel="stylesheet" href="../../CSS/Global.css">
</head>
<body>
    <header class="site-header">
        <div class="left-section">
            <div class="header-container">
        		<h2><a href="Index.jsp">Rose Bloom</a></h2>
       			<nav class="menu">
					<ul>
                		<li><a href="Category.jsp?Category=Outer">Outer</a></li>
                		<li><a href="Category.jsp?Category=Top">Top</a></li>
                		<li><a href="Category.jsp?Category=Bottom">Bottom</a></li>
                		<li><a href="Category.jsp?Category=Set">Set</a></li>
                		<li><a href="Category.jsp?Category=Shoes">Shoes</a></li>
            		</ul>
        		</nav>
   			 </div>
       		</div>
       		
       <div class="right-section">
            <nav>
           		<nav class="top-nav">
                    <ul>
                        <li><a href="SignUp.jsp">회원가입</a></li>
                        <li><a href="SignIn.jsp">로그인</a></li>
                        <li class="has-submenu">
							<a href="#">고객센터</a>
                    		<ul class="submenu">
                        		<li><a href="Notice.jsp">공지사항</a></li>
                      			<li><a href="#">고객센터</a></li>
                    		</ul>
                		</li>
                    </ul>
                </nav>
                <ul id="HeaderIMG">
				    <% 
				    getCookies HeaderCookie = new getCookies();
				    String Buyer = HeaderCookie.getCookieValue(request, "BuyerId");
				    String Seller = HeaderCookie.getCookieValue(request, "SellerId");
				    if (Buyer == null && Seller != null) { %>
				        <li><a href="SellerMyPage.jsp"><img src="../../IMG/icon_user.png" alt="Mypage"></a></li>
				    <% } else if (Buyer != null || Buyer == null) { %>
				        <li><a href="BuyerMyPage.jsp"><img src="../../IMG/icon_user.png" alt="Mypage"></a></li>
				        <li><a href="Wish.jsp"><img src="../../IMG/icon_heart.png" alt="Cart"></a></li>
				        <li><a href="Cart.jsp"><img src="../../IMG/icon_cart.png" alt="Cart"></a></li>
				    <% } %>
				    <li>
				        <a href="#" id="searchIcon"><img src="../../IMG/icon_search.png" alt="Search" id="search"></a>
				        <div id="searchBox" class="search-box hidden">
				            <form id="searchForm" action="Search.jsp" method="get">
				                <input type="text" id="searchInput" name="keyword" placeholder="Search...">
				            </form>
				        </div>
				    </li>
				</ul>
            </nav>
        </div>
    </header>
</body>
<script>
	document.addEventListener('DOMContentLoaded', function() {
	    var customerService = document.querySelector('.has-submenu > a');
	    var submenu = document.querySelector('.has-submenu .submenu');
	
	    customerService.addEventListener('click', function(event) {
	        event.preventDefault(); // 기본 링크 동작을 방지
	        submenu.style.display = submenu.style.display === 'block' ? 'none' : 'block';
	    });
	});
	
	window.onload = function() {
	    var searchIcon = document.getElementById('searchIcon');
	    var searchBox = document.getElementById('searchBox');
	    var searchInput = document.getElementById('searchInput');

	    if (searchIcon && searchBox && searchInput) {
	        searchIcon.addEventListener('click', function(event) {
	            event.preventDefault(); // 기본 링크 동작 방지
	            if (searchBox.classList.contains('hidden')) {
	                searchBox.classList.remove('hidden');
	                searchBox.classList.add('visible');
	                searchInput.focus(); // 검색 입력 상자에 포커스 설정
	            } else {
	                searchBox.classList.remove('visible');
	                searchBox.classList.add('hidden');
	            }
	        });

	        searchInput.addEventListener('keypress', function(event) {
	            if (event.key === 'Enter') {
	                event.preventDefault(); // 폼의 기본 동작 방지
	                var query = searchInput.value.trim();
	                if (query.length > 0) {
	                    document.getElementById('searchForm').submit();
	                }
	            }
	        });
	    }
	};
</script>
</html>