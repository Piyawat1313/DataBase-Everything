insert into student(student_name)
values('สมชาย'),('สมหญิง'),('วิชัย');

insert into books(title, category)
value('Python 101','IT'),('Data Science', 'IT'),('Thai History','History');


insert into borrowings(student_id, book_id, borrow_date)
values(1,1,'2026-03-01'),(2,2,'2026-03-05'),(2,3,'2026-03-10');

select * from student;

select * from books;

select * from borrowings;

-- จงแสดงรายชื่อ "นักศึกษา" และ "วันที่ยืมหนังสือ" จากตาราง students และ borrowings
select student.student_name, borrowings.borrow_date
from student
inner join borrowings 
on student.student_id = borrowings.student_id;



-- ใคร ยืม หนังสืออะไรไปบ้าง?" ให้แสดงชื่อนักศึกษา (student_name), ชื่อหนังสือ (title), และวันที่ยืม (borrow_date)
select student.student_name, books.title, borrowings.borrow_date
from student
join borrowings 
on student.student_id = borrowings.student_id
join books
on borrowings.book_id = books.book_id;


-- รายชื่อนักศึกษาคนไหนบ้างที่ "ไม่เคยยืมหนังสือเลย"?
select student.student_name, books.book_id
from student
left join borrowings
on student.student_id = borrowings.student_id
left join books
on books.book_id = borrowings.book_id;



-- นักศึกษาแต่ละคน ยืมหนังสือไปแล้วคนละกี่เล่ม? (แสดงชื่อนักศึกษา และ จำนวนเล่ม)
select student.student_name, count(books.book_id)
from student
join borrowings
on student.student_id = borrowings.student_id
join books 
on books.book_id = borrowings.book_id
group by student.student_name;



-- จงแสดงชื่อนักศึกษา (student_name) และชื่อหนังสือ (title) เฉพาะเล่มที่อยู่ในหมวด 'IT'
select student.student_name, books.title
from student 
join borrowings
on borrowings.student_id = student.student_id
join books
on borrowings.book_id = books.book_id
where books.category = 'IT';


-- จงแสดงรายชื่อหนังสือ (title) ทั้งหมดที่ ไม่ปรากฏ ในตารางการยืม (borrowings)
select books.title, borrow_date
from books
left join borrowings
on books.book_id = borrowings.book_id
where borrowings.borrow_id is null;



-- จงหาชื่อนักศึกษาที่ยืมหนังสือ มากกว่า 1 เล่ม (แสดงชื่อและจำนวนเล่มที่ยืม)
select student_name, count(books.book_id)
from student as s
join borrowings as b
on s.student_id = b.student_id
join books
on books.book_id = b.book_id
group by s.student_name
having count(books.book_id) > 1;






