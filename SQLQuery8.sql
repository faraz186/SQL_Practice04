create database mysql

create table Student(
S_Id             int primary key,
S_name           varchar(50),
S_age            int,
S_city           int,
S_gender         varchar(10),
S_courses        int,
foreign key(S_city) references Location(cid),
foreign key(S_courses) REFERENCES Subjects(crid)
);



insert into Student(S_Id,S_name,S_age,S_gender,S_city,S_courses)
values
(1,'Mohammad Faraz',19,'Male',1,2),
(2,'Adeel Ahmed',21,'Male',2,4),
(3,'Irfan Khan',24,'Male',2,5),
(4,'Marium Khan',20,'Female',5,5),
(5,'Kashif Iqbal',35,'Male',4,5),
(6,'Luqman Rashid',28,'Male',3,1),
(7,'Fizza khan',26,'Female',4,3),
(8,'Fazeel Ahmed',33,'Male',3,3),
(9,'Asif Raza',25,'Male',5,1);



select * from Student


create table Location(
cid             int primary key,
city_name       varchar(50)
);


insert into Location(cid,city_name)
values
(1,'Karachi'),
(2,'Lahore'),
(3,'Quetta'),
(4,'Islamabad'),
(5,'Kashmir');


select * from Location
 

create table Subjects(
crid              int primary key,
course_name       varchar(50)
);


insert into Subjects(crid,course_name)
values
(1,'Data Structure and Algorithms'),
(2,'Discrete Sturcture'),
(3,'Database Systems'),
(4,'Data Analysis'),
(5,'Differential Equations');


select * from Subjects


create table Students(
id             int primary key,
name           varchar(50),
city           varchar(50)
);

insert into Students(id,name,city)
values(1,'Mohammad Faraz','Karachi'),
(2,'Saqib Ahmed','Lahore'),
(3,'Fazeel Khan','Kashmir'),
(4,'Zia Ahmed','Islamabad');



select * from Students



create table Lecturer(
id             int primary key,
name           varchar(50),
city           varchar(50)
);



insert into Lecturer(id,name,city)
values(1,'Mohammad Faraz','Karachi'),
(2,'Saleem Ahmed','Lahore'),
(3,'Mohammad Aqib','Kashmir'),
(4,'Raza Khan','Islamabad');



select * from Lecturer




SELECT s.S_name FROM Student s
WHERE s.S_courses = (select s.crid from Subjects s where s.course_name = 'Differential Equations' )



SELECT s.S_name FROM Student s
WHERE s.S_courses = (select s.crid from Subjects s where s.course_name = 'Differential Equations' )
order by s.S_name DESC




SELECT s.S_name FROM Student s
WHERE s.S_courses IN (select s.crid from Subjects s where s.course_name in('Database Systems','Differential Equations') )
order by s.S_name DESC




SELECT s.S_name FROM Student s
WHERE EXISTS (select s.crid from Subjects s where s.course_name IN('Database Systems') )
order by s.S_name DESC




SELECT s.S_name FROM Student s
WHERE NOT EXISTS (select s.crid from Subjects s where s.course_name IN('Mangement Science') )
order by s.S_name DESC




SELECT S_city, COUNT(S_city)
FROM Student
Group by S_city




SELECT l.city_name, COUNT(s.S_city) AS Total
FROM Student s INNER JOIN Location l
ON s.S_city = l.cid
Group by l.city_name




SELECT l.city_name, COUNT(s.S_city) AS Total
FROM Student s INNER JOIN Location l
ON s.S_city = l.cid
Where s.S_age <26
Group by l.city_name




SELECT l.city_name, COUNT(s.S_city) AS Total
FROM Student s INNER JOIN Location l
ON s.S_city = l.cid
Group by l.city_name




SELECT * FROM Students
UNION
SELECT * FROM Lecturer




SELECT id,name,city FROM Students
UNION
SELECT id,name,city FROM Lecturer




SELECT id,name FROM Students
WHERE city = (select cid from Location where city_name = 'Karachi')
UNION ALL
SELECT id,name FROM Lecturer
WHERE city = (select cid from Location where city_name = 'Karachi')










