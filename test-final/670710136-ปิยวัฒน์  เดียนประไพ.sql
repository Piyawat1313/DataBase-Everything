select first_name, last_name from student;
select first_name, birth_date from student where year(birth_date) > 2004;
select first_name, birth_date from student where year(birth_date) between 2003 and 2004;
select first_name from student where first_name like 'S%';
select student_id, first_name from student order by first_name ASC;
select first_name, birth_date from student order by year(birth_date) ASC;

select student.first_name, course.course_name 
from student join enrollment 
on student.student_id = enrollment.student_id
join course on course.course_id = enrollment.course_id;

select count(student_id) as 'Total Student' from student;


select count(student.first_name), course.course_name 
from student join enrollment 
on student.student_id = enrollment.student_id
join course on enrollment.course_id = enrollment.course_id
group by course.course_name;


select course.course_name, count(student.first_name)  as 'Total course'
from course
join enrollment
on course.course_id = enrollment.course_id
join student
on enrollment.student_id = student.student_id
group by course.course_name
having count(student.first_name) > 1; 




select student.first_name, student.last_name, course.course_name
from student
join enrollment
on student.student_id = enrollment.student_id
join course
on enrollment.course_id = course.course_id
where course.course_name = 'Database Systems';



select count(course.course_name), course.course_name 
from course
join enrollment
on enrollment.course_id = course.course_id
group by course.course_name
order by count(course.course_name) desc;