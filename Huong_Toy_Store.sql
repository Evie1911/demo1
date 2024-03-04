CREATE DATABASE Toy_Store;
USE Toy_Store;



GO
CREATE TABLE Roles (
  roleId VARCHAR(255) PRIMARY KEY NOT NULL,
  roleName VARCHAR(255) NOT NULL
  );



GO
CREATE TABLE Accounts (
  Username VARCHAR(255) PRIMARY KEY NOT NULL,
  password VARCHAR(255) NOT NULL,
  fullname NVARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  account_adress NVARCHAR(255),
  phone VARCHAR(11)NOT NULL,
  photo VARCHAR(255)
);


GO
CREATE TABLE Authorities (
  authId INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
  userName VARCHAR(255) NOT NULL,
  roleId VARCHAR(255) NOT NULL,
  CONSTRAINT UK_Authories_Username_RoleId UNIQUE (userName, roleId),
  FOREIGN KEY (roleId) REFERENCES roles(roleId),
  FOREIGN KEY (userName) REFERENCES Accounts(Username)
 );


GO
CREATE TABLE Categories(
	cateId VARCHAR(255) PRIMARY KEY NOT NULL,
	cateName NVARCHAR(255) NOT NULL
); 



GO
CREATE TABLE Products (
  proId INT PRIMARY KEY NOT NULL IDENTITY(1,1),
  prodNname NVARCHAR(255) NOT NULL,
  image1 VARCHAR(255),
  image2 VARCHAR(255),
  image3 VARCHAR(255),
  imageIcon VARCHAR(255),
  price DECIMAL(15, 3) NOT NULL,
  createDate DATE,
  quantity INT NOT NULL,
  describe NVARCHAR(900),
  year_old NVARCHAR(255),
  trademark NVARCHAR(255),
  origin NVARCHAR(255),
  category_id VARCHAR(255),
  FOREIGN KEY (category_id) REFERENCES Categories(cateId)
);



GO
CREATE TABLE Vouchers (
  vouId VARCHAR(255) PRIMARY KEY NOT NULL,
  discount_percentage FLOAT NOT NULL,
  expiry_date DATE NOT NULL,
  quantity int NOT NULL
);

GO
CREATE TABLE Orders (
  ordId INT PRIMARY KEY NOT NULL identity(1,1),
  username VARCHAR(255) NOT NULL,
  create_date DATE NOT NULL,
  order_address NVARCHAR(255),
  ord_phone VARCHAR(10) NOT NULL,
  voucher_id VARCHAR(255),
  FOREIGN KEY (username) REFERENCES Accounts(Username),
  FOREIGN KEY (voucher_id) REFERENCES Vouchers(vouId)
);


GO
CREATE TABLE OrderDetails (
 ordetailId INT PRIMARY KEY NOT NULL identity(1,1),
  order_id INT NOT NULL,
  product_id INT NOT NULL,
  quantity INT NOT NULL,
  price DECIMAL(15, 3) NOT NULL,
  FOREIGN KEY (product_id) REFERENCES Products(proId),
  FOREIGN KEY (order_id) REFERENCES Orders(ordId)
);


GO

go


-- INSERT DATA
INSERT INTO Roles (roleId, roleName) VALUES 
('CUST', 'Customer'),
('DIRE', 'Director'),
('STAF', 'Staff');

INSERT INTO Accounts (Username, Password, Fullname, Email,account_adress, Phone ,Photo) VALUES 
('demo', '1', N'Nguyễn Văn A', 'user1@example.com',NULL,'0918855899', NULL),
('user2', 'pass2', N'Trần Văn B', 'user2@example.com',NULL,'0329855773', NULL),
('user3', 'pass3', N'Lê Văn C', 'user3@example.com',NULL,'0737823568', NULL),
('user4', 'pass4', N'Võ Thị D', 'user4@example.com',NULL,'0826245258', NULL),
('user5', 'pass5', N'Chu Văn H', 'user5@example.com',NULL,'0918365344', NULL);


