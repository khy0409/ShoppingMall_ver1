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
		                // ��� ��Ű ���� ����
		                cookie.setMaxAge(0); // ��Ű ���� �ð� 0���� ����
		                cookie.setPath("/"); // ���ø����̼� ��ü ��ο��� �����ǵ��� ����
		                response.addCookie(cookie); // ���信 �߰��Ͽ� Ŭ���̾�Ʈ���� �����ϵ��� ��
		            }
		        }
		    }
		
	}