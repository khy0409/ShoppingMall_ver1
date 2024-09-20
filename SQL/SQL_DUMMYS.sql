--DUMMY DATAS--
--seller table dummy data
INSERT INTO Seller (SellerKey, BusinessNum, SellerId, SellerPw, Email, Tell)
	VALUES ('A382047BF', '123456789012', 'seller1', '1234', 'seller1@example.com', '010-1234-5678');
INSERT INTO Seller (SellerKey, BusinessNum, SellerId, SellerPw, Email, Tell)
	VALUES ('B473029CE', '234567890123', 'seller2', 'password2', 'seller2@example.com', '010-2345-6789');
INSERT INTO Seller (SellerKey, BusinessNum, SellerId, SellerPw, Email, Tell)
	VALUES ('C564810DG', '345678901234', 'seller3', 'password3', 'seller3@example.com', '010-3456-7890');
INSERT INTO Seller (SellerKey, BusinessNum, SellerId, SellerPw, Email, Tell)
	VALUES ('C564810DE', '345678901224', 'seller4', 'password3', 'seller3@example.com', '010-3456-7890');

--shop table dummy data
INSERT INTO Shop (ShopId, ShopNm, ShopDetail, ProfileImg, SellerKey)
	VALUES ('shop1', 'Shop Name 1', 'Shop Description 1', 'shop1_profile.jpg', 'A382047BF');
INSERT INTO Shop (ShopId, ShopNm, ShopDetail, ProfileImg, SellerKey)
	VALUES ('shop2', 'Shop Name 2', 'Shop Description 2', 'shop2_profile.jpg', 'B473029CE');
INSERT INTO Shop (ShopId, ShopNm, ShopDetail, ProfileImg, SellerKey)
	VALUES ('shop3', 'Shop Name 3', 'Shop Description 3', 'shop3_profile.jpg', 'C564810DG');

--buyer table dummy data
INSERT INTO Buyer (BuyerId, BuyerNick, BuyerPw, Email, Tell, Point, Grade)
	VALUES ('buyer1', 'Buyer1Nick', 'buyer_password1', 'buyer1@example.com', '010-1111-2222', 1000, 'Gold');
INSERT INTO Buyer (BuyerId, BuyerNick, BuyerPw, Email, Tell, Point, Grade)
	VALUES ('buyer2', 'Buyer2Nick', 'buyer_password2', 'buyer2@example.com', '010-3333-4444', 500, 'Bronze');
INSERT INTO Buyer (BuyerId, BuyerNick, BuyerPw, Email, Tell, Point, Grade)
	VALUES ('buyer3', 'Buyer3Nick', 'buyer_password3', 'buyer3@example.com', '010-5555-6666', 750, 'Silver');
	
--product table dummy data
INSERT INTO Product (ProductNum, ProductNm, ProductDetail, Summary, Price, Sale, ShopId, Category, rdate)
	VALUES (product_seq.nextval, '���̾���� ����', 'Product Detail Info', 'Summary 1', 149000, 26, 'shop1', 'Outer', sysdate);
INSERT INTO Product (ProductNum, ProductNm, ProductDetail, Summary, Price, Sale, ShopId, Category, rdate)
	VALUES (product_seq.nextval, '��Ʈ�� Ʈ������', 'Product Detail Info', 'Summary 2', 139800, 7, 'shop1', 'Outer', sysdate);
INSERT INTO Product (ProductNum, ProductNm, ProductDetail, Summary, Price, Sale, ShopId, Category, rdate)
	VALUES (product_seq.nextval, 'ũ�� ����� ��', 'Product Detail Info', 'Summary 3', 10900, 19, 'shop1', 'Outer', sysdate);
INSERT INTO Product (ProductNum, ProductNm, ProductDetail, Summary, Price, Sale, ShopId, Category, rdate)
	VALUES (product_seq.nextval, '�ٶ����� ������ ����', 'Product Detail Info', 'Summary 4', 99900, 31, 'shop1', 'Outer', sysdate);
INSERT INTO Product (ProductNum, ProductNm, ProductDetail, Summary, Price, Sale, ShopId, Category, rdate)
	VALUES (product_seq.nextval, '���� Ʈ��ž', 'Product Detail Info', 'Summary 5', 186000, 16, 'shop1', 'Outer', sysdate);
