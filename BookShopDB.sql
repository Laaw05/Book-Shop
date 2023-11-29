create database BOOKSHOPDB
go

use BOOKSHOPDB

CREATE TABLE LoaiSP (
    maLoai varchar(5) primary key,
    tenLoai nvarchar(50),
    ghiChu nvarchar(50),
    Anh text
);

CREATE TABLE SanPham (
    maSP varchar(5) primary key,
    tenSP ntext,
    maLoai varchar(5),
    maTG varchar(5),
    moTa ntext,
    donGia int,
    soLuong int,
    Anh text
);

CREATE TABLE TacGia (
    maTG varchar(5) primary key,
    tenTG nvarchar(50),
    moTa ntext
);

go

-- Thêm ràng buộc khóa ngoại trên bảng SanPham
ALTER TABLE SanPham
ADD CONSTRAINT FK_SanPham_LoaiSP FOREIGN KEY (maLoai) REFERENCES LoaiSP (maLoai);

ALTER TABLE SanPham
ADD CONSTRAINT FK_SanPham_TacGia FOREIGN KEY (maTG) REFERENCES TacGia (maTG);

go

INSERT INTO LoaiSP (maLoai, tenLoai, ghiChu, Anh)
VALUES 
    ('L001', N'Văn Học', N'Sách văn học đủ thể loại', 'sach-van-hoc.jpg'),
    ('L002', N'Thiếu Nhi', N'Sách thiếu nhi đủ thể loại', 'sach-thieu-nhi.jpg'),
    ('L003', N'Khoa Học- Công Nghệ', N'Các loại sách khoa học, tự nhiên và công nghệ', 'khoa-hoc-cong-nghe.jpg'),
    ('L004', N'Truyện tranh', N'Các loại truyện tranh phù hợp với mọi lứa tuổi', 'truyen-tranh.jpg'),
    ('L005', N'Tiểu thuyết', N'Tiểu thuyết đủ thể loại', 'tieu-thuyet.jpg'),
    ('L006', N'Chính trị', N'Các loại sách chính trị', 'chinh-tri.jpg');



INSERT INTO TacGia (maTG, tenTG, moTa)
VALUES 
    ('TG01', N'Nam Cao', N'Nam Cao (1915-1951) là một trong những tác giả tiêu biểu của văn học Việt Nam. Tác phẩm của ông thường tập trung vào cuộc sống xã hội và nhân văn, phản ánh những khía cạnh tâm lý, xã hội và văn hoá của người Việt Nam thời đó.'),
    ('TG02', N'Kim Lân', N'Kim Lân (1908-1950) là bút hiệu của nhà văn Nguyễn Tường Tam. Ông là một tác giả nổi tiếng trong văn học Việt Nam, với tác phẩm nổi bật như "Số đỏ" và "Chiếc lược ngà". Kim Lân đã góp phần đáng kể trong việc phản ánh xã hội và nhân văn trong thời kỳ đó.'),
	('TG03', N'Ngô Tất Tố', N'Ngô Tất Tố (1913-1976) - Nhà văn Việt, tác phẩm tập trung vào cuộc sống nông thôn, gia đình và tình yêu. Công hiến "Truyện nghèo", "Dế mèn phiêu lưu ký", "Làng". Ảnh hưởng sâu sắc đến văn học Việt Nam.'),
	('TG04', N'Hồ Chí Minh', N'Hồ Chí Minh (1890-1969) - Lãnh tụ cách mạng, nhà chính trị Việt Nam. Người sáng lập và lãnh đạo Đảng Cộng sản Việt Nam, chiến đấu vì độc lập, tự do và chủ nghĩa xã hội. Tượng trưng cho lòng yêu nước, sự kiên trung và tư tưởng nhân văn.'),
	('TG05', N'Phong Dương Comics', N'Phong Dương Comics - Nhà xuất bản truyện tranh Việt Nam. Tự hào với các tác phẩm đa dạng, từ truyện tranh hài hước đến trinh thám, kinh dị và phiêu lưu. Góp phần phát triển ngành truyện tranh trong nước, mang đến cho độc giả những trải nghiệm giải trí đa sắc màu.'),
	('TG06', N'Nguyễn Đinh Chi', N'Nguyễn Đinh Chi - Nhà văn Việt, tác giả nổi tiếng với tình yêu dành cho quê hương, biển cả và thiên nhiên. Tác phẩm của ông tập trung vào nhân văn, tâm lý con người và tình yêu. Góp phần làm phong phú văn hóa và văn học Việt Nam.'),
	('TG07', N'Edith Nesbit', N'Edith Nesbit (1858-1924) - Nhà văn Anh, tác giả nổi tiếng với tiểu thuyết và truyện ngắn dành cho trẻ em. Các tác phẩm của bà nổi bật với câu chuyện kỳ diệu, phép màu và thông điệp nhân văn. Góp phần xây dựng văn học thiếu nhi và ảnh hưởng sâu sắc đến nền văn hóa.'),
	('TG08', N'Minh Nhật', N'Minh Nhật, tác giả trẻ viết những tựa sách được yêu mến: "Sự lựa chọn của bầu trời", "Bỗng một ngày đẹp trời", "Hà Nội chờ", "Một chút mỗi ngày", "Nơi cơn gió ngừng chân", "Những quân cờ Domino", "Café yêu". Tác phẩm của cậu mang thông điệp sâu sắc về tình yêu và cuộc sống, thu hút độc giả trẻ và góp phần làm phong phú văn hóa đương đại.'),
	('TG00', N'Một số tác giả khác', N'Các tác giả văn học đa dạng về phong cách và chủ đề. Họ sáng tác để phản ánh cuộc sống, xã hội và nhân văn. Tác phẩm của họ góp phần làm nên văn hóa và ảnh hưởng sâu sắc đến văn học Việt Nam.');

