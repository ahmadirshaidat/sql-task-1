/*
CREATE TABLE Instructors (
    id              INT PRIMARY KEY IDENTITY,
    instructor_name VARCHAR(50)  NOT NULL,
    email           VARCHAR(100) UNIQUE,
    phone           VARCHAR(20)  UNIQUE
);

CREATE TABLE city (
    id_city   INT PRIMARY KEY,
    city_name VARCHAR(50) NOT NULL
);

CREATE TABLE student (
    id           INT PRIMARY KEY,
    student_name VARCHAR(50)  NOT NULL,
    id_city      INT NOT NULL,
    email        VARCHAR(100) UNIQUE,
    phone        VARCHAR(20)  UNIQUE,
    CONSTRAINT FK_Students_Cities FOREIGN KEY (id_city) REFERENCES city(id_city)
);

CREATE TABLE course (
    id            INT PRIMARY KEY,
    coursename    VARCHAR(50)  NOT NULL,
    id_instructor INT NOT NULL,
    description   VARCHAR(255),
    CONSTRAINT fk_course_Instructor FOREIGN KEY (id_instructor) REFERENCES Instructors(id)
);

CREATE TABLE student_course (
    enroll_id        INT PRIMARY KEY,
    course_id        INT NOT NULL,
    student_id       INT NOT NULL,
    enroll_date      DATE NOT NULL DEFAULT GETDATE(),
    final_grade      DECIMAL(5, 2) NULL,
    status_of_course VARCHAR(20) NOT NULL DEFAULT 'In Progress'
        CHECK (status_of_course IN ('Completed', 'In Progress', 'Dropped')),
    CONSTRAINT fk_student_course_student FOREIGN KEY (student_id) REFERENCES student(id),
    CONSTRAINT fk_studentcourse_course FOREIGN KEY (course_id) REFERENCES course(id)
);


INSERT INTO Instructors (instructor_name, email, phone) VALUES
('Ahmed Khalil',   'ahmed.khalil@center.com',   '0791111111'),
('Mohammad Saleh',  'm.saleh@center.com',        '0791111112'),
('Lina Odeh',       'lina.odeh@center.com',      '0791111113'),
('Yousef Ammar',    'yousef.ammar@center.com',   '0791111114'),
('Rana Fares',      'rana.fares@center.com',     '0791111115'),
('Sami Nour',       'sami.nour@center.com',      '0791111116'),
('Dina Qasem',      'dina.qasem@center.com',     '0791111117'),
('Khalid Zayed',    'khalid.zayed@center.com',   '0791111118');

-- 2) City (8)
INSERT INTO city (id_city, city_name) VALUES
(1, 'Amman'),
(2, 'Irbid'),
(3, 'Zarqa'),
(4, 'Aqaba'),
(5, 'Salt'),
(6, 'Madaba'),
(7, 'Karak'),
(8, 'Mafraq');

-- 3) Student (8)
INSERT INTO student (id, student_name, id_city, email, phone) VALUES
(1, 'Ali Hassan',    1, 'ali.hassan@mail.com',    '0781111111'),
(2, 'Sara Ibrahim',  2, 'sara.ibrahim@mail.com',  '0781111112'),
(3, 'Omar Nabil',    3, 'omar.nabil@mail.com',    '0781111113'),
(4, 'Huda Younis',   4, 'huda.younis@mail.com',   '0781111114'),
(5, 'Fadi Karam',    5, 'fadi.karam@mail.com',    '0781111115'),
(6, 'Mariam Adel',   6, 'mariam.adel@mail.com',   '0781111116'),
(7, 'Bilal Saeed',   7, 'bilal.saeed@mail.com',   '0781111117'),
(8, 'Nour Talal',    8, 'nour.talal@mail.com',    '0781111118');

-- 4) Course (8)
INSERT INTO course (id, coursename, id_instructor, description) VALUES
(1, 'SQL Basics',        1, 'Introduction to SQL and databases'),
(2, 'Java Programming',  2, 'Object-oriented programming with Java'),
(3, 'Python for Data',   3, 'Python fundamentals for data analysis'),
(4, 'Web Development',   4, 'HTML, CSS, and JavaScript basics'),
(5, 'Networking 101',    5, 'Fundamentals of computer networks'),
(6, 'Cybersecurity',     6, 'Introduction to security concepts'),
(7, 'C# Programming',    7, 'Building applications with C#'),
(8, 'Cloud Computing',   8, 'Basics of cloud infrastructure');

-- 5) Student_Course (8)
INSERT INTO student_course (enroll_id, course_id, student_id, enroll_date, final_grade, status_of_course) VALUES
(1, 1, 1, '2026-01-10', 88.50, 'Completed'),
(2, 2, 2, '2026-02-05', NULL,  'In Progress'),
(3, 3, 3, '2026-01-20', 76.00, 'Completed'),
(4, 4, 4, '2026-03-01', NULL,  'Dropped'),
(5, 5, 5, '2026-02-15', 91.25, 'Completed'),
(6, 6, 6, '2026-03-10', NULL,  'In Progress'),
(7, 7, 7, '2026-01-05', 65.75, 'Completed'),
(8, 8, 8, '2026-02-28', NULL,  'In Progress');

*/
--select

select * from student
select * from Instructors
select * from course
select * from student_course where status_of_course='Completed';
select * from student_course where final_grade >80;
select * from student where id_city = 1;
select * from course where id_instructor=1;
select * from student_course where enroll_date >'2026-02-05'
select * from student where student_name like 'A%';
select * from student_course where final_grade between 70 and 90;


--update


update student_course set  final_grade=90 where student_id=1;
update student set id_city=2 where id = 1;
update course set coursename='math' where id=5;
update Instructors set instructor_name='ahmad', email='a@gmail.com'  where id=1;
update student_course set status_of_course='Completed' where student_id=2;

--delete

DELETE FROM student_course WHERE enroll_id = 8;
DELETE FROM student WHERE id = 8;
DELETE FROM course WHERE id = 8;
delete from student_course where status_of_course='Dropped';
delete from student_course where enroll_date<'2026-01-20';



--join
select student.student_name , course.coursename from student
Inner join student_course on student_id  =student_course.student_id
inner join course on student_course.course_id=course.id;


select student.student_name , Instructors.instructor_name from student
left join student_course on student_id = student_course.student_id
left join course on student_course.course_id=course.id
left join Instructors on course.id_instructor=Instructors.id;



select student.student_name , city.city_name from student
right join city on student.id_city = city.id_city;




select course.coursename , Instructors.instructor_name from course
FULL OUTER JOIN Instructors on course.id_instructor=Instructors.id;


select Student.student_name , Course.coursename , student_course.final_grade, student_course.status_of_course from student
inner join student_course on student.id = student_course.student_id
inner join course on student_course.course_id = course.id;



--alter

--exec sp_rename 'student' , 'tolab';

--exec sp_rename 'course.coursename' , 'course_name' , 'column';

--alter table tolab add age int not null ;

--alter table tolab drop column age ;


--alter table tolab 
--alter column phone varchar(30) ;
