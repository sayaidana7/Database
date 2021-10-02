--task1
select course_id from course
where credits>3;

select room_number from classroom
where building= 'Watson' or building='Packard';

select course_id from course
where dept_name='Comp. Sci.';

select course_id from section
where semester='Fall';


select id from student
where tot_cred>45 and tot_cred<90;

select name from student
where name like '%a' or name like '%e' or name like '%i' or name like '%o' or name like '%u' or name like '%y';


select course_id from prereq
where prereq_id='CS-101';


--task2
select dept_name,avg(salary) from instructor
group by dept_name
order by avg(salary)asc;


select building from classroom
group by building
order by sum(capacity)desc limit 1;

select dept_name from course
group by dept_name
order by count(course_id)asc limit 1;

Select student.id,name, count(course_id) from student,takes
where student.id=takes.id and student.dept_name='Comp. Sci.'
group by student.id, name
having count(course_id)>3;

select name from instructor
where dept_name='Biology' or dept_name='Philosophy' or dept_name='Music';

select name from instructor
where id in (Select id from teaches where year='2017');
--task3
select name from student
where dept_name = 'Comp. Sci.' and id in(Select id from takes
    where grade='A' or grade='-A' and course_id='CS-101' or course_id='CS-190'or course_id='CS-315' or
          course_id='CS-319' or course_id='CS-347')
order by name asc ;


Select distinct s_id, name, i_id from advisor,takes,student
where takes.id=advisor.s_id and student.id=takes.id and takes.grade in ('C-', 'C', 'F');


select distinct dept_name from course
where dept_name not in (SELECT dept_name from course,takes
where course.course_id=takes.course_id and takes.grade in ('F','C','C-', 'C+'));


select distinct name from instructor
where name not in (select name from takes,teaches,instructor
where takes.course_id=teaches.course_id and teaches.id=instructor.id and takes.grade in ('A', 'A-'));


select title from course
where course_id in (select course_id from section where (section.time_slot_id='A' or section.time_slot_id='B'or section.time_slot_id='C' or
                                     section.time_slot_id='E' or section.time_slot_id='H'));
