package CommonDAL;

import java.util.ArrayList;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import JDBC.JDBConnect;

public class CommonDAO extends JDBConnect{
	
	//Get Best Product(Category O)
	public ArrayList<CommonDTO> BestProduct(String Cate) {
		ArrayList<CommonDTO> list = new ArrayList<CommonDTO>();
		try {
			pstmt = null;
				String query = "select distinct p.productNum, p.productNM, p.summary, p.price, p.sale,"
						+ " i.ImageURL"
						+ " from product p, review r, productImg i"
						+ " where p.productNum = i.productNum"
						+ " and category = '" + Cate + "'";
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			while(rs.next()) {
				CommonDTO dto = new CommonDTO();
				dto.setProductNum(rs.getInt(1));
				dto.setProductNm(rs.getString(2));
				dto.setSummary(rs.getString(3));
				dto.setPrice(rs.getInt(4));
				dto.setSale(rs.getDouble(5));
				dto.setImageURL(rs.getString(6));
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	//Get New Product(Category X)
	public ArrayList<CommonDTO> NewProduct() {
		ArrayList<CommonDTO> list = new ArrayList<>();
		String query = "select distinct p.productNum, p.productNM, p.summary,"
				+ " p.price, p.sale,"
				+ " i.ImageURL, i.isPrimary, p.ProductNum, p.rdate"
				+ " from product p, review r, productImg i"
				+ " where p.ProductNum = r.productNum"
				+ " and p.productNum = i.productNum"
				+ " order by p.rdate desc";
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			while(rs.next()) {
				CommonDTO dto = new CommonDTO();
				dto.setProductNum(rs.getInt(1));
				dto.setProductNm(rs.getString(2));
				dto.setSummary(rs.getString(3));
				dto.setPrice(rs.getInt(4));
				dto.setSale(rs.getDouble(5));
				dto.setImageURL(rs.getString(6));
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	//Search Product
	public ArrayList<CommonDTO> Search_Product(String KeyWord) {
		ArrayList<CommonDTO> list = new ArrayList<>();
		try {
			String query = "select distinct p.ProductNm, p.Summary, p.Price, p.Sale, i.ImageUrl, i.IsPrimary from Product p, Review r, ProductImg i where p.ProductNum = r.ProductNum and p.ProductNum = i.ProductNum and upper(ProductNm) like upper(?)";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, KeyWord);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				CommonDTO dto = new CommonDTO();
				dto.setProductNm(rs.getString("ProductNm"));
				dto.setSummary(rs.getString("Summary"));
				dto.setPrice(rs.getInt("Price"));
				dto.setSale(rs.getDouble("Sale"));
				dto.setImageURL(rs.getString("ImageUrl"));
				dto.setIsPrimary(rs.getString("IsPrimary"));
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	//View Product Detail
	public CommonDTO Product_Detail(String ProductNum) {
		CommonDTO dto = new CommonDTO();
		try {
			String query = "select s.ShopNm, s.ProfileImg, p.Summary,"
					+ " p.ProductNm, p.Price, p.Sale, p.Category, TO_CHAR(p.ProductDetail) as productDetail,"
					+ " i.ImageURL"
					+ " from Shop s join Product p"
					+ " on s.ShopId = p.ShopId"
					+ " join ProductIMG i"
					+ " on p.ProductNum = i.ProductNum"
					+ " where p.ProductNum = ?"
					+ " group by s.ShopNm, s.ProfileImg, p.Summary,"
					+ " p.ProductNm, p.Price, p.Sale, p.Category, TO_CHAR(p.ProductDetail),"
					+ " i.ImageURL, i.IsPrimary"
					+ " order by i.IsPrimary desc";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, ProductNum);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setShopNm(rs.getString("ShopNm"));
				dto.setProfileImg(rs.getString("ProfileImg"));
				dto.setProductNm(rs.getString("ProductNm"));
				dto.setSummary(rs.getString("Summary"));
				dto.setPrice(rs.getInt("Price"));
				dto.setSale(rs.getDouble("Sale"));
				dto.setCategory(rs.getString("Category"));
				dto.setProductDetail(rs.getString("ProductDetail"));
				dto.setImageURL(rs.getString("ImageURL"));
				dto.setIsPrimary(rs.getString("IsPrimary"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	//Product Review Total Number
	public int Review_Total(String ProductNum) {
		int Total = 0;
		try {
			String query = "select count(ReviewNum) as Total"
					+ " from Review where ProductNum = ?";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, ProductNum);
			rs = pstmt.executeQuery();
			if(rs.next()) Total = rs.getInt("Total");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return Total;
	}
	
	//Product All Review
	public ArrayList<CommonDTO> Product_Reviews(int ProductNum) {
		ArrayList<CommonDTO> list = new ArrayList<>();
		try {
			String query = "select r.Review, r.Scope,"
					+ " b.BuyerId"
					+ " from Review r join Buyer b"
					+ " on r.BuyerId = b.BuyerId"
					+ " join Product p"
					+ " on r.ProductNum = p.ProductNum"
					+ " where p.ProductNum = ?";
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, ProductNum);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				CommonDTO dto = new CommonDTO();
				dto.setReview(rs.getString("Review"));
				dto.setScope(rs.getInt("Scope"));
				dto.setBuyerId(rs.getString("BuyerId"));
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	//View Product(Category O)
	public ArrayList<CommonDTO> getCategory(String category, int start, int end) {
	    ArrayList<CommonDTO> list = new ArrayList<CommonDTO>();
	    try {
	    	String query = "SELECT * FROM"
	    			+ " (SELECT p.productNum, p.productNM,"
	    			+ " p.summary, p.price, p.sale,"
	    			+ " i.ImageURL, ROWNUM AS rnum"
	    			+ " FROM product p, productImg i"
	    			+ " WHERE p.productNum = i.productNum"
	    			+ " AND category = '" + category + "')"
	    			+ " WHERE rnum BETWEEN " + start + " AND " + end;
	        stmt = con.createStatement();
	        rs = stmt.executeQuery(query);
	        System.out.println(query);
	        while (rs.next()) {
	            CommonDTO dto = new CommonDTO();
	            dto.setProductNum(rs.getInt("ProductNum"));
	            dto.setProductNm(rs.getString("ProductNm"));
	            dto.setSummary(rs.getString("Summary"));
	            dto.setPrice(rs.getInt("Price"));
	            dto.setSale(rs.getDouble("Sale"));
	            dto.setImageURL(rs.getString("ImageUrl"));
	            list.add(dto);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return list;
	}
	
	//Set Cookie
	public void setCookie(HttpServletResponse response, String Cname, String Cvalue, int day, int hour) {
		Cookie cookie = new Cookie(Cname, Cvalue);
		
		cookie.setMaxAge(day * hour * 60 * 60);
		
		response.addCookie(cookie);
	}
}
