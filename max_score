create table course(
	"id" integer primary key,
	"name" text not null
);

create table student(
	"id" integer primary key,
	"name" text not null
);

create table score(
	"id" integer primary key,
	course_id integer not null,
	student_id integer not null,
	score integer not null
);

--

insert into course values(1,'语文'),(2,'数学'),(3,'外语');
insert into student values(1,'阿米娅'),(2,'凯尔希'),(3,'陈洁晖');

insert into score values(1,1,1,80),(2,2,1,90),(3,3,1,70);
insert into score values(4,1,2,70),(5,2,2,90),(6,3,2,80);
insert into score values(7,1,3,80),(8,2,3,60),(9,3,3,70);

--
select * from course;
select * from student;
select * from score;

-- 总分最高的学生
select distinct(student_id) 
from score 
group by student_id 
having sum(score) = (
	select sum(score) 
	from score 
	group by student_id 
	order by sum(score) desc limit 1
);

select s.name,t.score 
from student s right join (
	select distinct(student_id),sum(score) score 
	from score 
	group by student_id
	having sum(score) = (
		select sum(score) 
		from score group by student_id
		order by sum(score) desc
		limit 1
	) 
) t on s.id = t.student_id;

-- 单科最高
select max(score) score,course_id from score group by course_id;

select student_id,s1.course_id,s2.max_score from score s1
right join (
	select max(score) max_score,course_id from score group by course_id
) s2 on s1.course_id = s2.course_id and s1.score = s2.max_score;

select s.name,c.name,s2.max_score from score s1
right join (
	select max(score) max_score,course_id 
	from score 
	group by course_id
) s2 on s1.course_id = s2.course_id and s1.score = s2.max_score
left join course c on c.id = s1.course_id
left join student s on s.id = student_id;
