package JDBC;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class getCookies {
		public String getCookieValue(HttpServletRequest request, String name) {
	        Cookie[] cookies = request.getCookies();
	        if (cookies != null) {
	            for (Cookie cookie : cookies) {
	                if (name.equals(cookie.getName())) {
	                    return cookie.getValue();
	                }
	            }
	        }
	        return null;
	    }
		
		
		 public void removeAllCookies(HttpServletRequest request, HttpServletResponse response) {
		        Cookie[] cookies = request.getCookies();

		        if (cookies != null) {
		            for (Cookie cookie : cookies) {
		                // 모든 쿠키 삭제 설정
		                cookie.setMaxAge(0); // 쿠키 만료 시간 0으로 설정
		                cookie.setPath("/"); // 애플리케이션 전체 경로에서 삭제되도록 설정
		                response.addCookie(cookie); // 응답에 추가하여 클라이언트에서 삭제하도록 함
		            }
		        }
		    }
		
	}