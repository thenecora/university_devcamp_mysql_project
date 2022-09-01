USE mydb;


/* Populate data */

INSERT INTO students(student_name, student_email)
VALUES('Nerea Corrales', 'nereacorr@university.com');

INSERT INTO students(student_name, student_email)
VALUES('John White', 'j.white@university.com');

INSERT INTO students(student_name, student_email)
VALUES('Margaret Clayton', 'margaret_clayton@university.com');

INSERT INTO students(student_name, student_email)
VALUES('Mary Watson', 'marywatson@university.com');

INSERT INTO students(student_name, student_email)
VALUES('Emma Kerr', 'emkerr@university.com');

INSERT INTO students(student_name, student_email)
VALUES('Marta Martínez', 'mmartinez@university.com');

INSERT INTO students(student_name, student_email)
VALUES('Miriam Hernández', 'miriam.hdz@university.com');

INSERT INTO professors(professor_name, professor_email)
VALUES('Kurt Desender', 'kurt.desender@university.com');

INSERT INTO professors(professor_name, professor_email)
VALUES('Silvina Rubio', 'silv.rubio@university.com');

INSERT INTO professors(professor_name, professor_email)
VALUES('Plácido Sierra', 'placido.sh@university.com');

INSERT INTO courses(course_name, courses_id_professor)
VALUES('Marketing', 1);

INSERT INTO courses(course_name, courses_id_professor)
VALUES('Literature', 2);

INSERT INTO courses(course_name, courses_id_professor)
VALUES('Technology', 3);

INSERT INTO grades(grade, grades_id_student, grades_id_professor, grades_id_course)
VALUES(8.1, 1, 1, 1);

INSERT INTO grades(grade, grades_id_student, grades_id_professor, grades_id_course)
VALUES(5.0, 1, 2, 2);

INSERT INTO grades(grade, grades_id_student, grades_id_professor, grades_id_course)
VALUES(7.5, 1, 3, 3);

INSERT INTO grades(grade, grades_id_student, grades_id_professor, grades_id_course)
VALUES(4.5, 2, 1, 1);

INSERT INTO grades(grade, grades_id_student, grades_id_professor, grades_id_course)
VALUES(7.1, 2, 2, 2);

INSERT INTO grades(grade, grades_id_student, grades_id_professor, grades_id_course)
VALUES(6.2, 2, 3, 3);

INSERT INTO grades(grade, grades_id_student, grades_id_professor, grades_id_course)
VALUES(5.1, 3, 1, 1);

INSERT INTO grades(grade, grades_id_student, grades_id_professor, grades_id_course)
VALUES(8.6, 3, 2, 2);

INSERT INTO grades(grade, grades_id_student, grades_id_professor, grades_id_course)
VALUES(5.7, 3, 3, 3);

INSERT INTO grades(grade, grades_id_student, grades_id_professor, grades_id_course)
VALUES(5.9, 4, 1, 1);

INSERT INTO grades(grade, grades_id_student, grades_id_professor, grades_id_course)
VALUES(9.7, 4, 2, 2);

INSERT INTO grades(grade, grades_id_student, grades_id_professor, grades_id_course)
VALUES(7.2, 5, 1, 1);

INSERT INTO grades(grade, grades_id_student, grades_id_professor, grades_id_course)
VALUES(7.9, 5, 2, 2);

INSERT INTO grades(grade, grades_id_student, grades_id_professor, grades_id_course)
VALUES(6.4, 6, 1, 1);

INSERT INTO grades(grade, grades_id_student, grades_id_professor, grades_id_course)
VALUES(5.0, 6, 2, 2);

INSERT INTO grades(grade, grades_id_student, grades_id_professor, grades_id_course)
VALUES(6.7, 6, 3, 3);

INSERT INTO grades(grade, grades_id_student, grades_id_professor, grades_id_course)
VALUES(8.4, 7, 2, 2);



/* Queries */

/* 1) The average grade that is given by each professor */

SELECT grades_id_professor, AVG(grade)
FROM grades
GROUP BY grades_id_professor;


/* 2) The top grades for each student */

SELECT grades_id_student, MAX(grade)
FROM grades
GROUP BY grades_id_student;


/* 3) Group students by the courses that they are enrolled in */

SELECT grades_id_student AS 'ID Student', grades_id_course AS 'ID Course'
FROM grades;


/* 4) Create a summary report of courses and their average grades, sorted by the most challenging course (course with the lowest average grade) to the easiest course */

SELECT grades_id_course AS 'ID Course', AVG(grade) AS 'Average Grade'
FROM grades
GROUP BY grades_id_course
ORDER BY AVG(grade) ASC;


/* 5) Finding which student and professor have the most courses in common */

WITH CTE AS (
  SELECT
    students.student_name,
    professors.professor_name,
    COUNT(DISTINCT courses.id_course) counter
  FROM grades
  JOIN students
  ON grades.grades_id_student = students.id_student
  JOIN professors
  ON grades.grades_id_professor = professors.id_professor
  JOIN courses
  ON grades.grades_id_course = courses.id_course
  GROUP BY students.student_name, professors.professor_name
  
)

SELECT * FROM CTE
WHERE CTE.counter = (
  SELECT MAX(counter) FROM CTE
)