INSERT INTO SanPham (maSP, tenSP, maLoai, maTG, moTa, donGia, soLuong, Anh)
VALUES 
    ('SP001', N'Đường Cách Mệnh', 'L006', 'TG04', N'Thuộc thể loại sách chính trị', 100000, 10, 'products/ct01.jpg'),
	('SP002', N'Chiến thắng Điện Biên Phủ', 'L006', 'TG00', N'Thuộc thể loại sách chính trị', 120000, 11, 'products/ct02.jpg'),
	('SP003', N'Nghệ thuật trả lời phỏng vấn của HCM', 'L006', 'TG00', N'Thuộc thể loại sách chính trị', 150000, 22, 'products/ct03.jpg'),
	('SP004', N'Tập bài giảng chính trị học', 'L006', 'TG00', N'Thuộc thể loại sách chính trị', 100000, 44, 'products/ct04.jpg'),
	('SP005', N'Phút sụp đổ của Việt Nam Cộng Hòa', 'L006', 'TG00', N'Thuộc thể loại sách chính trị', 170000, 12, 'products/ct05.jpg'),
	('SP006', N'Chủ nghĩa XHKH là gì?', 'L006', 'TG00', N'Thuộc thể loại sách chính trị', 100000, 14, 'products/ct06.jpg'),
    ('SP007', N'Công nghệ siêu thông minh', 'L003', 'TG00', N'Thuộc thể loại khoa học công nghệ và tự nhiên', 200000, 20, 'products/khcn01.jpg'),
	('SP008', N'Giáo trình công nghệ phần mềm', 'L003', 'TG00', N'Thuộc thể loại khoa học công nghệ và tự nhiên', 200000, 12, 'products/khcn02.jpg'),
	('SP009', N'Robot công nghiệp', 'L003', 'TG00', N'Thuộc thể loại khoa học công nghệ và tự nhiên', 140000, 34, 'products/khcn03.jpg'),
	('SP010', N'Bí mật của vũ trụ', 'L003', 'TG00', N'Thuộc thể loại khoa học công nghệ và tự nhiên', 200000, 07, 'products/khcn04.jpg'),
	('SP011', N'Bí mật của không khí', 'L003', 'TG00', N'Thuộc thể loại khoa học công nghệ và tự nhiên', 170000, 22, 'products/khcn05.jpg'),
	('SP012', N'Em tìm hiểu khoa học', 'L003', 'TG00', N'Thuộc thể loại khoa học công nghệ và tự nhiên', 168000, 12, 'products/khcn06.jpg'),
	('SP013', N'Từ nguyên tử đến sự sống', 'L003', 'TG06', N'Thuộc thể loại khoa học công nghệ và tự nhiên', 192000, 17, 'products/khcn07.jpg'),
	('SP014', N'Một ngày bằng 48 giờ', 'L003', 'TG00', N'Thuộc thể loại khoa học công nghệ và tự nhiên', 120000, 25, 'products/khcn08.jpg'),
	('SP015', N'Thần linh học Thuatan Chiêu Hồn', 'L003', 'TG00', N'Thuộc thể loại khoa học công nghệ và tự nhiên', 123000, 49, 'products/khcn09.jpg'),
	('SP016', N'Kĩ thuật chế biến lương thực', 'L003', 'TG00', N'Thuộc thể loại khoa học công nghệ và tự nhiên', 200000, 20, 'products/khcn10.jpg'),
    ('SP017', N'Thanh xuân có cậu là đủ rồi', 'L005', 'TG00', N'Thuộc các thể loại tiểu thuyết', 300000, 30, 'products/tth01.jpg'),
	('SP018', N'Những quân cờ Domino', 'L005', 'TG08', N'Thuộc các thể loại tiểu thuyết', 315000, 12, 'products/tth02.jpg'),
	('SP019', N'Chạy trốn mặt trời', 'L005', 'TG08', N'Thuộc các thể loại tiểu thuyết', 123000, 45, 'products/tth03.jpg'),
	('SP020', N'Nơi những cơn gió dừng chân', 'L005', 'TG08', N'Thuộc các thể loại tiểu thuyết', 178000, 22, 'products/tth04.jpg'),
	('SP021', N'Mộ đom đóm', 'L005', 'TG00', N'Thuộc các thể loại tiểu thuyết', 245000, 16, 'products/tth05.jpg'),
	('SP022', N'Sự lựa chọn của bầu trời', 'L005', 'TG08', N'Thuộc các thể loại tiểu thuyết', 179000, 14, 'products/tth06.jpg'),
	('SP023', N'Mang thai tuổi 17', 'L005', 'TG00', N'Thuộc các thể loại tiểu thuyết', 277000, 07, 'products/tth07.jpg'),
	('SP024', N'Quân khu nam đồng', 'L005', 'TG00', N'Thuộc các thể loại tiểu thuyết', 222000, 10, 'products/tth08.jpg'),
	('SP025', N'Ánh lửa trong tro tàn', 'L005', 'TG00', N'Thuộc các thể loại tiểu thuyết', 233000, 14, 'products/tth09.jpg'),
	('SP026', N'Ai mua hành tôi', 'L004', 'TG00', N'Thuộc thể loại truyện tranh phù hợp với mọi lứa tuổi', 100000, 12, 'products/tt01.jpg'),
	('SP027', N'Giận mày ai ở với tao', 'L004', 'TG00', N'Thuộc thể loại truyện tranh phù hợp với mọi lứa tuổi', 198000, 17, 'products/tt02.jpg'),
	('SP028', N'Cây tre trăm đốt', 'L004', 'TG00', N'Thuộc loại truyện tranh phù hợp với mọi lứa tuổi', 144000, 33, 'products/tt03.jpg'),
	('SP029', N'Quận gió', 'L004', 'TG00', N'Thuộc thể loại truyện tranh phù hợp với mọi lứa tuổi', 133000, 22, 'products/tt04.jpg'),
	('SP030', N'Long Thần Tướng', 'L004', 'TG05', N'Thuộc thể loại truyện tranh phù hợp với mọi lứa tuổi', 178000, 17, 'products/tt05.jpg'),
	('SP031', N'Sự tích bánh chưng bánh giày', 'L004', 'TG00', N'Thuộc thể loại truyện tranh phù hợp với mọi lứa tuổi', 145000, 23, 'products/tt06.jpg'),
	('SP032', N'Sự tích chú cuội', 'L004', 'TG00', N'Thuộc thể loại truyện tranh phù hợp với mọi lứa tuổi', 123000, 22, 'products/tt07.jpg'),
	('SP033', N'Vua hải tặc', 'L004', 'TG00', N'Thuộc thể loại truyện tranh phù hợp với mọi lứa tuổi', 170000, 04, 'products/tt08.jpg'),
	('SP034', N'Cậu bé của JO', 'L002', 'TG00', N'Thuộc các thể loại sách dành cho thiếu nhi', 111000, 12, 'products/tn01.jpg'),
	('SP035', N'Jack và cây đậu thần', 'L002', 'TG00', N'Thuộc các thể loại sách dành cho thiếu nhi', 123000, 22, 'products/tn02.jpg'),
	('SP036', N'Mèo con và quyển sách', 'L002', 'TG00', N'Thuộc các thể loại sách dành cho thiếu nhi', 145000, 14, 'products/tn03.jpg'),
	('SP037', N'Dế mèn phiêu lưu kí', 'L002', 'TG00', N'Thuộc các thể loại sách dành cho thiếu nhi', 178000, 44, 'products/tn04.jpg'),
	('SP038', N'Gi Gỉ Gì Gi Cái gì cũng biết', 'L002', 'TG00', N'Thuộc các thể loại sách dành cho thiếu nhi', 156000, 13, 'products/tn05.jpg'),
	('SP039', N'Thành phố phép màu', 'L002', 'TG07', N'Thuộc các thể loại sách dành cho thiếu nhi', 177000, 27, 'products/tn06.jpg'),
	('SP040', N'Chúng tớ được sinh ra và lớn lên như thế nào', 'L002', 'TG00', N'Thuộc các thể loại sách dành cho thiếu nhi', 189000, 17, 'products/tn07.jpg'),
	('SP041', N'Ba người bạn', 'L001', 'TG01', N'Thuộc thể loại Văn học', 300000, 12, 'products/vh01.jpg'),
	('SP042', N'Bảy bông lúa lép', 'L001', 'TG01', N'Thuộc thể loại Văn học', 300000, 14, 'products/vh02.jpg'),
	('SP044', N'Làng', 'L001', 'TG02', N'Thuộc thể loại Văn học', 300000, 23, 'products/vh03.jpg'),
	('SP045', N'Chí Phèo', 'L001', 'TG01', N'Thuộc thể loại Văn học', 300000, 21, 'products/vh04.jpg'),
	('SP046', N'Vợ Nhặt', 'L001', 'TG02', N'Thuộc thể loại Văn học', 300000, 30, 'products/vh05.jpg'),
	('SP047', N'Tắt đèn', 'L001', 'TG03', N'Thuộc thể loại Văn học', 300000, 31, 'products/vh06.jpg'),
	('SP048', N'Sống mòn', 'L001', 'TG01', N'Thuộc thể loại Văn học', 300000, 11, 'products/vh07.jpg'),
	('SP049', N'Việc Làng', 'L001', 'TG03', N'Thuộc thể loại Văn học', 300000, 07, 'products/vh08.jpg'),
	('SP050', N'Đức Thánh Trần', 'L001', 'TG00', N'Thuộc thể loại Văn học', 300000, 33, 'products/vh09.jpg'),
	('SP051', N'Hà Nội dầu xưa, phố cũ', 'L001', 'TG00', N'Thuộc thể loại Văn học', 300000, 12, 'products/vh10.jpg'),
	('SP052', N'Vọng Sài Gòn', 'L001', 'TG00', N'Thuộc thể loại Văn học', 300000, 22, 'products/vh11.jpg');

go

DROP TABLE SanPham;
DROP TABLE TacGia;
DROP TABLE LoaiSP;