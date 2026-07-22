
CREATE TABLE studentss (
    student_id INT PRIMARY KEY,
    Name       VARCHAR(50) NOT NULL,
    Major      VARCHAR(20) NOT NULL,
    Age        INT NOT NULL,
    GPA        DECIMAL(3,1),
    CHECK (GPA BETWEEN 0.0 AND 4.0)
);

INSERT INTO studentss (student_id, Name, Major, Age, GPA) VALUES
(1, 'Ahmad', 'IT', 21, 3.5),
(2, 'Sara', 'CS', 20, 3.9),
(3, 'Ali', 'IT', 22, 2.8),
(4, 'Noor', 'SE', 19, 3.7),
(5, 'Omar', 'CS', 23, 3.2),
(6, 'Lina', 'IT', 20, 4.0),
(7, 'Ameer', 'SE', 21, 2.9),
(8, 'Rana', 'CS', 22, 3.6);
select max(Gpa) as highestgpa from studentss;
select min(gpa) as lowestgpa from studentss;
select count(*) from studentss;
select sum(gpa) as sumgpa from studentss;
select AVG(gpa) from studentss;
select * from studentss where name like 'A%';
select * from studentss where name like 'ra%';
select * from studentss where name like 'r%';
select * from studentss where Major = 'cs';

select max(gpa) as highestgpa , min(gpa) as lowergpa from studentss;

