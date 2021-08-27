CREATE DATABASE GAMEQUIZ
GO
USE GAMEQUIZ
GO
CREATE TABLE BOCAUHOI
(
	MACAUHOI VARCHAR(10) PRIMARY KEY,
	CHUDE NVARCHAR(10),
	LOAICAUHOI NCHAR(2),
	CAUHOI NVARCHAR(200),
	A NVARCHAR(200),
	B NVARCHAR(200),
	C NVARCHAR(200),
	D NVARCHAR(200),
	DATL NVARCHAR(100),
	DAPAN CHAR(1),
	GHICHU NVARCHAR(200)
)

CREATE TABLE USERS
(
	ID_USER VARCHAR(10) PRIMARY KEY,
	TEN NVARCHAR(10),
	SOMANG INT,
	IP_USER CHAR(15),
)

CREATE TABLE ROOM 
(
	ID_ROOM VARCHAR(10),
	TYPE_ROOM INT,
	STATUS_ROOM VARCHAR(10),
	SONGUOI INT
)

CREATE TABLE ROOMQUESTION
(
	STT VARCHAR(2) PRIMARY KEY,
	MACAUHOI VARCHAR(10),
	ID_ROOM VARCHAR(10),
)

CREATE TABLE USERINROOM
(
	ID_ROOM VARCHAR(10),
	ID_USER VARCHAR(10)
)

ALTER TABLE BOCAUHOI ALTER COLUMN GHICHU NVARCHAR(2000);

/* TẠO KHÓA NGOẠI */
ALTER TABLE ROOMQUESTION ADD CONSTRAINT FK_MACAUHOI FOREIGN KEY (MACAUHOI) REFERENCES BOCAUHOI (MACAUHOI);
ALTER TABLE ROOMQUESTION ADD CONSTRAINT FK_ID_ROOM_RQUESTION FOREIGN KEY (ID_ROOM) REFERENCES ROOM (ID_ROOM);
ALTER TABLE USERINROOM ADD CONSTRAINT FK_ID_ROOM_UIR FOREIGN KEY (ID_ROOM) REFERENCES ROOM (ID_ROOM);
ALTER TABLE USERINROOM ADD CONSTRAINT FK_ID_USER_UIR FOREIGN KEY (ID_USER) REFERENCES USERS (ID_USER);

ALTER TABLE USERS ALTER COLUMN IP_USER VARCHAR(30);

SELECT *FROM BOCAUHOI

DELETE FROM BOCAUHOI WHERE MACAUHOI = 'TN40'

DELETE FROM USERS
DELETE FROM ROOM

SELECT CHUDE, COUNT(MACAUHOI)
FROM BOCAUHOI
GROUP BY CHUDE 

INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'DS01', N'DS', N'TN', N'Năm 2016, nguyên nhân nào dẫn đến hiện tượng cá chết hàng loạt ở một số tỉnh miền Trung của Việt Nam?
', N'Nước biển nóng lên
', N'Hiện tượng thủy triều đỏ
', N'Ô nhiễm môi trường nước
', N'Độ mặn của nước biển tăng
', NULL,
'C',
N'Vào năm 2016 nhà máy Formosa đã xảy thải các chất thải độc hại ra môi trường nước không qua xử lí nên đã làm gây ô nhiễm môi trường nước biển và làm chết rất nhiều cá và sinh vật biển.
')
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'DS02', N'DS', N'TN', N'Đâu không phải là tên gọi của virus corona chủng mới năm 2020?
', N'nCoV
', N'SARS-COV2
', N'COVID-19
', N'SARS
', NULL,
'C',
NULL)
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'DS03', N'DS', N'TN', N'Đâu là cơ quan quyền lực cao nhất của Việt Nam?
', N'Quốc Hội
', N'Chính phủ
', N'Mặt trận Tổ Quốc
', N'Ủy ban Dân tộc
', NULL,
'A',
NULL)
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'DS04', N'DS', N'TN', N'Thương hiệu nào sau đây không thuộc sở hữu của Vingroup?
', N'Vinhomes
', N'Vinmart
', N'VinFast
', N'Vinpearl
', NULL,
'B',
NULL)
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'DS05', N'DS', N'TN', N'Đâu không phải là tiêu chí để xét Sinh viên 5 tốt?
', N'Học tập tốt
', N'Hội nhập tốt
', N'Đoàn kết tốt
', N'Thể lực tốt
', NULL,
'C',
NULL)
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'DS06', N'DS', N'TN', N'Nhân vật nào trong series Avengers của Marvel bị biến mất sau sự kiện búng tay của Thanos?
', N'Nick Fury
', N'Ant Man
', N'Iron Man
', N'Hulk
', NULL,
'A',
NULL)
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'DS07', N'DS', N'TN', N'Thương hiệu mỹ phẩm nào sau đây là thương hiệu của Việt Nam?
', N'Klairs', N'The Body Shop', N'Cocoon', N'Senka', NULL, 'C', NULL)
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'DS08', N'DS', N'TN', N'Trang mạng xã hội nào không phải do Việt Nam phát hành?
', N'Zingme
', N'Daum
', N'Zalo
', N'Lotus
', NULL,
'B',
NULL)
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'DS09', N'DS', N'TN', N'Dây của cây vĩ dùng để kéo đàn violin được làm từ lông đuôi của con vật nào?', N'Ngựa', N'Trâu', N'Bò', N'Cừu', NULL,
'A',
NULL)
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'DS10', N'DS', N'TN', N'Họa sỹ Van Gogh là người nước nào?', N'Hà Lan', N'Pháp', N'Anh', N'Ý', NULL,
'A',
NULL)
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'KHXH01', N'KHXH', N'TN', N'Dao động thủy triều nhỏ nhất khi… 
', N'Mặt Trăng, Trái Đất, Mặt Trời tạo thành một góc 120o.
', N'Mặt Trăng, Trái Đất, Mặt Trời tạo thành một góc 45o.
', N'Mặt Trăng, Trái Đất, Mặt Trời tạo thành một góc 90o.
', N'Mặt Trăng, Trái Đất, Mặt Trời tạo nằm thẳng hàng.
', NULL,
'C',
NULL)
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'KHXH02', N'KHXH', N'TN', N'Loại công cụ lao động nào do cuộc cách mạng khoa học kĩ thuật lần thứ hai tạo lên đã được xem như “trung tâm thần kinh” kĩ thuật, thay con người trong toàn bộ quá trình sản xuất liên tục?
', N'“Người máy” (Rô-bốt).
', N'Máy tính điện tử.
', N'Hệ thống máy tự động.
', N'Máy tự động.
', NULL,
'B',
NULL)
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'KHXH03', N'KHXH', N'TN', N'Máy tính điện tử đầu tiên ra đời ở nước nào?', N'Mĩ', N'Nhật', N'Liên Xô', N'Anh', NULL,
'A',
NULL)
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'KHXH04', N'KHXH', N'TN', N'Việt Nam được chính thức xác nhận là nước xã hội chủ nghĩa vào thời gian nào?
', N'2/7/1976
', N'10/10/1954
', N'25/4/1976
', N'18/12/1986
', NULL,
'A',
NULL)
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'KHXH05', N'KHXH', N'TN', 
N'Bản đồ gen được giải mã hoàn chỉnh vào năm nào?', N'1947', N'1961', N'2000', N'2003', NULL,
'D',
N'Tháng 6 – 2000, sau 10 năm hợp tác nghiên cứu, các nhà khoa học của các nước Anh, Pháp, Mĩ, Đức, Nhật Bản và Trung Quốc đã công bố “Bản đồ gen người”. 
Đến tháng 3 – 2003, bản đồ này mới được hoàn chỉnh.')
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'KHXH06', N'KHXH', N'TN', N'Trái đất gồm 3 lớp, từ ngoài vào trong bao gồm:
', N'Lớp vỏ trái đất, lớp Manti trên, lớp nhân trong.
', N'Lớp vỏ trái đất, lớp Manti, lớp nhân trong.
', N'Lớp nhân trong . lớp Manti, lớp vỏ lục địa.
', N'Lớp Manti, lớp vỏ lục địa, lớp nhân .
', NULL,
'B',
NULL)
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'KHXH07', N'KHXH', N'TN', N'Do mâu thuẫn cá nhân mà N đánh M gây tổn hại sức khỏe tới 15%. Hành vi của N là vi phạm…
', N'dân sự
', N'hành chính
', N'hình sự
', N'kỷ luật
', NULL,
'C',
NULL)
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'KHXH08', N'KHXH', N'TN', N'Vấn đề quan trọng hàng đầu vào mùa khô ở vùng Đồng bằng sông Cửu Long là:
', N'Nước ngọt
', N'Phân bón
', N'Bảo vệ rừng ngập mặn
', N'Cải tạo giống
', NULL,
'A',
N'Ở vùng Đồng bằng sông Cửu Long có mùa khô sâu sắc, xâm nhập mặn vào sâu trong đất liền nên vấn đề nước ngọt là quan trọng nhất để thao chua, rửa mặn,…')
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'KHXH09', N'KHXH', N'TN', N'Quá trình feralit diễn ra mạnh mẽ ở vùng nào?
', N'Núi cao
', N'Đồi núi thấp
', N'Đồng bằng ven biển
', N'Đồng bằng châu thổ
', NULL,
'B',
NULL)
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'KHXH10', N'KHXH', N'TN', N'Gió mùa Đông Bắc ở nước ta xuất phát từ đâu?
', N'Trung tâm áp cao Nam Ấn Độ Dương
', N'Trung tâm áp cao Xibia
', N'Trung tâm áp cao Haoai
', N'Trung tâm áp cao Ôxtraylia
', NULL,
'B',
NULL)
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'KHXH11', N'KHXH', N'TN', N'Nguyên nhân chủ yếu khiến tỉ lệ thiếu việc làm ở nông thôn nước ta còn cao?
', N'Sản xuất nông nghiệp mang tính màu vụ, hoạt động phi nông nghiệp còn hạn chế
', N'Tỉ lệ lao động qua đào tạo ở nông thôn thấp
', N'Lực lượng lao động tập trung quá đông ở khu vực nông thôn
', N'Đầu tư khoa học kĩ thuật làm tăng năng suất lao động
', NULL,
'A',
N'Ở các vùng nông thôn chủ yếu sản xuất nông nghiệp, rất ít các hoạt động phi nông nghiệp. Sản xuất nông nghiệp lại có tính mùa vụ, có một khoảng thời gian nhàn rỗi, vì vậy, tỉ lệ thiếu việc làm ở nông thôn nước ta còn cao (9,3% - 2005).
')
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'KHXH12', N'KHXH', N'TN', N'Ở bán cầu Bắc, chịu tác động của lực Côriolit, gió Nam sẽ bị lệch hướng trở thành
', N'Gió Đông Nam (hoặc Đông Đông Nam, Nam Đông Nam)
', N'Gió Tây Nam (hoặc Tây Tây Nam, Nam Tây Nam)
', N'Gió Đông Bắc (hoặc Đông Bắc, Bắc Đông Bắc)
', N'Gió Tây Bắc (hoặc Tây Tây Bắc, Bắc Tây Bắc)
', NULL,
'B',
N'Giải thích: Lực làm lệch hướng đó được gọi là lực Côriôlit. Ở bán cầu Bắc, vật chuyển động bị lệch về bên phải, ở bán cầu Nam bị lệch về bên trái theo hướng chuyển động nên ở bán cầu Bắc gió Nam sẽ bị lệch hướng trở thành gió Tây Nam (hoặc Tây Tây Nam, Nam Tây Nam).
')
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'KHXH13', N'KHXH', N'TN', N'Trong bốn địa điểm trên đất nước ta lần lượt từ Nam lên Bắc là thành phố Hồ Chí Minh , Nha Trang , Vinh , Hà Nội nơi nào có 2 lần mặt trời đi qua thiên đình gần nhau nhất?
', N'Tp . Hồ Chí Minh
', N'Nha Trang
', N'Vinh
', N'Hà Nội
', NULL,
'D',
N'Hà Nội ở gần chí tuyến nên có thời gian hai lần Mặt Trời lên thiên đỉnh gần nhau nhất. TP. Hồ Chí Minh ở gần xích đạo nên có thời gian 2 lần Mặt Trời lên thiên đỉnh xa nhau nhất trong năm.
')
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'KHXH14', N'KHXH', N'TN', N'Ở nước ta hiện nay, đạo nào được nhiều người theo nhất?
', N'Phật giáo
', N'Cao Đài
', N'Kito
', N'Thiên chúa giáo
', NULL,
'A',
NULL)
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'KHXH15', N'KHXH', N'TN', N'Sự kiện nào đánh dấu bước chuyển biến lớn của cục diện chính trị thế giới trong Chiến tranh thế giới thứ nhất?
', N'Chính phủ mới được thành lập ở Đức
', N'Cách mạng bùng nổ mạnh mẽ ở Đức
', N'Đức kí hiệp định đầu hàng không điều kiện
', N'Cách mạng tháng Mười Nga thắng lợi và Nhà nước Xô viết được thành lập
', NULL,
'D',
NULL)
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'KHXH16', N'KHXH', N'TN', N'Mâu thuẫn sâu sắc giữa giai cấp vô sản và giai cấp tư sản đã dẫn đến cuộc đấu tranh của…
', N'Công nhân chống ách áp bức bóc lột, đòi cải thiện đời sống
', N'Vô sản chống tư sản
', N'Công nhân và nông dân chống tư sản
', N'Các tầng lớp nhân dân chống tư sản
', NULL,
'B',
NULL)
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'KHXH17', N'KHXH', N'TN', N'Người sáng lập học thuyết chủ nghĩa xã hội khoa học là ai?
', N'Mác và Lênin
', N'Mác và Ăngghen
', N'Ăngghen và Lênin
', N'Ăngghen và Đim-tơ-rốp
', NULL,
'B',
NULL)
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'KHXH18', N'KHXH', N'TN', N'Tuyên ngôn của Đảng Cộng sản ra đời vào năm nào?', N'1846', N'1848', N'1887', N'1889', NULL,
'B',
NULL)
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'KHXH19', N'KHXH', N'TN', N'Hiệp hội cấc nước Đông Nam Á (ASEAN) được thành lập vào năm nào?
', N'1967', N'1977', N'1995', N'1997', NULL,
'A',
NULL)
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'KHXH20', N'KHXH', N'TN', N'Nhân tố nào làm ảnh hưởng xấu tới môi trường đầu tư của các nước Đông Nam Á?
', N'Đói nghèo
', N'Ô nhiễm môi trường
', N'Thất nghiệp và thiếu việc làm
', N'Mức ổn định do vấn đề dân tộc, tôn giáo
', NULL,
'D',
NULL)
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'KHXH21', N'KHXH', N'TN', N'Một trong những vấn đề mang tính toàn cầu mà nhân loại đang phải đối mặt là gì?
', N'Mất cân bằng giới tính
', N'Ô nhiễm môi trường
', N'Cạn kiệt nguồn tài nguyên
', N'Động đất và núi lửa
', NULL,
'B',
NULL)
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'KHXH22', N'KHXH', N'TN', N'Việc dân số thế giới tăng nhanh đã dẫn đến việc gì?
', N'Thúc đẩy nhanh sự phát triển kinh tế
', N'Làm cho tài nguyên suy giảm và ô nhiễm môi trường
', N'Thúc đẩy giáo dục và y tế phát triển
', N'Làm cho chất lượng cuộc sống ngày càng tăng
', NULL,
'B',
N'Dân số thế giới ngày càng tăng, đặc biệt là ở các nước kém phát triển và đang phát triển. Dân số tăng nhanh gây sức ép rất lớn đến kinh tế - tài nguyên và môi trường (suy giảm – ô nhiễm môi trường nặng nề ở nhiều nước).
')
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'KHXH23', N'KHXH', N'TN', N'Dân số già sẽ dẫn tới hậu quả nào sau đây?
', N'Thất nghiệp và thiếu việc làm
', N'Thiếu hụt nguồn lao động cho đất nước
', N'Gây sức ép tới tài nguyên môi trường
', N'Tài nguyên nhanh chóng cạn kiệt
', NULL,
'B',
N'Dân số thế giới đang có sự già hóa, tỉ lệ người trên 65 tuổi ngày càng cao. Sự già hóa dân số sẽ làm thiếu hụt một nguồn lao động rất lớn cho các quốc gia, vì vậy Nhà nước cần có chính sách phát triển dân số hợp lí.
')
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'KHXH24', N'KHXH', N'TN', N'Một trong những biểu hiện rõ nhất của biến đổi khí hậu là…
', N'Xuất hiện nhiều động đất
', N'Nhiệt độ Trái Đất tăng
', N'Băng ở vùng cực ngày càng dày
', N'Núi lửa sẽ hình thành ở nhiều nơi
', NULL,
'B',
NULL)
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'KHXH25', N'KHXH', N'TN', N'Ở Việt Nam, vùng nào sẽ chịu ảnh hưởng nặng nề nhất của biến đổi khí hậu do nước biển dâng?
', N'Trung du và miền núi Bắc Bộ
', N'Đồng bằng sông Hồng
', N'Tây Nguyên
', N'Đồng bằng sông Cửu Long
', NULL,
'D',
N'Đồng bằng sông Cửu Long là vùng có địa hình thấp nhất nước ta và cũng đang là vùng chịu ảnh hưởng nặng nề nhất của biến đổi khí hậu do nước biển dâng.
')
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'KHXH26', N'KHXH', N'TN', N'Nhà nước nào không thuộc thời đại Tam Quốc?
', N'Tào Ngụy
', N'Thục Hán
', N'Kinh Sở
', N'Đông Ngô
', NULL,
'C',
NULL)
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'KHXH27', N'KHXH', N'TN', N'Lý Thái Tổ dời đô ra Thăng Long vào năm nào?
', N'1010
', N'1011', N'1012', N'1020', NULL,
'A',
NULL)
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'VH01', N'VH', N'TN', N'Đoàn quân Tây tiến được thành lập năm nào?
', N'1945
', N'1946
', N'1947', N'1948', NULL,
'C',
NULL)
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'VH02', N'VH', N'TN', N'Chọn từ mà tác giả Nguyễn Đình Thi đã dùng để điền vào chỗ trống trong câu thơ sau: Từ những năm đau thương chiến đấu/ Đã … lên nét mặt quê hương
', N'Bừng', N'Ngời', N'Sáng', N'Ánh', NULL, 'B', NULL)
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'VH03', N'VH', N'TN', N'Bài thơ "Theo chân Bác" của Tố Hữu in trong tập thơ nào?
', N'Việt Bắc
', N'Gió lộng
', N'Ra trận
', N'Máu và hoa
', NULL,
'C',
NULL)
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'VH04', N'VH', N'TN', N'Sáng tác của Nguyễn Ái Quốc, Hồ Chí Minh không bao gồm những thể loại nào trong các thể loại sau đây:
', N'Văn chính luận
', N'Truyện kí
', N'Thơ ca
', N'Hò vè
', NULL,
'D',
NULL)
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'VH05', N'VH', N'TN', N'Từ láy được phân thành mấy loại?
', N'Hai loại
', N'Ba loại
', N'Bốn loại
', N'Năm loại
', NULL,
'A',
N'Được chia thành 2 loại: từ láy bộ phận và từ láy toàn bộ')
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'VH07', N'VH', N'TN', N'Văn học Việt Nam bao gồm những bộ phận nào ? 
', N'Văn học dân gian và văn học viết
', N'Văn học dân gian và văn xuôi 
', N'Văn học dân gian và thơ 
', N'Văn học dân gian và kịch
', NULL,
'A',
NULL)
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'VH08', N'VH', N'TN', N'Thần thoại và sử thi giống nhau ở điểm nào?
', N'Đều là tác phẩm tự sự dân gian
', N'Đều kể về các vị thần
', N'Đều kể về những biến đổi lớn diễn ra trong đời sống cộng đồng
', N'Đều sử dụng ngôn ngữ có vần, có nhịp điệu
', NULL,
'A',
NULL)
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'VH09', N'VH', N'TN', N'Bi kịch lớn nhất của An Dương Vương là gì?
', N'Bi kịch tình yêu
', N'Bi kịch mất cảnh giác
', N'Bi kịch chiến tranh
', N'Bi kịch mất nước
', NULL,
'D',
NULL)
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'VH10', N'VH', N'TN', N'Vì sao trong văn bản viết, người ta dùng các từ ngữ mang tính địa phương?
', N'Tránh sự kỳ thị địa phương.
', N'Tránh sự khó hiểu.
', N'Cả A và B đều đúng.
', N'Cả A và B đều sai.
', NULL,
'B',
NULL)
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'VH11', N'VH', N'TN', N'Trong những cụm từ sau đây, cụm từ nào không phải là thành ngữ?
', N'Nước đỗ lá khoai
', N'Chuột chạy cùng sào
', N'Cờ đến tay ai, người đó khuất
', N'Đẽo cày giữa đường
', NULL,
'C',
NULL)
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'VH12', N'VH', N'TN', N'Hiểu như thế nào về hình ảnh “mẹ yêu thương” trong bài thơ Tiếng hát con tàu của Chế Lan Viên?
', N'Đó là mẹ của nhà thơ.
', N'Một người mẹ Tây Bắc nào đó.
', N'Đó là nhân dân, đất nước.
', N'Cả ba hình ảnh trên.
', NULL,
'C',
NULL)
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'VH13', N'VH', N'TN', N'Nhân vật chính trong tác phẩm "Hai đứa trẻ" của Thạch Lam là ai?
', N'Chị em Liên
', N'Chị em Lan
', N'Chị em Lam
', N'Chị em Linh
', NULL,
'A',
NULL)
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'DS13', N'DS', N'TL', N'Chiếc máy bay của hãng hàng không Malaysia Airlines đi từ Kuala Lumpur đến Bắc Kinh đã mất tích vào ngày 8/4/2014 có số hiệu là gì?
', NULL, NULL, NULL, NULL, N'MH370', NULL, N'Vào ngày 8.3.2014, chuyến bay MH370 đã biến mất khỏi màn hình radar trong vòng chưa đầy 1 giờ kể từ khi cất cánh từ sân bay Kuala Lumpur đến Bắc Kinh. Các nỗ lực tìm kiếm chiếc máy bay, chủ yếu tập trung ở vùng biển phía nam của Ấn Độ Dương, đã bị ngừng lại vào năm 2018. Đến nay, MH370 vẫn là một trong những bí ẩn lớn nhất của ngành hàng không dân dụng thế giới.
')
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'KHXH41', N'KHXH', N'TL',
N'Tổng Bí thư đầu tiên của Đảng Cộng sản Việt Nam là ai?',
NULL, NULL, NULL, NULL, N'Trần Phú', NULL, NULL)
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'KHXH42', N'KHXH', N'TL',
N'Việt Nam nằm ở múi giờ số mấy? (chỉ điền số)
', NULL, NULL, NULL, NULL, 
N'7', NULL, NULL)
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'KHXH43', N'KHXH', N'TL',
N'Ai là người đã dẹp loạn 12 sứ quân?', NULL, NULL, NULL, NULL, N'Đinh Bộ Lĩnh', NULL, NULL)

