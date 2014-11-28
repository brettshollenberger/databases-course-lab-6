/* Must be a simple SELECT */
/* Cannot use grouping/aggregation */
/* Can use set theory-type statements (union, intersect, minus) */

/* --- Q1 */
SELECT * FROM students where classroom=102 ORDER BY last_name;

/* --- Q2 */
SELECT DISTINCT teachers.classroom, students.grade
FROM teachers
INNER JOIN students
ON teachers.classroom=students.classroom;

/* --- Q3 */
SELECT
DISTINCT teachers.first_name,
teachers.last_name,
teachers.classroom
FROM teachers
INNER JOIN students on teachers.classroom=students.classroom
WHERE students.grade=0;

/* --- Q4 */
SELECT students.last_name, students.first_name FROM teachers
INNER JOIN students
ON teachers.classroom=students.classroom
WHERE teachers.first_name="Kirk"
AND teachers.last_name="Marrotte"
ORDER BY students.last_name;

/* --- Q5 */
SELECT
DISTINCT teachers.last_name,
teachers.first_name,
teachers.classroom
FROM teachers
INNER JOIN students
ON students.classroom=teachers.classroom
ORDER BY teachers.last_name;
