use UniversityDB;

create table enrollment(
Student_ID int not null,
Course_ID int not null,
YearTaken int ,
SemseterTaken int,
Mark int,
Grade Char(1),
 primary key (Student_ID, Course_ID),
 foreign key (Student_ID) references Student(S_id),
 foreign key (Course_ID) references course(course_id)
);

create  table programCourse(
course_id int primary key,
Program_ID int not null,
YearSequence int not null,
SemesterSequence int not null,
foreign key (course_id) references course(course_id),
foreign key (Program_ID) references program(Program_id)
);
/*drop table programCourse;*/

/* Insert in Program Table */

insert into program(Program_id, p_name, TotalCreditPoints, YearCommenced)
values (1,'BIO',180,1);
insert into program(Program_id, p_name, TotalCreditPoints, YearCommenced)
values (2,'IS',150,2);
insert into program(Program_id, p_name, TotalCreditPoints, YearCommenced)
values (3,'CS',170,2);
insert into program(Program_id, p_name, TotalCreditPoints, YearCommenced)
values (4,'MM',160,3);
insert into program(Program_id, p_name, TotalCreditPoints, YearCommenced)
values (5,'IT',140,1);
/*select * from program;*/
/*Insert in to Student Table*/
/*delete  from student;*/
insert into student(S_id,S_name,DateOfBirth, YearEnrolled,Program_ID)
values (1,'Asmaa','05/05/2002',2020,1);
insert into student(S_id,S_name,DateOfBirth, YearEnrolled,Program_ID)
values (2,'Mai','05/10/2002',2020,2);
insert into student(S_id,S_name,DateOfBirth, YearEnrolled,Program_ID)
values (3,'Mona','08/05/2000',2020,1);
insert into student(S_id,S_name,DateOfBirth, YearEnrolled,Program_ID)
values (4,'Shima','05/11/2002',2018,3);
insert into student(S_id,S_name,DateOfBirth, YearEnrolled,Program_ID)
values (5,'Manal','05/05/2003',2022,4);
select * from student;
/*Insert in to Course Table*/
insert into course(course_id,c_name,CreditPointsValues,YearCommenced)
values (1,'DATABASE',100,2);
insert into course(course_id,c_name,CreditPointsValues,YearCommenced)
values (2,'DATAMINING',100,3);
insert into course(course_id,c_name,CreditPointsValues,YearCommenced)
values (3,'DATAStRUCTURE',100,4);
insert into course(course_id,c_name,CreditPointsValues,YearCommenced)
values (4,'ALGORTHIM',100,2);
insert into course(course_id,c_name,CreditPointsValues,YearCommenced)
values (5,'MATH',100,1);
select * from course;

/*insert in to enrollment*/
insert into enrollment(Student_ID,Course_ID,YearTaken,SemseterTaken,Mark,Grade)
values (1,2,2021,1,60,'A');
insert into enrollment(Student_ID,Course_ID,YearTaken,SemseterTaken,Mark,Grade)
values (2,3,2020,1,80,'B');
insert into enrollment(Student_ID,Course_ID,YearTaken,SemseterTaken,Mark,Grade)
values (1,3,2024,1,60,'C');
insert into enrollment(Student_ID,Course_ID,YearTaken,SemseterTaken,Mark,Grade)
values (5,2,2023,1,70,'A');
insert into enrollment(Student_ID,Course_ID,YearTaken,SemseterTaken,Mark,Grade)
values (4,2,2021,1,50,'B');
select * from enrollment;

/*Insert in to programCourse*/

insert into programCourse(course_id,Program_ID,YearSequence,SemesterSequence)
values (1,2,2021,1);
insert into programCourse(course_id,Program_ID,YearSequence,SemesterSequence)
values (2,2,2022,1);
insert into programCourse(course_id,Program_ID,YearSequence,SemesterSequence)
values (3,1,2023,2);
insert into programCourse(course_id,Program_ID,YearSequence,SemesterSequence)
values (4,4,2021,1);
insert into programCourse(course_id,Program_ID,YearSequence,SemesterSequence)
values (5,5,2022,2);

/* Queries*/
/*delete  from student;*//*Q1*/
select * from student;/*Q2*/
select  SemseterTaken, count(Student_ID) as StudentCount
from Enrollment
group by SemseterTaken;/*Q3*/

select 
    Program_ID, 
    course_id, 
    YearSequence, 
    SemesterSequence
from 
    programCourse
order by
    Program_ID, 
    YearSequence, 
    SemesterSequence; /* Q4*/

select S_id, S_name 
from Student 
where S_id not in (select distinct Student_ID from enrollment); /*Q5*/




