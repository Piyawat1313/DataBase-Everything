-- เพิ่มสมาชิก (นักศึกษา/อาจารย์)
INSERT INTO libraryreservationdb.members (FirstName, LastName, Phone) VALUES 
('Piyawat', 'S.', '0812345678'),
('Somchai', 'Jaidee', '0898765432'),
('Somsak', 'Workhard', '0855554444');

INSERT INTO libraryreservationdb.Staffs (FirstName, LastName, Position) VALUES 
('Anucha', 'Manager', 'Senior Librarian'),
('Wipa', 'Support', 'Librarian');


-- เพิ่มประเภทห้อง
INSERT INTO libraryreservationdb.RoomTypes (TypeName, Capacity) VALUES 
('Small Study Room', 4),
('Medium Group Room', 8),
('Large Seminar Room', 20);

-- เพิ่มห้อง (เชื่อมโยงกับ TypeID)
INSERT INTO libraryreservationdb.Rooms (RoomNumber, TypeID) VALUES 
('A101', 1),
('A102', 1),
('B201', 2),
('C301', 3);


INSERT INTO libraryreservationdb.ReservationStatus (StatusName) VALUES 
('Pending'),
('Confirmed'),
('Canceled'),
('Completed');


INSERT INTO libraryreservationdb.Reservations (MemberID, RoomID, StaffID, StatusID, ReserveDate, StartTime, EndTime) VALUES 
(1, 1, 1, 2, '2026-04-10', '09:00:00', '11:00:00'), -- Piyawat จองห้อง A101 (ยืนยันแล้ว)
(2, 3, 2, 1, '2026-04-10', '13:00:00', '15:00:00'), -- Somchai จองห้อง B201 (รออนุมัติ)
(3, 4, 1, 3, '2026-04-11', '10:00:00', '12:00:00'); -- Somsak จองห้อง C301 (ยกเลิกแล้ว)
INSERT INTO libraryreservationdb.Reservations (MemberID, RoomID, StaffID, StatusID, ReserveDate, StartTime, EndTime) VALUES 
(1, 2, 1, 2, '2023-10-15', '10:00:00', '12:00:00'), -- Piyawat จองเพิ่มครั้งที่ 2
(1, 1, 1, 4, '2023-10-15', '09:00:00', '11:00:00'); -- Piyawat จองเพิ่มครั้งที่ 3


select * from libraryreservationdb.members;

select * from libraryreservationdb.reservations;

select * from libraryreservationdb.reservationstatus;

select * from libraryreservationdb.rooms;

select * from libraryreservationdb.roomtypes;

select * from libraryreservationdb.staffs;

SELECT * FROM libraryreservationdb.reservations WHERE MemberID = 1;

SELECT * FROM libraryreservationdb.members ORDER BY FirstName ASC;

SELECT r.ReservationID, m.FirstName, rm.RoomNumber, r.ReserveDate 
FROM Reservations r
JOIN Members m ON r.MemberID = m.MemberID
JOIN Rooms rm ON r.RoomID = rm.RoomID;

SELECT COUNT(*) AS TotalReservations FROM Reservations;


SELECT s.StatusName, COUNT(r.ReservationID) AS Total
FROM Reservations r
JOIN ReservationStatus s ON r.StatusID = s.StatusID
GROUP BY s.StatusName;


SELECT MemberID, COUNT(ReservationID) AS ReserveCount
FROM Reservations
GROUP BY MemberID
HAVING COUNT(ReservationID) > 2;


SELECT m.FirstName, rm.RoomNumber, r.StartTime, r.EndTime, s.StatusName
FROM Reservations r
JOIN Members m ON r.MemberID = m.MemberID
JOIN Rooms rm ON r.RoomID = rm.RoomID
JOIN ReservationStatus s ON r.StatusID = s.StatusID
WHERE r.ReserveDate = '2023-10-15';


SELECT AVG(rt.Capacity) AS AverageCapacityBooked
FROM Reservations r
JOIN Rooms rm ON r.RoomID = rm.RoomID
JOIN RoomTypes rt ON rm.TypeID = rt.TypeID;