INSERT INTO Product (ProductNum, ProductNm, ProductDetail, Summary, Price, Sale, ShopId, Category, rdate)
	VALUES (product_seq.nextval, '���� �����ٿ�', 'Product Detail Info', 'Summary 6', 379000, 16, 'shop1', 'Outer', sysdate);
INSERT INTO Product (ProductNum, ProductNm, ProductDetail, Summary, Price, Sale, ShopId, Category, rdate)
	VALUES (product_seq.nextval, '�ø��� ���� ��Ʈ', 'Product Detail Info', 'Summary 7', 154000, 0, 'shop1', 'Outer', sysdate);
	
INSERT INTO Product (ProductNum, ProductNm, ProductDetail, Summary, Price, Sale, ShopId, Category, rdate)
	VALUES (product_seq.nextval, '������ �ڽ� �����', 'Product Detail Info', 'Summary 8', 30800, 3, 'shop2', 'Outer', sysdate);
INSERT INTO Product (ProductNum, ProductNm, ProductDetail, Summary, Price, Sale, ShopId, Category, rdate)
	VALUES (product_seq.nextval, '��� ���� �����', 'Product Detail Info', 'Summary 9', 21500, 0, 'shop2', 'Outer', sysdate);
INSERT INTO Product (ProductNum, ProductNm, ProductDetail, Summary, Price, Sale, ShopId, Category, rdate)
	VALUES (product_seq.nextval, '������ �׷��� ����', 'Product Detail Info', 'Summary 10', 58700, 0, 'shop2', 'Outer', sysdate);
	
INSERT INTO Product (ProductNum, ProductNm, ProductDetail, Summary, Price, Sale, ShopId, Category, rdate)
	VALUES (product_seq.nextval, '������ �̱� ����', 'Product Detail Info', 'Summary 11', 49000, 10, 'shop3', 'Outer', sysdate);
INSERT INTO Product (ProductNum, ProductNm, ProductDetail, Summary, Price, Sale, ShopId, Category, rdate)
	VALUES (product_seq.nextval, 'Ʈ���� ����� ����', 'Product Detail Info', 'Summary 12', 42000, 40, 'shop3', 'Outer', sysdate);
INSERT INTO Product (ProductNum, ProductNm, ProductDetail, Summary, Price, Sale, ShopId, Category, rdate)
	VALUES (product_seq.nextval, '�����̵� ���� ����', 'Product Detail Info', 'Summary 13', 42500, 0, 'shop3', 'Outer', sysdate);
INSERT INTO Product (ProductNum, ProductNm, ProductDetail, Summary, Price, Sale, ShopId, Category, rdate)
	VALUES (product_seq.nextval, 'Ʈ���� �����', 'Product Detail Info', 'Summary 14', 42000, 40, 'shop3', 'Outer', sysdate);
INSERT INTO Product (ProductNum, ProductNm, ProductDetail, Summary, Price, Sale, ShopId, Category, rdate)
	VALUES (product_seq.nextval, '���� ����', 'Product Detail Info', 'Summary 15', 53500, 14, 'shop3', 'Outer', sysdate);

INSERT INTO Product (ProductNum, ProductNm, ProductDetail, Summary, Price, Sale, ShopId, Category, rdate)
	VALUES (product_seq.nextval, '������ üũ ����', 'Product Detail Info', 'Summary 16', 49000, 10, 'shop1', 'Top', sysdate);
INSERT INTO Product (ProductNum, ProductNm, ProductDetail, Summary, Price, Sale, ShopId, Category, rdate)
	VALUES (product_seq.nextval, '������� Ƽ����', 'Product Detail Info', 'Summary 17', 42000, 40, 'shop1', 'Top', sysdate);
INSERT INTO Product (ProductNum, ProductNm, ProductDetail, Summary, Price, Sale, ShopId, Category, rdate)
	VALUES (product_seq.nextval, '�� ũ�� ����', 'Product Detail Info', 'Summary 18', 42500, 0, 'shop1', 'Top', sysdate);
