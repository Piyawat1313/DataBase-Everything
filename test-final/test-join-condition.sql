-- สร้าง Database ใหม่
CREATE DATABASE UniversityDB;
USE UniversityDB;

-- 1. ตารางนักศึกษา
CREATE TABLE student (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    birth_date DATE,
    enrollment_year INT DEFAULT 2026
);

-- 2. ตารางวิชาเรียน
CREATE TABLE course (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(100) NOT NULL,
    credit INT CHECK (credit > 0)
);

-- 3. ตารางการลงทะเบียน (เชื่อมสองตารางบนเข้าด้วยกัน)
CREATE TABLE enrollment (
    enroll_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    course_id INT,
    enroll_date DATE,
    grade CHAR(1),
    FOREIGN KEY (student_id) REFERENCES student(student_id) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES course(course_id) ON DELETE CASCADE
);

-- ใส่ข้อมูลนักศึกษา [cite: 3, 5, 6, 7, 8]
INSERT INTO student (first_name, last_name, email, birth_date) VALUES
('Somchai', 'Jaidee', 'somchai@email.com', '2004-05-10'),
('Suda', 'Meechai', 'suda@email.com', '2003-08-21'),
('Anan', 'Sukjai', 'anan@email.com', '2004-02-11'),
('Malee', 'Dee', 'malee@email.com', '2003-12-01'),
('Piti', 'Ruksak', 'piti@email.com', '2005-01-15');

-- ใส่ข้อมูลวิชาเรียน [cite: 9, 12, 13, 14]
INSERT INTO course (course_name, credit) VALUES
('Database Systems', 3),
('Data Structures', 3),
('Computer Networks', 3),
('Web Development', 3),
('Soft Skills', 1);

-- ใส่ข้อมูลการลงทะเบียน [cite: 15, 17, 18, 19, 20, 21]
INSERT INTO enrollment (student_id, course_id, enroll_date, grade) VALUES
(1, 1, '2026-01-10', 'A'), (1, 2, '2026-01-10', 'B'), (1, 4, '2026-01-15', 'A'),
(2, 1, '2026-01-10', 'B'), (2, 4, '2026-01-15', 'C'),
(3, 2, '2026-01-10', 'A'), (3, 3, '2026-01-12', 'F'),
(4, 3, '2026-01-10', 'B'), (4, 5, '2026-01-20', 'A'),
(5, 4, '2026-01-15', 'B');


-- --โจทย์: ดึงรายชื่อนักศึกษาทุกคนที่ใช้อีเมลของ @email.com และเกิดก่อนปี 2005 
select first_name, birth_date from student
where email like '%@email.com' and year(birth_date) < 2005;

-- แสดงชื่อวิชาที่มีหน่วยกิตเท่ากับ 3 หน่วยกิต โดยเรียงจากชื่อวิชา Z-A
select course_name, credit from course
where credit = 3
order by course_name desc;

-- แสดงรายชื่อนักศึกษา (First Name, Last Name) พร้อม ชื่อวิชา ที่พวกเขาลงเรียนทั้งหมด-- 
select student.first_name, student.last_name, course.course_name
from student 
join enrollment 
on student.student_id = enrollment.student_id
join course
on course.course_id = enrollment.course_id;

-- นับจำนวนนักศึกษาที่ลงทะเบียนในแต่ละวิชา แสดงผลเฉพาะวิชาที่มีคนเรียน 2 คนขึ้นไป
select count(student.student_id), course.course_name
from course
join enrollment
on enrollment.course_id = course.course_id
join student
on enrollment.student_id = student.student_id
group by course.course_name
having count(student.student_id) >= 2;



-- หาค่าเฉลี่ยของหน่วยกิต (Average Credit) ของวิชาที่มีนักศึกษาลงทะเบียนเรียนจริง--
select avg(course.credit) as 'Mean', course.course_name
from course
join enrollment
on course.course_id = enrollment.course_id
join student
on enrollment.student_id = student.student_id
group by course.course_name;



-- ค้นหารายชื่อนักศึกษาที่ "สอบตก" (ได้เกรด 'F') ในวิชาใดวิชาหนึ่ง และแสดงชื่อวิชานั้นด้วย
select student.first_name, student.last_name, course.course_name
from student join enrollment
on student.student_id = enrollment.student_id
join course on enrollment.course_id = course.course_id
where grade = 'F';


-- ใครคือคนที่ลงเรียนเยอะที่สุด? แสดงชื่อนักศึกษาและจำนวนวิชาที่เขาลงทะเบียนเรียน-- 
select count(course.course_id), student.first_name
from course join enrollment 
on enrollment.course_id = course.course_id
join student
on enrollment.student_id = student.student_id
group by student.student_id
order by count(course.course_id) desc;



-- แสดงรายชื่อนักศึกษาที่ยัง ไม่ได้ลงทะเบียนเรียนวิชา 'Database Systems' เลยสักครั้ง
select student.first_name
from student
where student_id not in (
					select enrollment.student_id
                    from enrollment
                    join course on enrollment.course_id = course.course_id
                    where course.course_name = 'Database Systems');

