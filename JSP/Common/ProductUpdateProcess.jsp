<%@page import="SellerDAL.SellerDAO"%>
<%@page import="JDBC.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="java.util.*" %>

<%
	String uploadPath=application.getRealPath("/IMG");

	int size =10*1024*1024;
	String productNum="";
	String productName="";
	String productDetail="";
	String summary="";
	String price="";
	String sale="";
	String shopId="";
	String category="";
	String filename1="";
	String origfilename1="";
	
	try{
		MultipartRequest multi = new MultipartRequest
					(
						request,
						uploadPath,
						size,
						"UTF-8",
						new DefaultFileRenamePolicy()
					);
		
		Enumeration files = multi.getFileNames();
		
		productNum = multi.getParameter("productNum");
		productName = multi.getParameter("productName");
		productDetail = multi.getParameter("productDetail");
		summary = multi.getParameter("summary");
		price = multi.getParameter("price");
		sale = multi.getParameter("sale");
		shopId = multi.getParameter("shopId");
		category = multi.getParameter("category");
		
		String file1 = (String) files.nextElement();
		filename1=multi.getFilesystemName(file1);
		origfilename1 = multi.getOriginalFileName(filename1);
		
		String imageURL =  filename1;
		
		SellerDAO dao = new SellerDAO();
		int result = dao.Update_Product(productName, productDetail, summary, price, sale, category, productNum, imageURL);
		
		JSFunction js = new JSFunction();
		if(result == 1) {
			String link = "Product.jsp?ShopId=" + shopId;
			js.JSF(out, "상품 수정 완료", link);
		}else {
			String link = "ProductAdd.jsp?ShopId=" + shopId;
			js.JSF(out, "상품 수정 실패", link);
		}
	}catch(Exception e){
		e.printStackTrace();
	}
%>