INSERT INTO Product (ProductNum, ProductNm, ProductDetail, Summary, Price, Sale, ShopId, Category, rdate)
	VALUES (product_seq.nextval, '���� ���̳� ��Ʈ', 'Product Detail Info', 'Summary 19', 42000, 40, 'shop1', 'Top', sysdate);
INSERT INTO Product (ProductNum, ProductNm, ProductDetail, Summary, Price, Sale, ShopId, Category, rdate)
	VALUES (product_seq.nextval, '����Ƽ ����', 'Product Detail Info', 'Summary 20', 53500, 14, 'shop1', 'Top', sysdate);

INSERT INTO Product (ProductNum, ProductNm, ProductDetail, Summary, Price, Sale, ShopId, Category, rdate)
	VALUES (product_seq.nextval, '���� ���� Ƽ����', 'Product Detail Info', 'Summary 21', 49000, 10, 'shop2', 'Top', sysdate);
INSERT INTO Product (ProductNum, ProductNm, ProductDetail, Summary, Price, Sale, ShopId, Category, rdate)
	VALUES (product_seq.nextval, '������ ī�� Ƽ����', 'Product Detail Info', 'Summary 22', 42000, 40, 'shop2', 'Top', sysdate);
INSERT INTO Product (ProductNum, ProductNm, ProductDetail, Summary, Price, Sale, ShopId, Category, rdate)
	VALUES (product_seq.nextval, '������� ��Ʈ', 'Product Detail Info', 'Summary 23', 42500, 0, 'shop2', 'Top', sysdate);
INSERT INTO Product (ProductNum, ProductNm, ProductDetail, Summary, Price, Sale, ShopId, Category, rdate)
	VALUES (product_seq.nextval, 'üũ ���̳� ����', 'Product Detail Info', 'Summary 24', 42000, 40, 'shop2', 'Top', sysdate);
INSERT INTO Product (ProductNum, ProductNm, ProductDetail, Summary, Price, Sale, ShopId, Category, rdate)
	VALUES (product_seq.nextval, 'ī�� ������ Ƽ����', 'Product Detail Info', 'Summary 25', 53500, 14, 'shop2', 'Top', sysdate);
	
INSERT INTO Product (ProductNum, ProductNm, ProductDetail, Summary, Price, Sale, ShopId, Category, rdate)
	VALUES (product_seq.nextval, '���� ũ�� ����Ƽ', 'Product Detail Info', 'Summary 26', 49000, 10, 'shop3', 'Top', sysdate);
INSERT INTO Product (ProductNum, ProductNm, ProductDetail, Summary, Price, Sale, ShopId, Category, rdate)
	VALUES (product_seq.nextval, '������� ��Ʈ', 'Product Detail Info', 'Summary 27', 42000, 40, 'shop3', 'Top', sysdate);
INSERT INTO Product (ProductNum, ProductNm, ProductDetail, Summary, Price, Sale, ShopId, Category, rdate)
	VALUES (product_seq.nextval, '��ɼ� ���� Ƽ����', 'Product Detail Info', 'Summary 28', 42500, 0, 'shop3', 'Top', sysdate);
	
INSERT INTO Product (ProductNum, ProductNm, ProductDetail, Summary, Price, Sale, ShopId, Category, rdate)
	VALUES (product_seq.nextval, '�� ��ĿƮ', 'Product Detail Info', 'Summary 29', 42000, 40, 'shop1', 'Bottom', sysdate);
INSERT INTO Product (ProductNum, ProductNm, ProductDetail, Summary, Price, Sale, ShopId, Category, rdate)
	VALUES (product_seq.nextval, '3�� ��Ʈ', 'Product Detail Info', 'Summary 30', 42500, 0, 'shop1', 'Set', sysdate);
INSERT INTO Product (ProductNum, ProductNm, ProductDetail, Summary, Price, Sale, ShopId, Category, rdate)
	VALUES (product_seq.nextval, '���� ��Ŀ', 'Product Detail Info', 'Summary 31', 42000, 40, 'shop1', 'Shoes', sysdate);

	
--productIMG table dummy data
INSERT INTO ProductIMG (ImageNum, ProductNum, ImageURL, IsPrimary)
	VALUES (img_seq.nextval, 1, 'Outer1.jpg', 'Y');
