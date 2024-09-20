--QUERY--
--Get Best Product(Category O)
select p.productNM, p.summary, p.price, p.sale, r.scope, i.ImageURL, i.isPrimary
from product p,
review r,
ProductIMG i
where p.ProductNum = r.productNum
and p.productNum = i.productNum
and category = 'Outer'
order by r.scope desc;

--Get New Product(Category X)
select p.productNM, p.summary, p.price, p.sale, r.scope, i.ImageURL, i.isPrimary from product p, review r, productImg i where p.ProductNum = r.productNum and p.productNum = i.productNum order by p.rdate desc

--Join Buyer
insert into Buyer values(?, ?, ?, ?, ?, ?);

--Join Seller
insert into Seller values(?, ?, ?, ?, ?, ?);

--Check ID for Buyer
select BuyerId from Buyer where BuyerId = ?;

--Check ID for Seller
select SellerId from Seller where SellerId = ?;

--Login for Buyer
select b.BuyerId, b.BuyerNick, count(c.BuyerId) from Buyer b left join Cart c on b.BuyerId = c.BuyerId where b.BuyerId = 'buyer4' and b.BuyerPw = 'buyer4' group by b.BuyerId, b.BuyerNick;

--Login for Seller
select s.SellerKey, s.SellerId, shop.ShopId, shop.ShopNm from Seller s join Shop shop on s.SellerKey = shop.SellerKey where SellerId = ? and SellerPw = ?;

--Forgot the ID from Buyer, feat.Email
select BuyerId from Buyer where BuyerPw = ? and Email = ?;
--Forgot the ID from Buyer, feat.Tell
select BuyerId from Buyer where BuyerPw = ? and Tell = ?;
--Forgot the PW from Buyer, feat.Email
select BuyerPw from Buyer where BuyerId = ? and Email = ?;
--Forgot the PW from Buyer, feat.tell
select BuyerPw from Buyer where BuyerId = ? and Tell = ?;

--Forgot the ID from Seller, feat.SellerKey
select SellerId from Seller where SellerKey = ? and SellerPw = ?;
--Forgot the ID from Seller, feat.BusinessNum
select SellerId from Seller where BusinessNum = ? and SellerPw = ?;
--Forgot the PW from Seller, feat.SellerKey
select SellerPw from Seller where SellerKey = ? and SellerId = ?;
--Forgot the PW from Seller, feat.BusinessNum
select SellerPw from Seller where BusinessNum = ? and SellerId = ?;

--여기까지 다 함

--Update Buyer Info
update Buyer set BuyerNick=?, BuyerPw=?, Email=?, Tell=? where BuyerId = ?;

--Update Seller Info
update Seller set SellerId=?, SellerPw=?, Email=?, Tell=? where SellerKey=?;

--Buyer Withdrawal
delete Buyer where BuyerId = ? and BuyerPw = ?;

--Seller Withdrawal
delete Seller where SellerKey = ? and SellerPw =?;
---------------------here부터--------------------------
--View my wish
select productnm, price, summary, product.productnum from wish, product where wish.productnum = product.productnum and buyerid = ?;

--Add Product in the wish
insert into wish values(?, ?);

--Delete Product in the wish
delete wish where buyerid='buyer1' and productNum = 1;

---------------------here까지 안함(Heart DB or Cookie?)--------------------------
---------------------here부터--------------------------
--Buy the Product--
--Add OrderList
insert into OrderList values(?, sysdate, ?, ?, ?);
--Add OrderItem
insert into OrderItem values(?, ?, ?, ?, ?);
--Buy the Product, Delete Product in the Cart
delete Cart where buyerId='buyer1' and productNum = 1;
---------------------here까지 잘될지 미지수--------------------------

--Product Search 
select p.ProductNm, p.Summary, p.Price, p.Sale, r.Scope, i.ImageUrl, i.IsPrimary from Product p, Review r, ProductImg i where p.ProductNum = r.ProductNum and p.ProductNum = i.ProductNum and upper(ProductNm) like upper(?);

--Add Product
insert into Product values(product_seq.nextval, ?, ?, ?, ?, ?, ?, ?, sysdate, null);

--Add Product Img
insert into ProductImg values(img_seq.nextval, ?, ?, ?);

--Update Product
update Product set ProductNm=?, ProductDetail=?, Summary=?, Price=?, Sale=?, Category=?, mdate=sysdate where productnum = ?;

--Delete Product
delete Product where ProductNum = ?;

--Delete Product Img
delete ProductImg where ImageNum = ?;

--Add Review
insert into Review values(review_seq.nextval, ?, ?, ?, ?, ?);