INSERT INTO Authorities (Username, RoleId) VALUES 
('demo', 'CUST'),
('user2', 'STAF'),
('user3', 'CUST'),
('user4', 'DIRE'),
('user5', 'CUST');


INSERT INTO Categories (cateId, cateName) VALUES 
('CAT1', N'Đồ chơi phát nhạc'),
('CAT2', N'Đồ chơi gỗ'),
('CAT3', N'Đồ chơi LEGO'),
('CAT4', N'Đồ chơi mô hình'),
('CAT5', N'Đồ chơi điều khiển từ xa'),
('CAT6', N'Đồ chơi búp bê'),
('CAT7', N'Đồ chơi nghê nghiệp'),
('CAT8', N'Đồ chơi vận động thể chất');


INSERT INTO Orders (username, create_date, order_address, ord_phone,voucher_id) VALUES 
('user3', '2021-09-05',N'60 Lý Thường Kiệt, phường 7, quận 10, thành phố Hồ Chí Minh', '0918855899',NULL),
('user3', '2023-10-22',N'60 Lý Thường Kiệt, phường 7, quận 10, thành phố Hồ Chí Minh', '0918855899',NULL),
('user5', '2023-03-16',N'217/14 Bà Hom, phường 13, quận 6, thành phố Hồ Chí Minh', '0918855899',NULL),

('user3', '2023-09-02',N'60 Lý Thường Kiệt, phường 7, quận 10, thành phố Hồ Chí Minh', '0918855899',NULL),
('user5', '2021-12-24',N'217/14 Bà Hom, phường 13, quận 6, thành phố Hồ Chí Minh', '0918855899',NULL),
('user5', '2023-07-17',N'217/14 Bà Hom, phường 13, quận 6, thành phố Hồ Chí Minh', '0918855899',NULL),
('user3', '2021-08-03',N'60 Lý Thường Kiệt, phường 7, quận 10, thành phố Hồ Chí Minh', '0918855899',NULL);