INSERT INTO ProductIMG (ImageNum, ProductNum, ImageURL, IsPrimary)
	VALUES (img_seq.nextval, 2, 'Outer2.jpg', 'Y');
INSERT INTO ProductIMG (ImageNum, ProductNum, ImageURL, IsPrimary)
	VALUES (img_seq.nextval, 3, 'Outer3.jpg', 'Y');
INSERT INTO ProductIMG (ImageNum, ProductNum, ImageURL, IsPrimary)
	VALUES (img_seq.nextval, 4, 'Outer4.jpg', 'Y');
INSERT INTO ProductIMG (ImageNum, ProductNum, ImageURL, IsPrimary)
	VALUES (img_seq.nextval, 5, 'Outer5.jpg', 'Y');
INSERT INTO ProductIMG (ImageNum, ProductNum, ImageURL, IsPrimary)
	VALUES (img_seq.nextval, 6, 'Outer6.jpg', 'Y');
INSERT INTO ProductIMG (ImageNum, ProductNum, ImageURL, IsPrimary)
	VALUES (img_seq.nextval, 7, 'Outer7.jpg', 'Y');
	
INSERT INTO ProductIMG (ImageNum, ProductNum, ImageURL, IsPrimary)
	VALUES (img_seq.nextval, 8, 'Outer8.jpg', 'Y');
INSERT INTO ProductIMG (ImageNum, ProductNum, ImageURL, IsPrimary)
	VALUES (img_seq.nextval, 9, 'Outer9.jpg', 'Y');
INSERT INTO ProductIMG (ImageNum, ProductNum, ImageURL, IsPrimary)
	VALUES (img_seq.nextval, 10, 'Outer10.jpg', 'Y');
	
INSERT INTO ProductIMG (ImageNum, ProductNum, ImageURL, IsPrimary)
	VALUES (img_seq.nextval, 11, 'Outer11.jpg', 'Y');
INSERT INTO ProductIMG (ImageNum, ProductNum, ImageURL, IsPrimary)
	VALUES (img_seq.nextval, 12, 'Outer12.jpg', 'Y');
INSERT INTO ProductIMG (ImageNum, ProductNum, ImageURL, IsPrimary)
	VALUES (img_seq.nextval, 13, 'Outer13.jpg', 'Y');
INSERT INTO ProductIMG (ImageNum, ProductNum, ImageURL, IsPrimary)
	VALUES (img_seq.nextval, 14, 'Outer14.jpg', 'Y');
INSERT INTO ProductIMG (ImageNum, ProductNum, ImageURL, IsPrimary)
	VALUES (img_seq.nextval, 15, 'Outer15.jpg', 'Y');
	
INSERT INTO ProductIMG (ImageNum, ProductNum, ImageURL, IsPrimary)
	VALUES (img_seq.nextval, 16, 'Top1.jpg', 'Y');
INSERT INTO ProductIMG (ImageNum, ProductNum, ImageURL, IsPrimary)
	VALUES (img_seq.nextval, 17, 'Top2.jpg', 'Y');
INSERT INTO ProductIMG (ImageNum, ProductNum, ImageURL, IsPrimary)
	VALUES (img_seq.nextval, 18, 'Top3.jpg', 'Y');
INSERT INTO ProductIMG (ImageNum, ProductNum, ImageURL, IsPrimary)
	VALUES (img_seq.nextval, 19, 'Top4.jpg', 'Y');
INSERT INTO ProductIMG (ImageNum, ProductNum, ImageURL, IsPrimary)
	VALUES (img_seq.nextval, 20, 'Top5.jpg', 'Y');

INSERT INTO ProductIMG (ImageNum, ProductNum, ImageURL, IsPrimary)
	VALUES (img_seq.nextval, 21, 'Top6.jpg', 'Y');
INSERT INTO ProductIMG (ImageNum, ProductNum, ImageURL, IsPrimary)
	VALUES (img_seq.nextval, 22, 'Top7.jpg', 'Y');
INSERT INTO ProductIMG (ImageNum, ProductNum, ImageURL, IsPrimary)
	VALUES (img_seq.nextval, 23, 'Top8.jpg', 'Y');