/* Insert lần 2 */
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'KHXH28', N'KHXH', N'TN', 
N'Tên của nữ thần tình yêu và sắc đẹp?
', N'Hera
', N'Artemis
', N'Athena
', N'Aphrodite
', NULL,
'D', NULL)
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'KHXH29', N'KHXH', N'TN', 
N'"Tuyên ngôn độc lập" của Hồ Chí Minh được xem là bản tuyên ngôn thứ mấy trong lịch sử Việt Nam?
', N'Thứ nhất
', N'Thứ hai
', N'Thứ ba
', N'Thứ tư
', NULL,
'C', N'Bản tuyên ngôn thứ nhất là bài thơ thần "Nam Quốc Sơn Hà" ở thế kỉ XI, bản tuyên ngôn thứ hai là "Bình Ngô Đại Cáo" của Nguyễn Trãi năm 1428.')

INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'KHXH30', N'KHXH', N'TN', 
N'Trong các tác phẩm kinh điển sau đây, tác phẩm nào được đánh giá là văn kiện đầu tiên có tính cương lĩnh của chủ nghĩa Mác, thể hiện sự chín muồi về mặt thế giới quan mới của C. Mác và Ăngghen?
', N'Gia đình thần thánh (1845)
', N'Hệ tư tưởng Đức (1845 - 1846)
', N'Luận cương về L. Phoiơbắc (1845)
', N'Tuyên ngôn của Đảng Cộng sản (1848)
', NULL,
'D', NULL)

INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'VH06', N'VH', N'TN', 
N'"Nguyễn Quang Sáng còn là tác giả của nhiều kịch bản phim điện ảnh nổi tiếng. Bộ phim nào được sản xuất trên kịch bản do ông viết giành Huy chương vàng Liên hoan phim Moscow 1981?
', N'Mùa nước nổi
', N'Cánh đồng hoang
', N'Câu nói dối đầu tiên
', N'Dòng sông hát
', NULL,
'B', N'Cánh đồng hoang là bộ phim điện ảnh Việt Nam với đề tài chiến tranh Việt Nam của đạo diễn Nguyễn Hồng Sến. Bối cảnh là vùng Đồng Tháp Mười, không gian bộ phim chỉ vỏn vẹn trong chu vi của một cánh đồng hoang nhưng được khai thác cả không gian từ dưới nước đến tận trên không. Phim đạt được nhiều giải thưởng cao như: giải biên kịch Bông sen vàng, giải quay phim, nam diễn viên (Liên hoan phim Việt Nam 1980), huy chương vàng (Liên hoan phim Quốc tế Moscow 1981).
')

/* INSERT 3RD */
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'KHXH31', N'KHXH', N'TN', 
N'Trong các câu hỏi sau đây, câu hỏi nào là biến thể của cách diễn đạt vấn đề cơ bản của triết học: "Não người đã phát triển như thế nào?"
', N'Nội dung của các tư tưởng của con người xuất hiện từ đâu và bằng cách nào?
', N'Tư duy được thực hiện trong các hình thức nào và tuần theo các quy luật nào?
', N'Mục đích và ý nghĩa của sự tồn tại người là gì?
', N'Tại sao con người cần có ý thức?
', NULL,
'A', NULL)

INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'KHXH32', N'KHXH', N'TN', 
N'Chủ nghĩa Mác - Lênin là học thuyết khoa học:
', N'Đã phát triển đến mức hoàn toàn đầy đủ.
', N'Trong đó mọi vấn đề được giải quyết triệt để, chỉ cần nghiên cứu và vận dụng trong thực tiễn.
', N'Có thể thay thế cho mọi khoa học.
', N'Không ngừng phát triển trên cơ sở tổng kết những thành tựu mới của sự phát triển các khoa học và thực tiễn.
', NULL,
'D', NULL)

INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'KHXH33', N'KHXH', N'TN', 
N'Thế giới quan là…
', N'Quan niệm của con người về thế giới
', N'Hệ thống quan niệm của con người về thế giới
', N'Hệ thống quan niệm, quan điểm lý luận của con người về thế giới
', N'Hệ thống quan niệm, quan điểm chung nhất của con người về thế giới
', NULL,
'D', NULL)

INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'KHXH34', N'KHXH', N'TN', 
N'Cung là khối lượng hàng hóa, dịch vụ…
', N'Đang lưu thông trên thị trường
', N'Hiện có trên thị trường và chuẩn bị đưa ra thị trường
', N'Đã có mặt trên thị trường
', N'Do các doanh nghiệp sản xuất đưa ra thị trường
', NULL,
'B', NULL)

INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'KHXH35', N'KHXH', N'TN', 
N'Vận dụng quan hệ cung – cầu để lí giải tại sao có tình trạng “cháy vé” trong một buổi ca nhạc có nhiều ca sĩ nổi tiếng biểu diễn?
', N'Do cung = cầu
', N'Do cung > cầu
', N'Do cung < cầu
', N'Do cung, cầu rối loạn
', NULL,
'C', NULL)

INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'KHXH36', N'KHXH', N'TN', 
N'Hành vi gièm pha doanh nghiệp khác bằng cách trực tiếp đưa ra thông tin không trung thực thuộc loại cạnh tranh nào dưới đây?
', N'Cạnh tranh tự do
', N'Cạnh tranh lành mạnh
', N'Cạnh tranh không lành mạnh
', N'Cạnh tranh không trung thực
', NULL,
'C', NULL)

INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'KHXH37', N'KHXH', N'TN', 
N'Anh Q đi xe máy vượt đèn đỏ, bị cảnh sát giao thông xử phạt tiền 400.000 đồng. Cho rằng mức phạt này quá cao, anh Q có thể làm gì trong các việc làm dưới đây cho đúng pháp luật?
', N'Khiếu nại đến Giám độc Công an tỉnh.
', N'Tố cáo với thủ trưởng đơn vị của người cảnh sát đã xử phạt mình.
', N'Khiếu nại đến người cảnh sát giao thông đã xử phạt mình.
', N'Đăng bài lên Facebook nói xấu người cảnh sát này.
', NULL,
'C', NULL)

INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'KHXH38', N'KHXH', N'TN', 
N'Đâu không phải là một cuộc khởi nghĩa trong phong trào "Cần Vương" (1885 - 1896)?
', N'Khởi nghĩa Hương Khê
', N'Khởi nghĩa Ba Đình
', N'Khởi nghĩa Bãi Sậy
', N'Khởi nghĩa Yên Bái
', NULL,
'D', N'Khởi nghĩa Hương Khê (1885–1896) của Phan Đình Phùng, Cao Thắng ở Hương Khê, Hà Tĩnh; khởi nghĩa Ba Đình (1886–1887) của Đinh Công Tráng, Phạm Bành ở Nga Sơn, Thanh Hóa; Khởi nghĩa Bãi Sậy (1883–1892) của Nguyễn Thiện Thuật ở Hưng Yên. Riêng cuộc khởi nghĩa Yên Bái diễn ra năm 1930 do Việt Nam Quốc dân Đảng (VNQDĐ) tổ chức và lãnh đạo nhằm đánh chiếm một số tỉnh và thành phố trọng yếu của miền Bắc Việt Nam.')

INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'KHXH39', N'KHXH', N'TN', 
N'Quốc gia nào sau đây thuộc khu vực Bắc Âu?
', N'Thổ Nhĩ Kỳ
', N'Phần Lan
', N'Đức
', N'Ireland
', NULL,
'B', NULL)

INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'KHXH40', N'KHXH', N'TN', 
N'Thành phố Sài Gòn được đổi tên thành thành phố Hồ Chí Minh vào năm nào?
', N'1975
', N'1976
', N'1977
', N'1978
', NULL,
'B', N'Ngày 02/07/1976, Việt Nam tái thống nhất và Quốc hội nước Việt Nam thống nhất quyết định đổi tên thành phố Sài Gòn – Gia Định thành Thành phố Hồ Chí Minh, theo tên Chủ tịch nước đầu tiên của Việt Nam Dân chủ Cộng hòa.')

INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'KHXH44', N'KHXH', N'TL', 
N'Có bao nhiêu vị thần trên đỉnh Olympus? (Ghi số lượng)
', NULL, NULL, NULL, NULL, 
N'12', NULL, NULL)

INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'KHXH45', N'KHXH', N'TL', 
N'Khi Trái Đất, mặt trăng, mặt trời cùng nằm trên một đường thẳng theo thứ tự được gọi là hiện tượng gì?
', NULL, NULL, NULL, NULL, 
N'Nhật thực', NULL, NULL)

INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'KHXH46', N'KHXH', N'TL', 
N'Công dân từ đủ 18 tuổi có quyền tham gia ứng cử đại biểu Quốc hội, ứng cử đại biểu Hội đổng nhân dân là đúng hay sai?
', NULL, NULL, NULL, NULL, 
N'Sai', NULL, NULL)

INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'KHXH47', N'KHXH', N'TL', 
N'Ngày đầu thành lập, ASEAN có bao nhiêu thành viên? (Ghi số lượng)
', NULL, NULL, NULL, NULL, 
N'5', NULL, N'ASEAN được thành lập ngày 08/08/1967 với các thành viên đầu tiên là Thái Lan, Indonesia, Malaysia, Singapore, và Philippines')

INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'KHXH48', N'KHXH', N'TL', 
N'Khối mậu dịch tự do ASEAN được viết tắt là gì?
', NULL, NULL, NULL, NULL, 
N'AFTA', NULL, N'ASEAN Free Trade Area')

INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'KHXH49', N'KHXH', N'TL', 
N'Tên con sông dài nhất thế giới? (Ghi tên)
', NULL, NULL, NULL, NULL, 
N'Nile', NULL, N'Với chiều dài tương đối lên đến 6.650 km, Nile ở châu Phi giữ danh hiệu là dòng sông có chiều dài lớn nhất hành tinh.')

INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'KHXH50', N'KHXH', N'TL', 
N'Biên giới Việt Nam giáp với bao nhiêu quốc gia? (Ghi số lượng)
', NULL, NULL, NULL, NULL, 
N'3', NULL, N'Lào, Campuchia, Trung Quốc')

INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'VH14', N'VH', N'TN', 
N'Trong truyện "Hoàng tử bé", con vật mà hoàng tử bé đã nhờ người phi công vẽ là gì?
', N'Con thỏ
', N'Con cáo
', N'Con cừu
', N'Con sóc
', NULL,
'C', NULL)

INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'VH15', N'VH', N'TN', 
N'Trong bài thơ "Tiểu đội xe không kính", nguyên nhân của "xe không kính" là gì?
', N'Do bom giật làm vỡ kính.
', N'Do đất sạt lở làm vỡ kính.
', N'Do cây đổ làm vỡ kính.
', N'Do xe ban đầu vốn không được trang bị kính.
', NULL,
'A', NULL)

INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'VH16', N'VH', N'TL', 
N'Tác phẩm "Tây Du Ký" là của ai?
', NULL, NULL, NULL, NULL, 
N'Ngô Thừa Ân', NULL, NULL)

INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'VH17', N'VH', N'TL', 
N'"Nhất sinh đê thủ bái mai hoa" nói về tác giả nào trong văn học Việt Nam?
', NULL, NULL, NULL, NULL, 
N'Cao Bá Quát', NULL, NULL)

INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'VH18', N'VH', N'TL', 
N'Chi tiết "Trong óc Tràng vẫn thấy đám người đói và lá cờ đỏ bay phấp phới..." trong tác phẩm "Vợ nhặt" của Kim Lân nói đến sự kiện lịch sử nào?
', NULL, NULL, NULL, NULL, 
N'Cách mạng tháng Tám 1945', NULL, NULL)

INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'VH19', N'VH', N'TL', 
N'Câu nói: "Không thể được! Làng thì yêu thật, nhưng làng theo Tây mất rồi thì phải thù!" được trích từ tác phẩm nào của nhà văn Kim Lân?
', NULL, NULL, NULL, NULL, 
N'Làng', NULL, NULL)

INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'VH20', N'VH', N'TL', 
N'Hai câu thơ sau trong bài thơ "Đồng Chí" của Chính Hữu nói về vấn đề gì mà người chiến sĩ phải chịu đựng khi chiến đấu: 
"Anh với tôi biết từng cơn ớn lạnh,
/ Sốt run người, vừng trán ướt mồ hôi."
', NULL, NULL, NULL, NULL, 
N'Sốt rét rừng', NULL, NULL)

INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'VH21', N'VH', N'TN', 
N'Ai là tác giả bài hát "Diệt phát xít", được chọn làm nhạc hiệu Đài Tiếng nói Việt Nam?
', N'Hoàng Trung Thông
', N'Phạm Tiến Duật
', N'Nguyễn Đình Thi
', N'Nguyễn Tuân
', NULL,
'C', NULL)

INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'VH22', N'VH', N'TL', 
N'Ai được mệnh danh là bà chúa thơ Nôm?
', NULL, NULL, NULL, NULL, 
N'Hồ Xuân Hương', NULL, NULL)

INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'VH23', N'VH', N'TN', 
N'Tác phẩm "Lá cờ thêu sáu chữ vàng" lấy bối cảnh vương triều nào trong lịch sử Việt Nam?
', N'Nhà Lý
', N'Nhà Trần
', N'Nhà Đinh
', N'Nhà Lê
', NULL,
'B', N'Lá cờ thêu sáu chữ vàng là tác phẩm dành cho thiếu nhi, xuất bản lần đầu tiên năm 1960. Truyện kể về người anh hùng 16 tuổi Hoài Văn Hầu Trần Quốc Toản, gặp buổi rợ Mông Nguyên sang cướp nước Nam, đã chiêu mộ sáu trăm người, kết làm anh em, đánh giặc.')

INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'VH24', N'VH', N'TN', 
N'Ai là tác giả tiểu thuyết "Đất rừng phương Nam", được chuyển thể thành phim "Đất phương Nam"?
', N'Anh Đức
', N'Sơn Nam
', N'Đoàn Giỏi
', N'Nam Cao
', NULL,
'C', N'"Đất rừng phương Nam" là tiểu thuyết của nhà văn Đoàn Giỏi, viết về cuộc đời phiêu bạt của cậu bé Nguyễn An. Bối cảnh của tiểu thuyết là miền Tây Nam Bộ năm 1945, sau khi Pháp quay trở lại xâm chiếm Nam Bộ.')

INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'VH25', N'VH', N'TN', 
N'Tập thơ nào được Tố Hữu sáng tác khoảng 10 năm với ba phần Máu lửa, Xiềng xích và Giải phóng?
', N'Từ ấy
', N'Ra trận
', N'Máu và hoa
', N'Việt Bắc
', NULL,
'A', N'"Từ ấy" gồm 71 bài thơ, với ba phần: Máu lửa (27 bài), Xiềng xích (30 bài) và Giải phóng (14 bài). Tương ứng với các phần là ba giai đoạn lịch sử của cách mạng Việt Nam, thông qua chặng đường hoạt động 10 năm của Tố Hữu.')

INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'DS11', N'DS', N'TN', 
N'Giải thưởng Nobel không bao gồm lĩnh vực nào?
', N'Văn học
', N'Y học
', N'Kinh tế
', N'Toán học
', NULL,
'D', NULL)

INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'DS12', N'DS', N'TN', 
N'Đâu không phải là một sáng tác của Đen Vâu?
', N'Lối nhỏ
', N'Mơ
', N'3 triệu năm
', N'Ta cứ đi cùng nhau
', NULL,
'C', N'"Lối nhỏ" (2019) ft Phương Anh Đào, "Mơ" (2016) ft Hậu Vi, "Ta cứ đi cùng nhau" (2017) ft Linh Cáo. Tên bài hát chính xác còn lại là "Hai triệu năm" (2019)')

INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'DS14', N'DS', N'TL', 
N'Người Việt Nam đầu tiên bay lên vũ trụ là ai?
', NULL, NULL, NULL, NULL, 
N'Phạm Tuân', NULL, N'Phạm Tuân, cùng với nhà du hành vũ trụ Xô viết Viktor Vassilyevich Gorbatko được phóng vào không gian từ sân bay vũ trụ Baikonur trên tàu Soyuz 37 vào ngày 23 tháng 7 năm 1980, tức ngày 12 tháng 6 âm lịch năm Canh Thân, và trở về Trái Đất ngày 31 tháng 7 trên tàu Soyuz 36. Họ thực hiện nhiệm vụ trên trạm không gian Salyut 6 cùng với hai nhà du hành vũ trụ Xô viết khác.')

INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'DS15', N'DS', N'TL', 
N'Chương trình "Chạy đi chờ chi" là phiên bản Việt hóa của chương trình nào ở Hàn Quốc?
', NULL, NULL, NULL, NULL, 
N'Running Man', NULL, N'"Chạy đi chờ chi", còn được gọi là Running Man Việt Nam, là phiên bản Việt hóa của chương trình truyền hình thực tế nổi tiếng của Hàn Quốc Running Man. Chương trình được thực hiện bởi sự hợp tác của Đài Truyền hình Thành phố Hồ Chí Minh và SBS cùng với Madison Media Group và Lime Entertainment.')

INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'DS16', N'DS', N'TL', 
N'Đại học Quốc gia thành phố Hồ Chí Minh có tổng cộng bao nhiêu thành viên? (Chỉ ghi số lượng)
', NULL, NULL, NULL, NULL, 
N'7', NULL, N'Bao gồm: đại học Bách Khoa, đại học Công nghệ Thông tin, đại học Khoa học Tự nhiên, đại học Kinh tế - Luật, đại học Nhân văn, đại học Quốc tế, và khoa Y.')

INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'DS17', N'DS', N'TL', 
N'Tính đến tháng 6 năm 2020, quốc gia nào đang dẫn đầu về công nghệ máy tính lượng tử?
', NULL, NULL, NULL, NULL, 
N'Mỹ', NULL, N'Mỹ đã chế tạo thành công máy tính lượng tử 54 qubit.')

INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'DS18', N'DS', N'TL', 
N'Nguyễn Hà Đông là cha đẻ của một trò chơi gây sốt năm 2013. Tên của trò chơi ấy là gì?
', NULL, NULL, NULL, NULL, 
N'Flappy Bird', NULL, N'Ban đầu, Flappy Bird được phát hành vào tháng 05/2013 trên nền iOS5, sau đó nâng cấp cho hệ máy iOS6 và mới hơn vào tháng 09/2013. Vào tháng 01/2014, trò chơi bất ngờ trở nên nổi tiếng, là ứng dụng miễn phí được tải về nhiều nhất trên Google Play và và App Sotre. Tuy nhiên, Flappy Bird đã phải nhận nhiều chỉ trích và cáo buộc từ nhiều phía, do vậy vào ngày 10/02/2014, tác giả đã chính thức khai tử trò chơi này.')

INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'DS19', N'DS', N'TL', 
N'Trong giai đoạn đầu chống dịch COVID-19 (23/01 - 13/02/2020), nước ta ghi nhận có bao nhiêu ca nhiễm? (Ghi số lượng)
', NULL, NULL, NULL, NULL, 
N'16', NULL, NULL)

INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'DS20', N'DS', N'TL', 
N'Nhóm nhạc được ra mắt thông qua chương trình sống còn Produce 101 của Hàn Quốc có bao nhiêu thành viên? (Ghi số lượng)
', NULL, NULL, NULL, NULL, 
N'11', NULL, N'Chương trình Produce101 được sản xuất bởi công ty Mnet thuộc tập đoàn CJ Group, trải qua 4 mùa và cho ra mắt thành công 4 nhóm nhạc là I.O.I (2015), Wanna One (2017), IZ*ONE (2018) và X1 (2019) dựa trên danh sách 11 thực tập sinh đứng đầu trong mỗi mùa do fan bình chọn. ')

INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'TA01', N'TA', N'TL', 
N'Who was not a character in the novel "Alice in Wonderland" (1865) by Lewis Carroll?
', N'March Hare Rabbit
', N'Cheshire Cat
', N'Mad Hatter
', N'Red Queen
', NULL, N'D', 
N'The Cheshire Cat is known for its distinctive mischievous grin. His first appearance was in the chapter 6 of the novel to direct Alice to the March Hares house where she joined the Mad Tea Party (chapter 7) with the March Hare Rabbit and Mad Hatter. There was no Red Queen character in the novel, but the Queen of Hearts. The Red Queen was one of the main characters in another novel of Carroll named "Through the Looking-Glass, and What Alice Found There" (1871).')

INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'TA02', N'TA', N'TL', 
N'Fill in the gap: The ------ ----- is a mascot of of The Walt Disney Company.
', NULL, NULL, NULL, NULL, 
N'Mickey Mouse', NULL, N'Mickey Mouse is a cartoon character and the mascot of The Walt Disney Company. He was created by Walt Disney and Ub Iwerks at the Walt Disney Studios in 1928. An anthropomorphic mouse who typically wears red shorts, large yellow shoes, and white gloves, Mickey is one of the world most recognizable characters.')

INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'TA03', N'TA', N'TL', 
N'What is the hottest planet in the Solar system?
', NULL, NULL, NULL, NULL, 
N'Venus', NULL, N'Even though Venus is not the closest planet to the Sun, it is still the hottest. It has a thick atmosphere full of the greenhouse gas carbon dioxide and clouds made of sulfuric acid. The atmosphere traps heat and keeps Venus toasty warm. It is so hot on Venus, metals like lead would be puddles of melted liquid.')

INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'TA04', N'TA', N'TL', 
N'Who is the writer of the song "Heal the world" recorded by Michael Jackson?
', NULL, NULL, NULL, NULL, 
N'Michael Jackson', NULL, N'Heal the World is a song recorded by American recording artist Michael Jackson from his eighth studio album, Dangerous (1991). It was written and composed by Jackson, and produced by Jackson and Bruce Swedien. Jackson said that "Heal the World" is the song he was most proud to have created. He also created the Heal the World Foundation, a charitable organization which was designed to improve the lives of children.')

INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'TA05', N'TA', N'TL', 
N'Who invented the electric light?
', NULL, NULL, NULL, NULL, 
N'Thomas Edison', NULL, N'His full name is Thomas Alva Edison (February 11, 1847 – October 18, 1931), who was an American inventor and businessman who has been described as Americas greatest inventor.')

INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'TN01', N'KHTN', N'TN', N'Tên gọi Triều Tiên có nghĩa gì?
', N'Buổi tối hoàng hôn
', N'Buổi sáng tươi đẹp
', N'Ánh bình minh
', N'Ngày tươi đẹp
', NULL,'B',N'Từ "Triều Tiên" là từ gốc Hán có nghĩa là "(Xứ) Buổi sáng tươi đẹp".')
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'TN02', N'KHTN', N'TN', N'Quảng trường lớn nhất của Triều Tiên nằm ở thủ đô Bình Nhưỡng tên là gì?
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', N'Quảng trường Kim Nhật Thành
', N'Quảng trường Thời đại
', N'Quảng trường Mansudae
', N'Quảng trường Thiên niên kỷ
', NULL,'A',N'Quảng trường Kim Nhật Thành là một quảng trường thành phố Bình Nhưỡng, Cộng hòa Dân chủ Nhân dân Triều Tiên, và được đặt tên theo nhà lãnh đạo sáng lập của Triều Tiên, Kim Nhật Thành. Khai trương vào tháng 8 năm năm 1954, quảng trường này nằm trên bờ phía tây của sông Taedong, trực tiếp đối diện với Tháp Juche ở phía bên kia của con sông.')
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'TN03', N'KHTN', N'TN', N'Hệ thống tàu điện ngầm của Triều Tiên sâu thứ mấy trên thế giới?
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', N'1
', N'2
', N'3
', N'4
', NULL,'A','Thủ đô Bình Nhưỡng của CHDCND Triều Tiên có một hệ thống tàu điện ngầm. Hệ thống được bắt đầu xây dựng từ năm 1966 và hiện nay dài khoảng 24 km với 17 trạm. Với độ sâu tối đa khoảng 200m dưới lòng đất, đây là hệ thống tàu điện ngầm sâu nhất thế giới')
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'TN04', N'KHTN', N'TN', N'Món mì lạnh nổi tiếng của Triều Tiên tên là gì?
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', N'Mì Jajang
', N'Mì Jajangmyeon
', N'Mì Naengmyeon
', N'Mì Samyang
', NULL,'C',N'Món mì lạnh Naengmyeon nổi tiếng của Hàn Quốc là một đặc sản được ưa chuộng trong những ngày hè. Tuy nhiên, món ăn này lại có nguồn gốc từ Pyongyang ở Triều Tiên.')
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'TN05', N'KHTN', N'TN', N'Nơi nào của nước ta có biệt danh “thành phố sông hồ”?
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', N'Hà Nội	
', N'Hải Phòng
', N'Huế
', N'Hội An
', NULL,'A',N'Theo Cổng thông tin thành phố, Hà Nội có biệt danh “thành phố sông hồ” hay “thành phố trong sông”. Các con sông lớn, nhỏ đã chảy hàng nghìn năm, đem phù sa bồi đắp nên vùng châu thổ phì nhiêu cho thủ đô.')
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'TN06', N'KHTN', N'TN', N'Hồ nào ở Hà Nội được tạo nên bởi một đoạn của sông Hồng?
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', N'Hồ Tây
', N'Hồ Bảy Mẫu
', N'Hồ Ba Mẫu
', N'Cả 3 hồ trên
', NULL,'A',N'Theo sách "Hồ Tây chí", Hồ Tây có từ thời Hùng Vương. Các tài liệu khảo cổ học hiện nay đã chứng minh rằng Hồ Tây chính là một đoạn của sông Hồng xưa ngưng đọng lại sau khi sông đổi dòng chảy.')

INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'TN08', N'KHTN', N'TN', N'Đâu là điểm cực bắc trên đất liền của Việt Nam?
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', N'Mũi Lũng Cú
', N'Đỉnh Loan La San
', N'Mũi Đôi
', N'Mũi Cà Mau
', NULL,'A',N'Điểm cực Bắc của Việt Nam nằm ở Đỉnh Lũng Cú thuộc tỉnh Hà Giang.')
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'TN09', N'KHTN', N'TN', N'Năm 2011 WWF đã công bố loại đọng vật quý hiếm nào đã tuyệt chủng ở Việt Nam do săn bắn?
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', N'Tê giác một sừng
', N'Hổ Đông Dương
', N'Sếu đầu đỏ
', N'Vooc đầu trắng
', NULL,'A',N'Đến tháng 10 năm 2011, Quỹ Quốc tế Bảo vệ Thiên nhiên cho biết con tê giác đó là con tê giác cuối cùng tại Việt Nam, và hiện tại loài tê giác Java đã tuyệt chủng tại Việt Nam.')

INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'TN10', N'KHTN', N'TN', N'Loại hạt nào được chiết xuất thành dầu ăn?
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', N'Hạt hoa hướng dương
', N'Hạt sen
', N'Hạt hoa hồng
', N'Hạt hoa giấy
', NULL,'A',NULL)

INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'TN11', N'KHTN', N'TN', N'Loại cây lương thực nào có tên khác là “cao lương”?
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', N'Lúa mỳ
', N'Lúa miến
', N'Lúa nếp
', N'Lúa mạch
', NULL,'A',N'Cây Cao lương, hay còn gọi là Lúa miến, danh pháp khoa học là Sorghum bicolor là một loài thực vật có hoa trong họ Hòa thảo (Poaceae, Gramineae). Loài này được (L.) Moench miêu tả khoa học đầu tiên năm 1794.')

INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'TN12', N'KHTN', N'TN', N'Sếu đầu đỏ giữ kỉ lục gì trong những loài chim biết bay?
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', N'Bay cao nhất	
', N'Đứng cao nhất
', N'Sải cánh dài nhất
', N'Bay nhanh nhất
', NULL,'B',N'Chiều cao của sếu đầu đỏ lên đến 1,8 m.')
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'TN13', N'KHTN', N'TN', N'Loài nào dưới đây thuộc nhóm "Động vật máu nóng"?
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', N'Tắc kè hoa
', N'Ếch
', N'Cá sấu 
', N'Chuột 
', NULL,'D',N'Động vật máu nóng hay còn gọi là động vật hằng nhiệt là tập hợp những loài có nhiệt độ cơ thể ổn định, không bị biến thiên tự do theo nhiệt độ môi trường.')


INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'TN14', N'KHTN', N'TN', N'Loài nào dưới đây không phải là "Loài bản địa" của Việt Nam?
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', N'Ốc bươu vàng
', N'Cây cao su
', N'Cá rô phi
', N'Tất cả các đáp án trên đều đúng
', NULL,'D',NULL)
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'TN15', N'KHTN', N'TN', N'Loài cây nào dưới đây là thực vật Hạt trần?
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', N'Cây điều
', N'Cây hạnh nhân
', N'Cây óc chó
', N'Cây vạn tuế
', NULL,'D',NULL)


INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'TN16', N'KHTN', N'TN', N'Màu đỏ trên chiếc khăn mà đấu sĩ bò tót sử dụng sẽ khiến con vật thêm phần hung hăng và tức giận hơn?
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', N'Đúng 
', N'Sai 
', NULL
, NULL
, NULL,'B',NULL)
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'TN17', N'KHTN', N'TN', N'Loại củ nào thường được dùng làm thức ăn dưới đây thực chất là phần rễ của cây?
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', N'Củ khoai tây
', N'Củ hành tây
', N'Củ năng (củ mã thầy)
', N'Củ cà rốt
', NULL,'D',NULL)

INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'TN18', N'KHTN', N'TN', N'Các chuyển động để sinh ra các mùa trên trái đất là
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', N'Trái đất vừa tự quay quanh mình vừa chuyển động quanh mặt trời trục trái đất nghiêng.
', N'Trái đất tự quay quanh mình theo hướng từ tây sang đông trục trái đất nghiêng.
', N'Trái đất chuyển động quanh mặt trời trục trái đất nghiêng và không đối phương trong quá trình chuyển động.
', N'Trái đất chuyển động quanh mặt trời theo hướng ngược chiều kim đồng hồ trục trái đất nghiêng.
', NULL,'C',NULL)
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'TN19', N'KHTN', N'TN', N'Trong năm , bán cầu Nam ngả nhiều nhất về phía mặt trời vào ngày nào?
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', N'21 – 3.  
', N'22 – 6.  
', N'23 – 9.
', N'22 – 12.
', NULL,'D',NULL)
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'TN20', N'KHTN', N'TN', N'Ở bán cầu Nam , hiện tượng ngày dài hơn đêm diễn ra trong khoảng thời gian nào?
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', N'Từ 21 – 3 đến 23 – 9.
', N'Từ 22 – 6 đến 22 – 12.
', N'Từ 23 – 9 đến 21 – 3.
', N'Từ 22 – 12 đến 22 – 6.
', NULL,'C',NULL)
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'TN21', N'KHTN', N'TN', N'Nhận định nào dưới đây chưa chính xác về hệ Mặt Trời:
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', N'Mặt Trời là thiên thể duy nhất có khả năng tự phát sáng.
', N'Mọi hành tinh đều có khả năng phản chiếu ánh sáng Mặt Trời.
', N'Mọi hành tinh và vệ tinh đều có khả năng tự phát sáng.
', N'Trong hệ Mặt Trời tất cả các hành tinh đều chuyển động tự quay
', NULL,'C',NULL)
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'TN22', N'KHTN', N'TN', N'Quĩ đạo của các hành tinh chuyển động xung quanh Mặt Trời có dạng:
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', N'Tròn.
', N'Ê líp.
', N'Không xác định.
', N'Tất cả đều đúng.
', NULL,'B',NULL)
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'TN23', N'KHTN', N'TN', N'Hướng chuyển động của các hành tinh trên quĩ đạo quanh Mặt Trời là:
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', N'Thuận chiều kim đồng hồ, trừ Kim Tinh.
', N'Ngược chiều kim đồng hồ với tất cả các hành tinh
', N'Ngược chiều kim đồng hồ, trừ Kim Tinh
', N'Thuận chiều kim đồng hồ
', NULL,'B',NULL)
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'TN24', N'KHTN', N'TN', N'Ở bán cầu Bắc , ngày nào có sự chênh lệch thời gian ban ngày và thời gian ban đêm lớn nhất trong năm ?
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', N'Ngày 21 – 3.
', N'Ngày 22 – 6.
', N'Ngày 23 – 9.
', N'Ngày 22 – 12.
', NULL,'B',NULL)
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'TN25', N'KHTN', N'TN', N'Nếu xếp theo thứ tự khoảng cách xa dần Mặt Trời ta sẽ có:
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', N'Kim Tinh, Trái Đất, Thuỷ Tinh, Hoả Tinh.
', N'Kim Tinh, Thuỷ Tinh, Hoả Tinh, Trái Đất.
', N'Thuỷ Tinh, Kim Tinh, Trái Đất, Hoả Tinh.
', N'Kim Tinh, Thuỷ Tinh, Trái Đất, Hoả Tinh.
', NULL,'C',NULL)
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'TN26', N'KHTN', N'TN', N'Hành tinh duy nhất trong hệ Mặt Trời có thời gian tự quay quanh trục lớn hơn Mặt Trời là:
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', N'Thuỷ Tinh.
', N'Kim Tinh.
', N'Hoả Tinh.
', N'Mộc Tinh.
', NULL,'B',NULL)
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'TN27', N'KHTN', N'TN', N'Mùa nào trong năm có ngày ngắn hơn đêm và xu hướng ngày càng dài ra , đem càng ngắn lại?
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', N'Mùa hạ.
', N'Mùa đông.
', N'Mùa xuân.
', N'Mùa thu.
', NULL,'B',NULL)
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'TN27', N'KHTN', N'TN', N'Thành phần cấu tạo của mỗi thiên hà bao gồm:
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', N'Các thiên thể, khí, bụi.
', N'Các thiên thể, khí, bụi và bức xạ điện từ.
', N'Các ngôi sao, hành tinh, vệ tinh, sao chổi.
', N'Các hành tinh và các vệ tinh của nó.
', NULL,'B',NULL)
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'TN28', N'KHTN', N'TN', N'Nơi nào trên trái đất quanh năm có ngày và đêm dài như nhau ?
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', N'Ở 2 cực.
', N'Các địa điểm nằm trên 2 vòng cực.
', N'Các địa điểm nằm trên 2 chí tuyến.
', N'Các địa điểm nằm trên xích đạo.
', NULL,'D',NULL)
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'TN29', N'KHTN', N'TN', N'Theo dương lịch , các ngày xuân phân , hạ chí , thu phân , đông chí ở bán cầu Bắc lần lượt là?
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', N'22 – 12; 23 – 9 ; 22 – 6 ; 21 – 3.
', N'21 – 3 ; 22 – 6 ; 23 – 9 ; 22 – 12.
', N'22 – 6 ; 23 – 9 ; 22 – 12 ; 21 – 3.
', N'23 – 9 ; 22 – 12 ; 21 – 3 ;22 – 6. 
', NULL,'B',NULL)
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'TN30', N'KHTN', N'TN', N'Nguyên tử nguyên thuỷ theo thuyết Big Bang có đặc điểm là:
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', N'Chứa vật chất bị nén ép trong 1 không gian vô cùng nhỏ bé nhưng rát đậm đặc và có nhiệt độ vô cùng cao.
', N'Các vật chất chuyển động tự do về mọi hướng 1 cách dễ dàng.
', N'Có nhiệt độ rất cao.
', N'Chứ vô vàn các phân tử khí đậm đặc.
', NULL,'B',NULL)
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'TN31', N'KHTN', N'TN', N'Theo thuyết Big Bang, các ngôi sao và các Thiên Hà trong vũ trụ được hình thành chủ yếu do tác động của lực:
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', N'Hấp dẫn
', N'Ma sát
', N'Lực đẩy Accimet
', N'Li tâm
', NULL,'A',NULL)
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'TN32', N'KHTN', N'TN', N'Loại phân bón nào có hàm lượng đạm lớn nhất?
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', N'1
', N'2
', N'3
', N'4
', NULL,'',NULL)
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'TN33', N'KHTN', N'TN', N'Cơ chế điều hòa hoạt động của gen được Mono va Jacop,hai nhà khoa học người Pháp phát hiện ở vi khuẩn Ecoli vào năm nào?
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', N'1959
', N'1960
', N'1961
', N'1962
', NULL,'C',NULL)
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'TN34', N'KHTN', N'TN', N'Nhà toán học này giấu nến trong giày để có thể học toán vào ban đêm?
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', N'Sonya Kovalevsky
', N'Euclid
', N'Issac Newton
', N'Sophie Germain
', NULL,'D',NULL)
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'TN35', N'KHTN', N'TN', N'Ngôi trường của nhà toán học Hy Lạp nào từng bị thiêu rụi?
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', N'Galileo
', N'Pythagoras
', N'Archimedes
', N'Euclid
', NULL,'B',NULL)
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'TN36', N'KHTN', N'TN', N'Nhà toán học Hy Lạp nào nổi tiếng với tiếng kêu "Eureka!" từ bồn tắm?                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', N'Galileo
', N'Pythagoras
', N'Archimedes
', N'Euclid
', NULL,'C',NULL)
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'TN37', N'KHTN', N'TN', N'Ông được biết đến là "cha đẻ của hình học".
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', N'Issac Newton
', N'Galileo
', N'Pythagoras
', N'Euclid
', NULL,'D',NULL)
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'TN38', N'KHTN', N'TN', N'Đây là người đã thả những trái bóng có trọng lượng khác nhau từ tháp nghiêng Pisa để chứng minh chúng chạm đất cùng lúc.
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', N'Issac Newton
', N'Galileo
', N'Pythagoras
', N'Euclid
', NULL,'B',NULL)
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'TN39', N'KHTN', N'TN', N'Hệ điều hành phiên bản Android 5.0 Lollipop được Google ra mắt vào thời điểm nào?
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', N'Tháng 6 năm 2014
', N'Tháng 6 năm 2015
', N'Tháng 9 năm 2014
', N'Tháng 10 năm 2014
', NULL,'A',NULL)
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'TN40', N'KHTN', N'TN', N'Ai đang là CEO hiện tại của trang mạng xã hội Twitter?
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', N'Tim Cook
', N'Evan Spiegel
', N'Kevin Systrom
', N'Jack Dorsey
', NULL,'D',NULL)
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'TN41', N'KHTN', N'TN', N'BKAV được cho là đã đầu tư bao nhiêu tiền để xây dựng và phát triển Bphone, dòng điện thoại thông minh cao cấp đầu tiên do một công ty Việt Nam sản xuất?
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', N'15 triệu USD
', N'20 triệu USD
', N'25 triệu USD
', N'35 triệu USD
', NULL,'B',NULL)
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'TN42', N'KHTN', N'TN', N'Đâu là ứng dụng di động đã bị phản đối ở nhiều quốc gia vì được coi là cạnh tranh không lành mạnh với các doanh nghiệp truyền thống và không tuân thủ đầy đủ luật pháp, bao gồm cả ở Việt Nam?
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', N'Nimbuzz
', N'Wechat 
', N'Uber	
', N'Viber
', NULL,'C',NULL)
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'TN43', N'KHTN', N'TN', N'Viral video nghĩa là gì?
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', N'Nó lây nhiễm phần mềm độc hại sang các hệ thống
', N'Nó phát quảng cáo trước hoặc trong video
', N'Nó nhận được số lượng lớn lượt xem trong một khoảng thời gian ngắn
', N'Nó phát một lần, sau đó sẽ tự động bị xóa
', NULL,'C',NULL)

INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'TN45', N'KHTN', N'TN', N'Tên gọi khác của một boot disk là gì?
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', N'Backup disk (ổ sao lưu)
', N'Startup disk (ổ khởi động)
', N'Read-only disk (ổ chỉ đọc)
', N'Read-only disk (ổ chỉ đọc)
', NULL,'B',NULL)
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'TN46', N'KHTN', N'TN', N'HTML và CSS là ngôn ngữ chủ yếu liên quan đến ngành nào?
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', N'Thiết kế đồ họa
', N'Sản xuất video
', N'Phát triển web
', N'Kỹ thuật phần mềm (Software engineering)
', NULL,'C',NULL)
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'TN47', N'KHTN', N'TN', N'Một vectơ bao gồm hướng và thuộc tính nào?
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', N'Chiều rộng
', N'Chiều cao
', N'Độ lớn
', N'Thời gian
', NULL,'C',NULL)
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'TN48', N'KHTN', N'TN', N'Thành phần nào sau đây có thể có kiến trúc CISC?
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', N'Bộ xử lý
', N'Card video
', N'Mô-đun bộ nhớ
', N'Ổ cứng
', NULL,'A',NULL)
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'TN49', N'KHTN', N'TN', N'Hệ thống tàu điện ngầm của Triều Tiên sâu thứ mấy trên thế giới?
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', N'iWork
', N'Lotus
', N'Office
', N'Docs
', NULL,'C',NULL)
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'TN50', N'KHTN', N'TN', N'El Capitan và Yosemite là phiên bản của hệ điều hành nào?
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', N'macOS
', N'iOS
', N'Windows
', N'Android
', NULL,'A',NULL)
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'TN51', N'KHTN', N'TN', N'Một chương trình Unix liên tục chạy còn được gọi là gì?
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', N'Utility (tiện ích)
', N'Daemon
', N'Upload
', N'Stream
', NULL,'B',NULL)
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'TN52', N'KHTN', N'TN', N'Phạm vi giao tiếp điển hình của thiết bị NFC là gì?	
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', N'10cm
', N'10m
', N'100m
', N'1km
', NULL,'A',NULL)
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'TN53', N'KHTN', N'TN', N'Inkjet và laser là 2 loại của thiết bị gì?
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', N'Máy scan
', N'Máy in
', N'Màn hình
', N'Camera kỹ thuật số
', NULL,'B',NULL)
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'TN54', N'KHTN', N'TN', N'IPv6 sử dụng định dạng địa chỉ IP nào?
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', N'###.###.###.###
', N'###.###.###.###.###
', N'##:##:##:##:##:##:##
', N'####:####:####:####:####:####:####
', NULL,'D',NULL)
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'TN55', N'KHTN', N'TN', N'Đáp án nào sau đây không phải là một giao thức?
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', N'ARP
', N'PPP
', N'RIP
', N'ZIP
', NULL,'D',NULL)
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'TN56', N'KHTN', N'TN', N'Ngôn ngữ nào được thiết kế để cho phép xử lý song song?
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', N'PHP
', N'Swift
', N'OpenCL
', N'JavaScript
', NULL,'C',NULL)
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'TN57', N'KHTN', N'TN', N'Cấu trúc dữ liệu nào sau đây có root node ở trên cùng?
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', N'Array (mảng)
', N'Stack (ngăn xếp)
', N'Heap
', N'Set (tập hợp)
', NULL,'C',NULL)
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'TN58', N'KHTN', N'TN', N'Trash trong macOS tương đương với gì trong Windows?
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', N'Archiver
', N'Compressor
', N'Recycle Bin
', N'Dropbox
', NULL,'C',NULL)
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'TN59', N'KHTN', N'TN', N'Điều nào sau đây không được lưu trữ dưới dạng một file?
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', N'Kho lưu trữ
', N'Tài liệu
', N'Video
', N'Thư mục
', NULL,'D',NULL)
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'TN60', N'KHTN', N'TN', N'Phát biểu nào sau đây về cơ sở dữ liệu quan hệ là sai?
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', N'Chúng chỉ có thể lưu trữ dữ liệu văn bản
', N'Chúng chứa hàng
', N'Chúng chứa cột	
', N'Chúng có thể được truy vấn bằng SQL
', NULL,'A',NULL)
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'TN61', N'KHTN', N'TN', N'Video blog còn được gọi là gì?
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', N'Vlog
', N'Vblog
', N'Vidlog
', N'Vidblog
', NULL,'D',NULL)
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'TN62', N'KHTN', N'TN', N'Một người build máy tính tùy chỉnh rất có thể sẽ mua loại hệ thống nào?
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', N'Mainframe
', N'Barebone
', N'Tất cả trong một
', N'Laptop
', NULL,'B',NULL)
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'TN63', N'KHTN', N'TN', N'Mục đích của cache là gì?
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', N'Chống phân mảnh các file được lưu trữ trong bộ nhớ
', N'Giải phóng bộ nhớ hệ thống không sử dụng
', N'Lưu trữ thông tin được sử dụng gần đây để truy cập nhanh hơn
', N'Nắm bắt những exception (ngoại lệ) từ các ứng dụng đang chạy
', NULL,'C',NULL)
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'TN64', N'KHTN', N'TN', N'Có bao nhiêu phím Shift trên bàn phím tiêu chuẩn?
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', N'1
', N'2
', N'3
', N'4
', NULL,'B',NULL)
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'TN65', N'KHTN', N'TN', N'Machine learning là một tập hợp con của công nghệ gì?
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', N'Trí tuệ nhân tạo
', N'Ảo hóa
', N'Giả lập
', N'Điện toán đám mây
', NULL,'A',NULL)
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'TN66', N'KHTN', N'TN', N'Nguồn năng lượng trực tiếp cùa tế bào là:
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', N' Glucose
', N'Galactose
', N'Ribose
', N'Fructose
', NULL,'A',NULL)
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'TN67', N'KHTN', N'TN', N'Nguyên sinh chất có tính chất, ngoại trừ:
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', N'là một hệ keo
', N'độ nhớt cao
', N'chuyển đổi sol-gel
', N'nhũ tương không bền
', NULL,'D',NULL)
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'TN68', N'KHTN', N'TN', N'. Nước đóng vai trò tham gia cấu trúc mô là
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', N'nước liên kết chiếm tỉ lệ 5%
', N'nước tự do chiếm tỉ lệ 5%
', N'nước liên kết chiếm tỉ lệ 95%
', N'nước tự do chiếm tỉ lệ 5%
', NULL,'A',NULL)
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'TN69', N'KHTN', N'TN', N'Đường đặc trưng của sữa bò là
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', N'Glucose
', N'Galactose
', N'Lactose
', N'Fructose
', NULL,'C',NULL)
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'TN70', N'KHTN', N'TN', N'Băng khô được sử dụng để dập tắt các đám cháy thông thường có công thức hóa học là gì?
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', N'H2O
', N'CO2
', N'SO2
', N'NO2
', NULL,'B',N'Cacbon điôxít hay điôxít cacbon (các tên gọi khác thán khí, anhiđrít cacbonic, khí cacbonic) là một hợp chất ở điều kiện bình thường có dạng khí trong khí quyển Trái Đất, bao gồm một nguyên tử cacbon và hai nguyên tử ôxy. Là một hợp chất hóa học được biết đến rộng rãi, nó thường xuyên được gọi theo công thức hóa học là CO2. Trong dạng rắn, nó được gọi là băng khô.')
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'TN71', N'KHTN', N'TN', N'Biểu tượng chung của Đại hôi thể thao châu Á là gì?
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', N'Bàn tay
', N'Mặt trời
', N'Trái đất
', N'Đại dương
', NULL,'B',NULL)
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'TN72', N'KHTN', N'TN', N'Năm 1840, chiếc tem đầu tiên trên thế giới ra đời tại Anh có in hình một người đó là ai?
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', N'Nữ hoàng Victoria
', N'Nữ hoàng Elizabeth I
', N'Thủ tướng Margaret Thatcher
', N'Công nương Diana
', NULL,'A',N'Chiếc tem trị đầu tiên mang giá 1 penny mang chân dung nữ hoàng Victoria I trên nền đen.')
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'TN74', N'KHTN', N'TN', N'Mặt sau của chiếc cúp C1 châu Âu dành để trao đội bóng vô địch khắc nội dung gì?
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', N'Lời ca khúc chính thức
', N'Nơi tổ chức trận chung kết
', N'Tên cầu thủ ghi bàn quyết đinh
', N'Tên đội bóng vô địch
', NULL,'D',N'Đội vô địch sẽ được khắc tên lên thân Cup. Nếu 3 lần liên tiếp đoạt chức vô địch, hoặc 5 lần khác nhau, đội có quyền sở hữu vĩnh viễn chiếc Cup và lúc này UEFA phải làm một chiếc Cup khác.')
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'TN75', N'KHTN', N'TN', N'Nhóm nguyên tố hóa học nào có tên Latin nghĩ là “Sinh ra muối”?
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', N'Oxygen
', N'Hydrogen
', N'Nitrogen
', N'Halogen
', NULL,'D',N'Nhóm halogen, Các nguyên tố halogen (tiếng Latinh nghĩa là sinh ra muối) là những nguyên tố thuộc nhóm VII A (tức nhóm nguyên tố thứ 7 theo danh pháp IUPAC hiện đại) trong bảng hệ thống tuần hoàn các nguyên tố hóa học. ')
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'TN77', N'KHTN', N'TN', N' Đâu không phải là một ngôn ngữ lập trình?
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', N'C++
', N'JavaScript
', N'Pascal
', N'Hyperlink
', NULL,'D',N'Hyperlink là một siêu liên kết, là nguồn dẫn tài liệu để khi người dùng click vào nó sẽ được dẫn đến một trang khác hoặc một vị trí nào đó trên trang web.')
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'TN78', N'KHTN', N'TN', N'Cuộc gọi được thực hiện đầu tiên trên thế giới là giữa nhà phát minh Alexander Graham Bell và...?
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', N'Vợ của ông
', N'Thị trưởng thành phố
', N'Cục đăng ký phát minh
', N'Người trợ lý
', NULL,'D',N'Cuộc gọi điện thoại đầu tiên được thực hiện vào ngày 10 tháng 3 năm 1876 bởi Alexander Graham Bell. Bell đã thể hiện khả năng "nói chuyện với điện" của mình bằng cách gửi một cuộc gọi đến trợ lý của mình, Thomas Watson. Những từ đầu tiên được truyền đi là "Mr Watson, đến đây đi. Tôi muốn gặp anh."')
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'TN79', N'KHTN', N'TN', N'Đơn vị nào dưới đây không được dùng để đo thể tích?
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', N'Lít
', N'Gallon (gal)
', N'Ounce(oz)
', N'Yard
', NULL,'D',N'Yard là tên của một đơn vị chiều dài trong một số hệ đo lường khác nhau
')
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'TN80', N'KHTN', N'TN', N'Hubble là kính viễn vọng không gian đầu tiên trên thế giới?
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', N'Đúng
', N'Sai
', NULL
, NULL
, NULL,'B',N'Hubble không phải là kính viễn vọng không gian đầu tiên trên thế giới nhưng nó là kính viễn vọng lớn và mạnh nhất từng được phóng cho tới hiện tại.')
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'TN81', N'KHTN', N'TN', N' "Năm ánh sáng" là đơn vị dùng để đo đại lượng nào trong vũ trụ?
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', N'Thời gian
', N'Vận tốc
',N'Khoảng cách
', N'Thể tích
', NULL,'C',N'Năm ánh sáng là đơn vị đo chiều dài sử dụng trong đo khoảng cách thiên văn. Nó bằng khoảng 9,5 nghìn tỷ km hoặc 5,9 nghìn tỷ dặm.  Theo định nghĩa của Hiệp hội Thiên văn Quốc tế (IAU), một năm ánh sáng là khoảng cách ánh sáng truyền trong chân không trong khoảng thời gian một năm Julius.')
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'TN82', N'KHTN', N'TN', N' Phát minh nào dưới đây ra đời sớm nhất?
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', N'Kính thiên văn
', N'Máy điện báo
', N'Điện thoại
', N'Internet
', NULL,'A', N'Vào năm 1608 chiếc kính thiên văn đầu tiên đã được tạo ra. Chỉ là một phát hiện tình cờ khi đặt hai kính đồng trục giúp ông có thể quan sát vật ở xa một cách bình thường . Ông là một thợ kính người Hà Lan là Hans Lippershey.')
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'TN83', N'KHTN', N'TN', N'Mạng toàn cầu (World Wide Web) được ra đời ở đâu?
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', N'Mỹ
', N'Thụy Sĩ
', N'Anh
', N'Pháp
', NULL,'B',N'World Wide Web được viện sĩ Viện Hàn lâm Anh Tim Berners-Lee, một chuyên gia tại CERN, Geneva, Thụy Sĩ phát minh ngày 12/3/1989.')
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'TN76', N'KHTN', N'TN', N'Các nhà khoa học thường định tuổi hóa thạch dựa vào chất phóng xạ có trên mẫu vật?
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', N'Đúng
', N'Sai 
', NULL
, NULL
, NULL,'A',NULL)
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'TN73', N'KHTN', N'TN', N'Nhà khoa học nào dưới đây là người tìm ra vắc-xin chữa bệnh Dại?
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', N'Hippocrates
', N'Louis Pasteur
', N'Albert Einstein
', N'Edward Jenner
', NULL,'B',NULL)
INSERT INTO [dbo].[BOCAUHOI] ([MACAUHOI], [CHUDE], [LOAICAUHOI], [CAUHOI], [A], [B], [C], [D], [DATL], [DAPAN], [GHICHU]) VALUES (N'TN44', N'KHTN', N'TN', N'Theo các nhà thiên văn học, thành phần chủ yếu cấu tạo nên sao chổi là gì?
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', N'Kim loại
', N'Đất đá
', N'Dung nham nóng chảy
', N'Băng
', NULL,'D',NULL)