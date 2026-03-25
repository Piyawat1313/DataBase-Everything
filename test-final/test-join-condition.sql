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