INSERT INTO Products (prodNname, image1, image2, image3, imageIcon, price,createDate, quantity, describe, year_old, trademark, origin, category_id) VALUES 
(N'Điện thoại oto mèo con có dây', 'meooto1.jpg', 'meooto2.jpg','meooto3.jpg','meooto4.jpg', 147000.000, '2023-11-27', 50, N'Điện thoại ô tô mèo con có dây kéo và nhạc với 15 chức năng lớn, tích hợp 64 bài hát, âm thanh của các chủ đề, giúp bé vừa chơi vừa rèn luyện trí óc.', N'Từ 18 tháng tuổi', NULL, NULL,'CAT1'),
(N'Đồ chơi gỗ ghép số hình khối 3D', 'ghepsogo1.jpg', 'ghepsogo2.jpg', 'ghepsogo3.jpg','ghepsogo4.jpg', 319000.000, '2023-11-27', 50, N'Đồ chơi gỗ ghép số hình khối 3D Toyshouse 574 có nhiều hình ghép bao gồm số, hình khối, vòng bi tập đếm hỗ trợ tối đa quá trình học tập của bé. Đồ chơi sẽ là một công cụ học tập cực hiệu quả cho bé từ 3 đến 5 tuổi giúp bé làm quen dần với các con số và hình khối một cách nhanh chóng.', N'3 tuổi trở lên', NULL, NULL,'CAT2'),
(N'Bàn tính hươu học chữ', 'bantinhgo1.png', 'bantinhgo2.png', 'bantinhgo3.png','bantinhgo2.png', 239000.000, '2023-11-27', 50, N'Bàn tính hình chú hươu cao cổ  liệt kê theo thứ tự toàn bộ  chữ cái trong bảng chữ tiếng Anh và số từ 1-8  ở dạng chữ in hoa cùng với hình ảnh minh họa của chữ đó trong một từ tiếng Anh đơn giản và thông dụng.', N'2 tuổi trở lên', NULL, NULL,'CAT2'),
(N'Lego 701650 - Xe oto', 'xelego1.jpg', 'xelego1.jpg', 'xelego1.jpg','xelego1.jpg', 673000.000, '2023-11-27', 50, N'Đồ chơi Lego 701650 - Xe ô tô Mercedes Benz cổ điển là loại đồ chơi được các bé trai yêu thích. Phụ huynh có thể cùng chơi với bé để tạo không gian vui chơi trong gia đình.', N'Từ 6 tuổi trở lên', NULL, NULL,'CAT3'),
(N'Lego Creator - Đầu tàu xe lửa mini', 'legoxelua1.jpg', 'legoxelua2.jpg', 'legoxelua1.jpg','legoxelua2.jpg', 199000.000, '2023-11-27', 50, N'Đồ chơi Lego Creator 31054 - Đầu tàu xe lửa mini gồm 71 chi tiết được làm từ chất liệu nhựa an toàn, bé có thể ráp thành 3 mô hình khác nhau dựa theo sách hướng dẫn. Người chơi có thể xây dựng được mô hình xe lửa độc đáo cho mình với một chiếc đầu tàu tốc hành màu xanh, một đầu tàu hỏa hoặc một chiếc toa tàu vận chuyển đẹp mắt.', N'Từ 6-12 tuổi', NULL, NULL,'CAT3'),
(N'Lego Chợ làng trung cổ', 'legocho1.jpg', 'legocho2.jpg', 'legocho3.jpg','legocho4.jpg', 4999000.000, '2023-11-27', 50, N'Hãy mở rộng vương quốc các tòa lâu đài LEGO của bạn! Ngôi làng trung cổ kinh điển với khu chợ riêng là kết hợp hoàn hảo cho bất kì tòa lâu đài LEGO nào của bạn! Sản phẩm với đầy đủ tính năng như thật, phụ kiện thú vị và các loài động vật hoàn toàn mới, rất thích hợp để mở rộng cũng như tăng cường cho vương quốc của bạn.', N'Từ 12 tuổi trở lên', NULL, NULL,'CAT3'),
(N'Đồ chơi đường hầm sư tử', 'duonghamsutu1.jpg','duonghamsutu2.jpg', 'duonghamsutu3.jpg','duonghamsutu4.jpg', 750000.000, '2023-11-27', 50, N'Đồ chơi đường hầm sư tử có thiết kế đẹp dựa trên hình ảnh chú sư tử và các mỏm núi, đường hầm bắt mắt. Bộ đường lắp ráp kèm ô tô chạy tự động là món đồ chơi sáng tạo có nhạc đèn vui nhộn trẻ em kích thích sự phát triển trí não của bé.', N'Từ 3 tuổi trở lên', NULL, NULL,'CAT4'),
(N'Mô hình xe trộn bê tông Toystar', 'xetronbetong1.jpg', 'xetronbetong2.jpg', 'xetronbetong3.jpg','xetronbetong2.jpg', 486000.000, '2023-11-27', 50, N'Đồ chơi xe bồn trộn bê tông có đèn nhạc Toystar có đèn và âm thanh đặt phía trên đầu xe (xe sử dụng 3 pin AG13 cho đèn và âm thanh). Xe có thùng trộn bê tông có thể xoay được, khi cho các hạt nhỏ (gạo, đỗ, cát,....) vào trong thùng có thể xoay đổ ra được.', N'Từ 3 tuổi trở lên', NULL, NULL,'CAT4'),
(N'Mô hình bãi đỗ xe 3 tầng', 'baidoxe1.jpg', 'baidoxe2.jpg', 'baidoxe3.jpg','baidoxe4.jpg', 687000.000, '2023-11-27', 50, N'Bộ đồ chơi mô hình bãi đỗ xe 3 tầng có nhạc mang kích thước thu nhỏ của bãi đỗ xe 3 tầng được mô phỏng như trong thực tế. Xe được thiết kế có 3 tầng đỗ xe, đường đi cầu thang máy lên các tầng kèm theo 2 xe đồ chơi, tăng khả năng logic, sáng tạo, thông minh của bé khi chơi.', N'Từ 3 tuổi trở lên', NULL, NULL,'CAT4'),
(N'Xe đua F1 điều khiển từ xa', 'xeduaf1.png', 'xeduaf2.pnj', 'xeduaf3.png','xeduaf2.png', 295000.000, '2023-11-27', 50, N'Xe đua F1 điều khiển từ xa, có đèn Led và pin sạc Duka DK81036 được thiết kế mô phỏng theo xe thật với kiểu dáng hiện đại, bắt mắt cho bé cảm giác thích thú khi chơi, phát triển và hoàn thiện các kỹ năng và giác quan. Xe với 4 chức năng: Tiến - lùi - rẽ trái - rẽ phải, đèn led xinh động, các bé sẽ nhanh chóng nhập vai và thể hiện khả năng, bản lĩnh của một tay đua đích thực.', N'Từ 3 tuổi trở lên', NULL, NULL,'CAT5'),
(N'Robot bắn đĩa', 'robotbandia1.png', 'robotbandia2.png', 'robotbandia3.png','robotbandia4.png', 63000.000, '2023-11-27', 50, N'Đồ chơi nhựa - Robot bắn đĩa 27108 là món đồ chơi đang hot trên thị trường đồ chơi trẻ em hiện nay.Thông qua những món đồ chơi vận động này, bé sẽ học hỏi thêm nhiều điều mới lạ và thú vị. Với thiết kế đôc đáo, mới lạ, mang tính cách điệu, với nhiều tính năng hấp dẫn, đồ chơi robot điều khiển từ xa có bắn đĩa sẽ là món quà tuyệt vời mang đến cho bé và gia đình những nụ cười thoải mái sau những giờ học tập và làm việc.', N'Từ 3 tuổi trở lên', NULL, NULL,'CAT5'),
(N'Cầu trượt bóng rổ', 'cautruotbongro1.png', 'cautruotbongro2.png', 'cautruotbongro3.png','cautruotbongro4.png', 2290000.000, '2023-11-27', 50, N'Cầu trượt bóng rổ hình ô tô Toys House L-HT30 với thiết kế để bé có thể chơi leo bậc thang, ném bóng rổ, cầu trượt  giúp bé rèn luyện về thể chất và tăng cường sức khỏe theo đúng nghĩa với các hoạt động ngay tại nhà. Sản phẩm có 2 màu: Màu hồng, màu xanh dương bố mẹ có thể lựa chọn cho bé.', N'Từ 18 tháng trở lên', NULL, NULL,'CAT8'),
(N'Xe scooter trẻ em Scoot and Ride', 'scooter1.jpg', 'scooter2.jpg', 'scooter3.jpg','scooter1.jpg', 2290000.000, '2023-11-27', 50, N'Xe scooter trẻ em Scoot and Ride Highwaykick 3 LED (nhiều màu) là người bạn đồng hành lý tưởng cho trẻ từ 3 tuổi. Sản phẩm xe tập đi được làm từ chất liệu cao cấp bền bỉ để gắn bó và đồng hành cùng bé trong thời gian dài. Với thiết kế sang trọng, sành điệu và màu sắc thời thượng cùng hệ thống đèn LED bắt mắt, Highwaykick 3 giúp trẻ nổi bật giữa đám đông và thoải mái, tự tin để thể hiện cá tính riêng của mình.', N'Từ 3 tuổi trở lên', NULL, NULL,'CAT8');

INSERT INTO OrderDetails (order_id,product_id,quantity, price) VALUES 
(2, 9, 3,189000.000),
(2, 3, 1,63000.000),
(3, 5, 1,63000.000);

