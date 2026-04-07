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