--Update Review
update Review set Review=?, scope=? where ReviewNum=?;

--Delete Review
delete Review where ReviewNum = ?;

--Using Point
update Review set Point=Point-? where BuyerId = ?;

--Getting Point
update Review set Point=Point+? where BuyerId = ?;

--Update Shop (이미지 변경 시 img folder의 이미지도 삭제되게 할 것)
update Shop set ShopNm=?, ShopDetail=?, ProfileImg=? where ShopId = ?;

--View Product Detail
select s.ShopNm, s.ProfileImg, p.ProductNm, p.Price, p.Sale, p.Category, i.ImageURL, i.IsPrimary, avg(cast(r.scope as decimal)) as AvgScope from Shop s join Product p on s.ShopId = p.ShopId join ProductIMG i on p.ProductNum = i.ProductNum join Review r on p.ProductNum = r.ProductNum where p.ProductNum = 1 group by s.ShopNm, s.ProfileImg, p.ProductNm, p.Price, p.Sale, p.Category, i.ImageURL, i.IsPrimary
order by i.IsPrimary desc;

--MyPage by Buyer
select buyerid, BuyerNick, BuyerPw, Email, Tell, Point, Grade, sum(totalPrice), count(totalPrice) from Buyer natural join OrderList where BuyerId = 'buyer1' group by buyerid, BuyerNick, BuyerPw, Email, Tell, Point, Grade;

--MyPage by Seller
select Seller.*, Shop.*, Cnt, Price from Seller, Shop, OrderItem where Seller.SellerKey = Shop.SellerKey and Shop.ShopId = OrderItem.ShopId and Seller.SellerKey = ?;

--My Review Total
select count(ReviewNum) from Review where BuyerId = ?;

--See My Reviews
select r.Review, r.Scope, p.ProductNm, p.Summary, i.ImageURL, s.ShopNm from Review r join Product p on r.ProductNum = p.ProductNum join ProductIMG i on p.ProductNum = i.ProductNum join Shop s on r.ShopId = s.ShopId where BuyerId = 'buyer1'

--Product Review Total
select count(ReviewNum) from Review where ProductNum = ?;

--View all Product Reviews
select r.Review, r.Scope, b.BuyerId from Review r join Buyer b on r.BuyerId = b.BuyerId join Product p on r.ProductNum = p.ProductNum where p.ProductNum = ?;

--My Order Count 
select count(OrderId) from OrderList where BuyerId = ?;

--View My Order List 
select distinct l.OrderId, l.OrderDate, l.TotalCnt, l.TotalPrice, ProductNm from OrderList l join OrderItem i on l.OrderId = i.OrderId join Product p on i.ProductNum = p.ProductNum where l.BuyerId = 'buyer1';

--Total Count of Order in My Shop
select count(s.ProductNum) from OrderItem i join Shop s on i.ShopId = s.ShopId where ShopId = ?;

--View My Shop Orders
select l.OrderId, l.OrderDate, l.BuyerId, i.Cnt, i.Price, i.Status, p.ProductNm from OrderList l join OrderItem i on l.OrderId = i.OrderId join Product p on i.ProductNum = p.ProductNum where i.ShopId = ?;

--Change Order Status
update OrderItem set Status=? where ShopId = ?;

--View My Product Order Count
select count(OrderId) from OrderItem where ProductNum = ?;

--Order By, Using Case
order by case OrderNum when 1 then ProductNm when 2 then ProductNm desc when 3 then Price when 4 then Price desc when 5 then (select count(*) FROM OrderItem group by ProductNum) DESC desc else scope desc end;

--Check SellerKey 
select SellerKey from Seller where SellerKey = ?;

--time check
select to_char(sysdate, 'yyyy-MM-dd hh24:mm:dd') from dual;

--View Products(Category O)
SELECT * FROM (
    SELECT p.productNM, p.summary, p.price, p.sale, r.scope, i.ImageURL, i.isPrimary,
           ROWNUM AS rnum
    FROM product p, review r, productImg i
    WHERE p.ProductNum = r.productNum
      AND p.productNum = i.productNum
      AND category = 'Outer'
) WHERE rnum BETWEEN 1 AND 12;

--view my shop order
select OrderItem.*, ProductNm
from OrderItem join Product on OrderItem.productnum = Product.productnum
where OrderItem.shopid = 'shop1'

select Seller.*, Shop.*, Cnt, Price from Seller, Shop, OrderItem where Seller.SellerKey = Shop.SellerKey and Shop.ShopId = OrderItem.ShopId and Seller.SellerKey = ?