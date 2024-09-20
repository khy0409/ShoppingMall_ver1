package SellerDAL;

import java.util.ArrayList;

import JDBC.JDBConnect;

public class SellerDAO extends JDBConnect{
	
	//Join Seller, Check SellerKey
	public boolean Check_SellerKey(String SellerKey) {
		boolean result = false;
		try {
			String query = "select SellerKey from Seller where SellerKey = ?";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, SellerKey);
			rs = pstmt.executeQuery();
			if(rs.next()) result = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//Join Seller
	public int Seller_SignUp(String SellerKey, String BusinessNum, String SellerId, String SellerPw, String Email, String Tell) {
		int result = 0;
		try {
			String query = "insert into seller values(?, ?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, SellerKey);
			pstmt.setString(2, BusinessNum);
			pstmt.setString(3, SellerId);
			pstmt.setString(4, SellerPw);
			pstmt.setString(5, Email);
			pstmt.setString(6, Tell);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//Login for Seller
	public SellerDTO Login_Seller(String SellerId, String SellerPw) {
		SellerDTO dto = new SellerDTO();
		try {
			String query = "select"
					+ " SellerKey, SellerId"
					+ " from Seller"
					+ " where SellerId = ?"
					+ " and SellerPw = ?";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, SellerId);
			pstmt.setString(2, SellerPw);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setSellerKey(rs.getString("SellerKey"));
				dto.setSellerId(rs.getString("SellerId"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	//Forgot SellerId, Search using SellerKey & SellerPw
	public String Forgot_SellerId_SellerKey(String SellerKey, String SellerPw) {
		String SellerId = null;
		try {
			String query = "select SellerId from Seller where SellerKey = ? and SellerPw = ?";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, SellerKey);
			pstmt.setString(2, SellerPw);
			rs = pstmt.executeQuery();
			if(rs.next()) SellerId = rs.getString("SellerId");			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SellerId;
	}
	
	//Forgot SellerId, Search using BusinessNum & SellerPw
	public String Forgot_SellerId_BusinessNum(String BusinessNum, String SellerPw) {
		String SellerId = null;
		try {
			String query = "select SellerId from Seller where BusinessNum = ? and SellerPw = ?";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, BusinessNum);
			pstmt.setString(2, SellerPw);
			rs = pstmt.executeQuery();
			if(rs.next()) SellerId = rs.getString("SellerId");			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SellerId;
	}
	
	//Forgot SellerPw, Search using SellerKey & SellerId
	public String Forgot_SellerPw_SellerKey(String SellerKey, String SellerId) {
		String SellerPw = null;
		try {
			String query = "select SellerPw from Seller where SellerKey = ? and SellerId = ?";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, SellerKey);
			pstmt.setString(2, SellerId);
			rs = pstmt.executeQuery();
			if(rs.next()) SellerPw = rs.getString("SellerPw");		
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SellerPw;
	}
	
	//Forgot SellerPw, Search using BusinessNum & SellerId
	public String Forgot_SellerPw_BusinessNum(String BusinessNum, String SellerId) {
		String SellerPw = null;
		try {
			String query = "select SellerPw from Seller where BusinessNum = ? and SellerId = ?";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, BusinessNum);
			pstmt.setString(2, SellerId);
			rs = pstmt.executeQuery();
			if(rs.next()) SellerPw = rs.getString("SellerPw");		
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SellerPw;
	}
	
	//Update Seller Info
	public int Update_SellerInfo(String SellerKey, String Business, String SellerId, String SellerPw, String Email, String Tell) {
		int result = 0;
		try {
			String query = "update Seller"
					+ " set BusinessNum = ?, SellerId = ?, SellerPw = ?, Email=?, Tell=?"
					+ " where SellerKey = ?";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, Business);
			pstmt.setString(2, SellerId);
			pstmt.setString(3, SellerPw);
			pstmt.setString(4, Email);
			pstmt.setString(5, Tell);
			pstmt.setString(6, SellerKey);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int Update_ShopInfo(String ShopNm, String ShopDetail, String ShopId) {
		int result = 0;
		try {
			String query = "update shop"
					+ " set ShopNm = ?, ShopDetail = ?"
					+ " where ShopId = ?";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, ShopNm);
			pstmt.setString(2, ShopDetail);
			pstmt.setString(3, ShopId);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//Seller secession
	public int Seller_secession(String SellerKey, String SellerPw) {
		int result = 0;
		try {
			String query = "delete Seller where SellerKey = ? and SellerPw = ?";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, SellerKey);
			pstmt.setString(2, SellerPw);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	//여기 위는 다 사용함
	
	//Add Product
	public int Add_Product(String ProductNum, String ProductNm, String ProductDetail, String Summary, int Price, float Sale, String ShopId, String Category, String ImageURL) {
		int result = 0;
		try {
			con.setAutoCommit(false);
			String query = "insert into Product"
					+ " values(product_seq.nextval, ?, ?, ?,"
					+ " ?, ?, ?, ?, sysdate, null)";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, ProductNm);
			pstmt.setString(2, ProductDetail);
			pstmt.setString(3, Summary);
			pstmt.setInt(4, Price);
			pstmt.setFloat(5, Sale);
			pstmt.setString(6, ShopId);
			pstmt.setString(7, Category);
			result = pstmt.executeUpdate();
			System.out.println(ShopId);
			System.out.println(result);
			if(result == 1) {
				query = "insert into ProductImg"
						+ " values(img_seq.nextval, ?, ?, 'Y')";
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, ProductNum);
				pstmt.setString(2, ImageURL);
				result = pstmt.executeUpdate();
				System.out.println(ProductNum);
				System.out.println(ImageURL);
				System.out.println(result);
				con.commit();
				con.setAutoCommit(true);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//Update Product
	public int Update_Product(String ProductNm, String ProductDetail, String Summary, String Price, String Sale, String Category, String ProductNum, String ImageUrl) {
		int result = 0;
		try {
			con.setAutoCommit(false);
			String query = "update Product set ProductNm=?, ProductDetail=?, Summary=?, Price=?, Sale=?, Category=? where ProductNum = ?";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, ProductNm);
			pstmt.setString(2, ProductDetail);
			pstmt.setString(3, Summary);
			pstmt.setString(4, Price);
			pstmt.setString(5, Sale);
			pstmt.setString(6, Category);
			pstmt.setString(7, ProductNum);
			result = pstmt.executeUpdate();
			if(result == 1) {
				query = "update ProductIMG set ImageURL=? where ProductNum=?";
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, ImageUrl);
				pstmt.setString(2, ProductNum);
				result = pstmt.executeUpdate();
				
				con.commit();
				con.setAutoCommit(true);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//getMaxNum
	public int getMax() {
		int result = 0;
		try {
			String query = "select max(ProductNum)+1 from product";
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			if(rs.next()) {
				result = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//Delete Product
	public int Delete_Product(int ProductNum) {
		int result = 0;
		try {
			String query = "delete Product where ProductNum = ?";
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, ProductNum);
			result = pstmt.executeUpdate();
			if(result == 1) {
				query = "delete ProductImg where ProductNum = ?";
				pstmt.setInt(1, ProductNum);
				result = pstmt.executeUpdate();
			}else return 0;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//View MyPage
	public SellerDTO Mypage_Seller(String SellerKey) {
		SellerDTO dto = new SellerDTO();
		try {
			String qeury = "select Seller.SellerKey, BusinessNum, SellerId, Email, Tell, Shop.Shopid, Shopnm, shopdetail,"
					+ " sum(Cnt) as cnt, sum(Price) as price"
					+ " from Seller, Shop, OrderItem"
					+ " where Seller.SellerKey = Shop.SellerKey"
					+ " and Shop.ShopId = OrderItem.ShopId"
					+ " and Seller.SellerKey = ?"
					+ " group by Seller.SellerKey, BusinessNum, SellerId, Email, Tell, Shop.Shopid, Shopnm, shopdetail";
			pstmt = con.prepareStatement(qeury);
			pstmt.setString(1, SellerKey);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setSellerKey(rs.getString("sellerkey"));
				dto.setBusinessNum(rs.getString("businessnum"));
				dto.setSellerId(rs.getString("sellerId"));
				dto.setEmail(rs.getString("email"));
				dto.setTell(rs.getString("tell"));
				dto.setShopId(rs.getString("shopId"));
				dto.setShopNm(rs.getString("shopnm"));
				dto.setShopDetail(rs.getString("shopdetail"));
				dto.setCnt(rs.getString("cnt"));
				dto.setPrice(rs.getInt("price"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return dto;
	}
	
	//Change Order Status
	public int Change_Status(String Status, String ItemId) {
		int result = 0;
		try {
			String query = "update OrderItem set Status=? where ItemId = ?";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, Status);
			pstmt.setString(2, ItemId);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public ArrayList<SellerDTO> get_OrderList(String shopId) {
		ArrayList<SellerDTO> list = new ArrayList<SellerDTO>();
		try {
			String query = "select OrderItem.*, ProductNm"
					+ " from OrderItem join Product"
					+ " on OrderItem.productnum = Product.productnum"
					+ " where OrderItem.shopid = ?";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, shopId);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				SellerDTO dto = new SellerDTO();
				dto.setItemId(rs.getString("ItemId"));
				dto.setOrderId(rs.getString("OrderId"));
				dto.setProductNum(rs.getString("ProductNum"));
				dto.setCnt(rs.getString("Cnt"));
				dto.setPrice(rs.getInt("Price"));
				dto.setStatus(rs.getString("Status"));
				dto.setProductNm(rs.getString("ProductNm"));
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public ArrayList<SellerDTO> get_MyProduct(String shopId) {
		ArrayList<SellerDTO> list = new ArrayList<SellerDTO>();
		try {
			String query = "select p.ProductNum, ProductNm, Price, Sale, Summary, i.ImageUrl from Product p, ProductImg i where p.productnum = i.productnum and shopId = ?";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, shopId);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				SellerDTO dto = new SellerDTO();
				dto.setProductNum(rs.getString(1));
				dto.setProductNm(rs.getString(2));
				dto.setPrice(rs.getInt(3));
				dto.setSale(rs.getDouble(4));
				dto.setSummary(rs.getString(5));
				dto.setProfileImg(rs.getString(6));
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