INSERT INTO ProductIMG (ImageNum, ProductNum, ImageURL, IsPrimary)
	VALUES (img_seq.nextval, 24, 'Top9.jpg', 'Y');
INSERT INTO ProductIMG (ImageNum, ProductNum, ImageURL, IsPrimary)
	VALUES (img_seq.nextval, 25, 'Top10.jpg', 'Y');
	
INSERT INTO ProductIMG (ImageNum, ProductNum, ImageURL, IsPrimary)
	VALUES (img_seq.nextval, 26, 'Top11.jpg', 'Y');
INSERT INTO ProductIMG (ImageNum, ProductNum, ImageURL, IsPrimary)
	VALUES (img_seq.nextval, 27, 'Top12.jpg', 'Y');
INSERT INTO ProductIMG (ImageNum, ProductNum, ImageURL, IsPrimary)
	VALUES (img_seq.nextval, 28, 'Top13.jpg', 'Y');
	
INSERT INTO ProductIMG (ImageNum, ProductNum, ImageURL, IsPrimary)
	VALUES (img_seq.nextval, 29, 'Bottom1.jpg', 'Y');
INSERT INTO ProductIMG (ImageNum, ProductNum, ImageURL, IsPrimary)
	VALUES (img_seq.nextval, 30, 'Set1.jpg', 'Y');
INSERT INTO ProductIMG (ImageNum, ProductNum, ImageURL, IsPrimary)
	VALUES (img_seq.nextval, 31, 'Shoes.jpg', 'Y');

--orderList table dummy data
INSERT INTO OrderList (OrderId, OrderDate, BuyerId, TotalCnt, TotalPrice)
	VALUES ('240714PDA4GW', '20240714', 'buyer1', 2, 30000);
INSERT INTO OrderList (OrderId, OrderDate, BuyerId, TotalCnt, TotalPrice)
	VALUES ('240715PSGE6C', '20240715', 'buyer2', 2, 30000);
INSERT INTO OrderList (OrderId, OrderDate, BuyerId, TotalCnt, TotalPrice)
	VALUES ('240714NGS5V0', '20240714', 'buyer1', 2, 30000);

--orderItem table dummy data
INSERT INTO OrderItem (ItemId, OrderId, ProductNum, Cnt, Price, ShopId, Status)
	VALUES ('240714JI8', '240714PDA4GW', 2, 1, 20000, 'shop1', 'Y');
INSERT INTO OrderItem (ItemId, OrderId, ProductNum, Cnt, Price, ShopId, Status)
	VALUES ('240714EH2', '240714PDA4GW', 2, 2, 40000, 'shop1', 'N');
INSERT INTO OrderItem (ItemId, OrderId, ProductNum, Cnt, Price, ShopId, Status)
	VALUES ('240715GD1', '240715PSGE6C', 3, 1, 30000, 'shop1', 'N');

--review table dummy data
INSERT INTO Review (ReviewNum, Review, ProductNum, BuyerId, ShopId, scope)
	VALUES (review_seq.nextval, '��ǰ�� �ſ� �����������ϴ�.', 1, 'buyer1', 'shop1', 9);
INSERT INTO Review (ReviewNum, Review, ProductNum, BuyerId, ShopId, scope)
	VALUES (review_seq.nextval, '����� ���� ���ҽ��ϴ�.', 2, 'buyer2', 'shop2', 8);
INSERT INTO Review (ReviewNum, Review, ProductNum, BuyerId, ShopId, scope)
	VALUES (review_seq.nextval, '��ǰ ǰ���� ���ƿ�.', 3, 'buyer3', 'shop3', 10);
	INSERT INTO Review (ReviewNum, Review, ProductNum, BuyerId, ShopId, scope)
	VALUES (review_seq.nextval, '��ǰ ǰ���� ���ƿ�.', 21, 'buyer3', 'shop3', 10);

--wish table dummy data
INSERT INTO Wish (BuyerId, ProductNum)
	VALUES ('buyer1', 1);
INSERT INTO Wish (BuyerId, ProductNum)
	VALUES ('buyer1', 2);
INSERT INTO Wish (BuyerId, ProductNum)
	VALUES ('buyer1', 3);