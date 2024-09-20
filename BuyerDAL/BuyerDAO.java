package BuyerDAL;


import java.util.ArrayList;

import JDBC.JDBConnect;

public class BuyerDAO extends JDBConnect{
	
	//Join Buyer
	public int Buyer_SignUp(String BuyerId, String BuyerNick, String BuyerPw, String Email, String Tell) {
		int result = 0;
		try {
			String query = "insert into Buyer values(?, ?, ?, ?, ?, 1000, 'Boronze')";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, BuyerId);
			pstmt.setString(2, BuyerNick);
			pstmt.setString(3, BuyerPw);
			pstmt.setString(4, Email);
			pstmt.setString(5, Tell);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//Login for Buyer
	public BuyerDTO Login_Buyer(String BuyerId, String BuyerPw) {
		BuyerDTO dto = new BuyerDTO();
		try {
			String query = "select BuyerId, BuyerNick"
					+ " from Buyer"
					+ " where BuyerId = ?"
					+ " and BuyerPw = ?";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, BuyerId);
			pstmt.setString(2, BuyerPw);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setBuyerId(rs.getString("BuyerId"));
				dto.setBuyerNick(rs.getString("BuyerNick"));
				dto.setCnt(rs.getInt("Total"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	
	//Forgot BuyerId, Search using BuyerPw & Email
	public String Forgot_BuyerId_Email(String BuyerPw, String Email) {
		String BuyerId = null;
		try {
			String query = "select BuyerId from Buyer where BuyerPw = ? and Email = ?";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, BuyerPw);
			pstmt.setString(2, Email);
			rs = pstmt.executeQuery();
			if(rs.next()) BuyerId = rs.getString("BuyerId");			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return BuyerId;
	}
	
	//Forgot BuyerId, Search using BuyerPw & Tell
	public String Forgot_BuyerId_Tell(String BuyerPw, String Tell) {
		String BuyerId = null;
		try {
			String query = "select BuyerId from Buyer where BuyerPw = ? and Tell = ?";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, BuyerPw);
			pstmt.setString(2, Tell);
			rs = pstmt.executeQuery();
			if(rs.next()) BuyerId = rs.getString("BuyerId");			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return BuyerId;
	}
	
	//Forgot BuyerPw, Search using BuyerId & Email
	public String Forgot_BuyerPw_Email(String BuyerId, String Email) {
		String BuyerPw = null;
		try {
			String query = "select BuyerPw from Buyer where BuyerId = ? and Email = ?";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, BuyerId);
			pstmt.setString(2, Email);
			rs = pstmt.executeQuery();
			if(rs.next()) BuyerPw = rs.getString("BuyerPw");			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return BuyerPw;
	}
	
	//Forgot BuyerPw, Search using BuyerId & Tell
	public String Forgot_BuyerPw_Tell(String BuyerId, String Tell) {
		String BuyerPw = null;
		try {
			String query = "select BuyerPw from Buyer where BuyerId = ? and Tell = ?";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, BuyerId);
			pstmt.setString(2, Tell);
			rs = pstmt.executeQuery();
			if(rs.next()) BuyerPw = rs.getString("BuyerPw");			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return BuyerPw;
	}
	//Update Seller Info
	public int Update_BuyerInfo(String BuyerNick, String BuyerPw, String Email, String Tell, String BuyerId) {
		int result = 0;
		try {
			String query = "update Buyer"
					+ " set BuyerNick = ?, BuyerPw = ?, Email = ?, Tell = ?"
					+ " where BuyerId = ?";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, BuyerNick);
			pstmt.setString(2, BuyerPw);
			pstmt.setString(3, Email);
			pstmt.setString(4, Tell);
			pstmt.setString(5, BuyerId);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//Buyer Secession
	public int Buyer_Secession(String BuyerId, String BuyerPw) {
		int result = 0;
		try {
			String query = "delete Buyer where BuyerId = ? and BuyerPw = ?";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, BuyerId);
			pstmt.setString(2, BuyerPw);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//Add_Review
	/*
	 * public int Add_Review(String Review, int ProductNum, String BuyerId, String
	 * ShopId, int scope) { int result = 0; try { String query =
	 * "insert into Review values(review_seq.nextval, ?, ?, ?, ?, ?)"; pstmt =
	 * con.prepareStatement(query); pstmt.setString(1, Review); pstmt.setInt(2,
	 * ProductNum); pstmt.setString(3, BuyerId); pstmt.setString(4, ShopId);
	 * pstmt.setInt(5, scope); result = pstmt.executeUpdate(); } catch (Exception e)
	 * { e.printStackTrace(); } return result; }
	 */
	
	//Update Review
	/*
	 * public int Update_Review(String Review, int Scope, int ReviewNum) { int
	 * result = 0; try { String query =
	 * "update Review set Review=?, scope=? where ReviewNum=?"; pstmt =
	 * con.prepareStatement(query); pstmt.setString(1, Review); pstmt.setInt(2,
	 * Scope); pstmt.setInt(3, ReviewNum); result = pstmt.executeUpdate(); } catch
	 * (Exception e) { e.printStackTrace(); } return result; }
	 */
	
	//Delete Review
	/*
	 * public int Delete_Review(int ReviewNum) { int result = 0; try { String query
	 * = "delete Review where ReviewNum = ?"; pstmt = con.prepareStatement(query);
	 * pstmt.setInt(1, ReviewNum); result = pstmt.executeUpdate(); } catch
	 * (Exception e) { e.printStackTrace(); } return result; }
	 */
	
	//Using Point
	/*
	 * public int Using_Point(int Minus_Point, String BuyerId) { int result = 0; try
	 * { String query = "update Review set Point=Point-? where BuyerId = ?"; pstmt =
	 * con.prepareStatement(query); pstmt.setInt(1, Minus_Point); pstmt.setString(2,
	 * BuyerId); result = pstmt.executeUpdate(); } catch (Exception e) {
	 * e.printStackTrace(); } return result; }
	 */
	
	//Getting Point
	public int Getting_Point(int Plus_Point, String BuyerId) {
		int result = 0;
		try {
			String qeury = "update Review set Point=Point+? where BuyerId = ?";
			pstmt = con.prepareStatement(qeury);
			pstmt.setInt(1, Plus_Point);
			pstmt.setString(2, BuyerId);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//View MyPage
	public BuyerDTO Mypage_Buyer(String BuyerId) {
		BuyerDTO dto = new BuyerDTO();
		try {
			String qeury = "select buyerid, BuyerNick, BuyerPw, Email,"
					+ " Tell, Point, Grade, sum(totalPrice) as Total, count(totalPrice) as Cnt"
					+ " from Buyer natural join OrderList"
					+ " where BuyerId = ?"
					+ " group by buyerid, BuyerNick,"
					+ " BuyerPw, Email, Tell, Point, Grade";
			pstmt = con.prepareStatement(qeury);
			pstmt.setString(1, BuyerId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setBuyerId(rs.getString("BuyerId"));
				dto.setBuyerNick(rs.getString("BuyerNick"));
				dto.setEmail(rs.getString("Email"));
				dto.setTell(rs.getString("Tell"));
				dto.setPoint(rs.getInt("Point"));
				dto.setGrade(rs.getString("Grade"));
				dto.setTotalPrice(rs.getInt("Total"));
				dto.setTotalCnt(rs.getInt("Cnt"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	//My Review Total Number
	public int MyReview_Total(String BuyerId) {
		int Total = 0;
		try {
			String query = "select count(ReviewNum) as Total from Review where BuyerId = ?";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, BuyerId);
			rs = pstmt.executeQuery();
			if(rs.next()) Total = rs.getInt("Total");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return Total;
	}
	
	//See My Reviews
	public ArrayList<BuyerDTO> My_Reviews(String BuyerId) {
		ArrayList<BuyerDTO> list = new ArrayList<>();
		try {
			String query = "select r.Review, r.Scope,"
					+ " p.ProductNm, p.Summary,"
					+ " i.ImageURL,"
					+ " s.ShopNm"
					+ " from Review r join Product p"
					+ " on r.ProductNum = p.ProductNum"
					+ " join ProductIMG i"
					+ " on p.ProductNum = i.ProductNum"
					+ " join Shop s"
					+ " on r.ShopId = s.ShopId"
					+ " where BuyerId = ?";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, BuyerId);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BuyerDTO dto = new BuyerDTO();
				dto.setReview(rs.getString("Review"));
				dto.setScope(rs.getInt("Scope"));
				dto.setProductNm(rs.getString("ProductNm"));
				dto.setSummary(rs.getString("Summary"));
				dto.setImageURL(rs.getString("ImageURL"));
				dto.setShopNm(rs.getString("ShopNm"));
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	//My Order Count Number
	public int MyOrder_Number(String BuyerId) {
		int Total = 0;
		try {
			String query = "select count(OrderId) as Total from OrderList where BuyerId = ?";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, BuyerId);
			rs = pstmt.executeQuery();
			if(rs.next()) Total = rs.getInt("Total");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return Total;
	}
	
	//View My OrderList
	public ArrayList<BuyerDTO> MyOrder_List(String BuyerId) {
		ArrayList<BuyerDTO> list = new ArrayList<>();
		try {
			String query = "select distinct l.OrderId,"
					+ " l.OrderDate, l.TotalCnt,"
					+ " l.TotalPrice, ProductNm"
					+ " from OrderList l join OrderItem i"
					+ " on l.OrderId = i.OrderId"
					+ " join Product p"
					+ " on i.ProductNum = p.ProductNum"
					+ " where l.BuyerId = ?";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, BuyerId);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BuyerDTO dto = new BuyerDTO();
				dto.setOrderId(rs.getString("OrderId"));
				dto.setOrderDate(rs.getString("OrderDate"));
				dto.setTotalCnt(rs.getInt("TotalCnt"));
				dto.setTotalPrice(rs.getInt("TotalPrice"));
				dto.setProductNm(rs.getString("ProductNm"));
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	//Number Of Product in My Cart
	public int MyCart_Number(String BuyerId) {
		int Total = 0;
		try {
			String query = "select count(ProductNum) as Total from Cart where BuyerId = ?";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, BuyerId);
			rs = pstmt.executeQuery();
			if(rs.next()) Total = rs.getInt("Total");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return Total;
	}
	
	public ArrayList<BuyerDTO> get_Wish(String BuyerId) {
		ArrayList<BuyerDTO> list = new ArrayList<BuyerDTO>();
		try {
			String query = "select distinct product.productnum, productnm, price, summary, ImageURL, sale from wish, product, ProductIMG where wish.productnum = product.productnum and ProductIMG.productNum = wish.productNum and buyerid = ?";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, BuyerId);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BuyerDTO dto = new BuyerDTO();
				dto.setProductNum(rs.getInt(1));
				dto.setProductNm(rs.getString(2));
				dto.setPrice(rs.getInt(3));
				dto.setSummary(rs.getString(4));
				dto.setImageURL(rs.getString(5));
				dto.setSale(rs.getDouble(6));
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public int set_wish(String BuyerId, String ProductNum) {
		int result = 0;
		try {
			String query = "insert into wish values(?, ?)";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, BuyerId);
			pstmt.setString(2, ProductNum);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int Delete_Wish(String BuyerId, String ProductNum) {
		int result = 0;
		try {
			String query = "delete Wish where BuyerId = ? and ProductNum = ?";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, BuyerId);
			pstmt.setString(2, ProductNum);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
