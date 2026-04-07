-- 1. เติมสมาชิก (ล็อค ID 1-10)
INSERT INTO libraryreservationdb.members (MemberID, FirstName, LastName, Phone) VALUES 
(1, 'Piyawat', 'S.', '0812345678'), (2, 'Somchai', 'Jaidee', '0898765432'), (3, 'Somsak', 'Workhard', '0855554444'),
(4, 'Wichai', 'Learning', '0822223333'), (5, 'Ananya', 'Study', '0911112222'), (6, 'Nattapon', 'Code', '0933334444'),
(7, 'Thana', 'Read', '0944445555'), (8, 'Kamon', 'Silence', '0955556666'), (9, 'Jirayu', 'Smart', '0966667777'), (10, 'Preecha', 'Group', '0977778888');

-- 2. เติมเจ้าหน้าที่ (ล็อค ID 1-5)
INSERT INTO libraryreservationdb.staffs (StaffID, FirstName, LastName, Position) VALUES 
(1, 'Anucha', 'Manager', 'Senior Librarian'), (2, 'Wipa', 'Support', 'Librarian'), (3, 'Suda', 'Care', 'Librarian'), (4, 'Mana', 'Admin', 'Officer'), (5, 'Chalee', 'Check', 'Librarian Assistant');

-- 3. เติมประเภทห้อง และห้อง (ล็อค ID 1-10)
INSERT INTO libraryreservationdb.roomtypes (TypeID, TypeName, Capacity) VALUES (1, 'Small', 4), (2, 'Medium', 8), (3, 'Large', 20);

INSERT INTO libraryreservationdb.rooms (RoomID, RoomNumber, TypeID) VALUES 
(1,'A101',1), (2,'A102',1), (3,'A103',1), (4,'B201',2), (5,'B202',2), (6,'B203',2), (7,'C301',3), (8,'C302',3), (9,'C303',3), (10,'D401',2);

-- 4. เติมสถานะ (ล็อค ID 1-4)
INSERT INTO libraryreservationdb.reservationstatus (StatusID, StatusName) VALUES (1, 'Pending'), (2, 'Confirmed'), (3, 'Canceled'), (4, 'Completed');



INSERT INTO reservations (MemberID, RoomID, StaffID, StatusID, ReserveDate, StartTime, EndTime) VALUES 
(1, 1, 1, 2, '2023-10-15', '09:00:00', '11:00:00'),
(2, 2, 2, 2, '2023-10-15', '10:00:00', '12:00:00'),
(3, 4, 3, 1, '2023-10-15', '13:00:00', '15:00:00'),
(4, 5, 1, 2, '2023-10-15', '09:00:00', '12:00:00'),
(5, 7, 2, 3, '2023-10-15', '14:00:00', '16:00:00'),
(1, 1, 1, 4, '2023-10-16', '10:00:00', '12:00:00'),
(6, 3, 4, 2, '2023-10-16', '09:00:00', '11:00:00'),
(7, 6, 5, 1, '2023-10-16', '13:00:00', '14:00:00'),
(8, 8, 2, 2, '2023-10-17', '10:00:00', '13:00:00'),
(9, 10, 1, 2, '2023-10-17', '15:00:00', '17:00:00'),
(10, 1, 3, 2, '2023-10-18', '09:00:00', '12:00:00'),
(1, 2, 2, 4, '2023-10-18', '14:00:00', '16:00:00'),
(2, 4, 1, 2, '2023-10-19', '10:00:00', '12:00:00'),
(3, 5, 4, 1, '2023-10-19', '13:00:00', '15:00:00'),
(4, 3, 2, 2, '2023-10-20', '09:00:00', '11:00:00');	

select * from libraryreservationdb.members;

select * from libraryreservationdb.reservations;

select * from libraryreservationdb.reservationstatus;

select * from libraryreservationdb.rooms;

select * from libraryreservationdb.roomtypes;

select * from libraryreservationdb.staffs;

-- ปิดการตรวจสอบ Foreign Key
SET FOREIGN_KEY_CHECKS = 0;

-- ล้างข้อมูลทุกตาราง (ID จะกลับไปเริ่มที่ 1 ใหม่)
TRUNCATE TABLE Reservations;
TRUNCATE TABLE Members;
TRUNCATE TABLE Staffs;
TRUNCATE TABLE Rooms;
TRUNCATE TABLE RoomTypes;
TRUNCATE TABLE ReservationStatus;

-- เปิดการตรวจสอบ Foreign Key กลับมาเหมือนเดิม
SET FOREIGN_KEY_CHECKS = 1;


-- 1. ปิดการตรวจสอบ Foreign Key
SET FOREIGN_KEY_CHECKS = 0;

-- 2. ล้างข้อมูลและรีเซ็ต ID ของทุกตาราง
TRUNCATE TABLE Reservations;
TRUNCATE TABLE Members;
TRUNCATE TABLE Staffs;
TRUNCATE TABLE Rooms;
TRUNCATE TABLE RoomTypes;
TRUNCATE TABLE ReservationStatus;

-- 3. เปิดการตรวจสอบ Foreign Key กลับมา
SET FOREIGN_KEY_CHECKS = 1;

SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE libraryreservationdb.reservations;
TRUNCATE TABLE libraryreservationdb.members;
TRUNCATE TABLE libraryreservationdb.rooms;
TRUNCATE TABLE libraryreservationdb.staffs;
TRUNCATE TABLE libraryreservationdb.roomtypes;
TRUNCATE TABLE libraryreservationdb.reservationstatus;
SET FOREIGN_KEY_CHECKS = 1;









