-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema university
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema university
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `university` DEFAULT CHARACTER SET utf8 ;
USE `university` ;

-- -----------------------------------------------------
-- Table `university`.`department`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `university`.`department` (
  `department_id` INT(11) NOT NULL AUTO_INCREMENT,
  `department` VARCHAR(45) NOT NULL,
  `department_code` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`department_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `university`.`college`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `university`.`college` (
  `college_id` INT(11) NOT NULL AUTO_INCREMENT,
  `college` VARCHAR(45) NOT NULL,
  `department_id` INT(11) NOT NULL,
  PRIMARY KEY (`college_id`, `department_id`),
  INDEX `fk_college_department1_idx` (`department_id` ASC),
  CONSTRAINT `fk_college_department1`
    FOREIGN KEY (`department_id`)
    REFERENCES `university`.`department` (`department_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `university`.`course`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `university`.`course` (
  `course_id` INT(11) NOT NULL AUTO_INCREMENT,
  `course_title` VARCHAR(45) NOT NULL,
  `course_num` INT(11) NOT NULL,
  `credits` INT(11) NOT NULL,
  `department_id` INT(11) NOT NULL,
  PRIMARY KEY (`course_id`, `department_id`),
  INDEX `fk_course_department1_idx` (`department_id` ASC),
  CONSTRAINT `fk_course_department1`
    FOREIGN KEY (`department_id`)
    REFERENCES `university`.`department` (`department_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `university`.`enrollment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `university`.`enrollment` (
  `enrollment_id` INT(11) NOT NULL AUTO_INCREMENT,
  `enrollment` INT(11) NOT NULL,
  PRIMARY KEY (`enrollment_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `university`.`faculty`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `university`.`faculty` (
  `faculty_id` INT(11) NOT NULL AUTO_INCREMENT,
  `faculty_fname` VARCHAR(45) NOT NULL,
  `faculty_lname` VARCHAR(45) NOT NULL,
  `capacity` VARCHAR(45) NOT NULL,
  `course_id` INT(11) NOT NULL,
  PRIMARY KEY (`faculty_id`, `course_id`),
  INDEX `fk_faculty_course1_idx` (`course_id` ASC),
  CONSTRAINT `fk_faculty_course1`
    FOREIGN KEY (`course_id`)
    REFERENCES `university`.`course` (`course_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `university`.`terms`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `university`.`terms` (
  `terms_id` INT(11) NOT NULL AUTO_INCREMENT,
  `year` INT(11) NOT NULL,
  `term` ENUM('FALL', 'WINTER', 'SUMMER', 'SPRING') NOT NULL,
  PRIMARY KEY (`terms_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `university`.`section`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `university`.`section` (
  `section_id` INT(11) NOT NULL,
  `department_id` INT(11) NOT NULL,
  `course_id` INT(11) NOT NULL,
  `terms_id` INT(11) NOT NULL,
  `enrollment_id` INT(11) NOT NULL,
  PRIMARY KEY (`section_id`, `department_id`, `course_id`, `terms_id`, `enrollment_id`),
  INDEX `fk_courses_class_terms1_idx` (`terms_id` ASC),
  INDEX `fk_courses_class_section1_idx` (`enrollment_id` ASC),
  INDEX `fk_courses_class_course1_idx` (`course_id` ASC, `department_id` ASC),
  CONSTRAINT `fk_courses_class_course1`
    FOREIGN KEY (`course_id` , `department_id`)
    REFERENCES `university`.`course` (`course_id` , `department_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_courses_class_section1`
    FOREIGN KEY (`enrollment_id`)
    REFERENCES `university`.`enrollment` (`enrollment_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_courses_class_terms1`
    FOREIGN KEY (`terms_id`)
    REFERENCES `university`.`terms` (`terms_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `university`.`student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `university`.`student` (
  `student_id` INT(11) NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `gender` ENUM('M', 'F') NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `state` VARCHAR(45) NOT NULL,
  `birthdate` DATE NOT NULL,
  `section_id` INT(11) NOT NULL,
  `department_id` INT(11) NOT NULL,
  `course_id` INT(11) NOT NULL,
  `terms_id` INT(11) NOT NULL,
  `enrollment_id` INT(11) NOT NULL,
  PRIMARY KEY (`student_id`, `section_id`, `department_id`, `course_id`, `terms_id`, `enrollment_id`),
  INDEX `fk_student_ section1_idx` (`section_id` ASC, `department_id` ASC, `course_id` ASC, `terms_id` ASC, `enrollment_id` ASC),
  CONSTRAINT `fk_student_ section1`
    FOREIGN KEY (`section_id` , `department_id` , `course_id` , `terms_id` , `enrollment_id`)
    REFERENCES `university`.`section` (`section_id` , `department_id` , `course_id` , `terms_id` , `enrollment_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 15
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- *****************************************
-- *   END OF FORWARD ENGINEERING CODE     *
-- *****************************************
USE university;

INSERT INTO enrollment (enrollment_id, enrollment) VALUES (1,1),(2,2),(3,3);

INSERT INTO department(department_id,department,department_code) 
VALUES (1,'Computer Information Technology', 'CIT'), (2,'Economics','ECON'), (3,'Humanities and Philosophy','HUM');

INSERT INTO course (course_id,course_num,course_title,credits,department_id)
VALUES (1,111,'Intro to Databases',3,1), (2,388, 'Econometrics',4,2),(3,150, 'Micro Economics',3,2), (4,376,'Classical Heritage',2,3);

INSERT INTO college (`college_id`,`college`,`department_id`) VALUES(1,'College of Physical Science and
Engineering',1), (2,'College of Business and Communication',2),(3,'College of Language
and Letters',3);

INSERT INTO terms (terms_id,year, term)
VALUES(1,2019,'Fall'),(2,2018,'Winter');

INSERT INTO section(section_id, department_id, course_id, terms_id, enrollment_id)
VALUES(1,1,1,1,1),
(2,2,3,1,1),(3,2,3,1,2),(4,2,2,1,1),(5,3,4,1,1),(6,1,1,2,2),(7,1,1,2,3), (8,2,3,2,1), (9,2,3,2,2),
(10,3,4,2,1);

INSERT INTO faculty (faculty_id,faculty_fname,faculty_lname, capacity,course_id)
VALUES(1,'Marty','Morring',30,1),(2,'Nate','Norris',50,3),(3,'Ben','Barrus',35,2),
(4,'John','Jensen',30,4),(5,'Bill','Barney',35,1);

INSERT INTO student(student_id, first_name, last_name, 
gender, city, state, birthdate,section_id,department_id,course_id,terms_id,enrollment_id)
VALUES(1,'Paul','Miller', 'M','Dallas','TX','1996-02-22',1,1,1,1,1),
(2,'Katie','Smith','F','Provo','UT', '1995-07-22',4,2,2,1,1),
(3,'Kelly','Jones','F','Provo','UT','1998-06-22',4,2,2,1,1),
(4, 'Devon','Merrill','M','Mesa','AZ','2000-07-22',5,3,4,1,1),
(5, 'Mandy','Murdock','F','Topeka','KS', '1996-11-22',4,2,2,1,1),
(6,'Alece','Adams','F','Rigby','ID', '1997-05-22',7,1,1,2,3),
(7,'Bryce','Carlson','M','Bozeman','MT','1997-11-22',7,1,1,2,2),
(8,'Preston','Larsen','M','Decatur','TN', '1996-09-22',9,2,3,2,2),
(9,'Julia','Madsen','F','Rexburg','ID','1998-09-22',9,2,3,2,2),
(10,'Susan','Sorensen','F','Mesa','AZ','1998-08-09',6,1,1,2,2),
(11,'Paul','Miller', 'M','Dallas','TX','1996-02-22',9,2,3,1,2),
(12, 'Mandy','Murdock','F','Topeka','KS', '1996-11-22',5,3,4,1,1),
(13,'Bryce','Carlson','M','Bozeman','MT','1997-11-22',8,2,3,2,1),
(14,'Bryce','Carlson','M','Bozeman','MT','1997-11-22',10,3,4,2,1);

-- **************************
-- *  BEGINNING OF QUERIES  *
-- **************************

-- 1st Query
SELECT DISTINCT first_name AS fname, last_name AS lname, DATE_FORMAT(birthdate, '%M %d, %Y') AS 'Sept Birthdays'
FROM student
WHERE MONTH(birthdate) = 9
ORDER BY last_name;

-- 2nd Query
SET @AGER = '2017-1-5';
SELECT DISTINCT last_name AS lname, first_name AS fname, TIMESTAMPDIFF(YEAR, birthdate, @AGER ) AS Years,
MOD(TIMESTAMPDIFF(DAY, birthdate, @AGER ), 365) AS Days, CONCAT(TIMESTAMPDIFF(YEAR, birthdate, @AGER ),' - Yrs, ',
 MOD(TIMESTAMPDIFF(DAY, birthdate, @AGER ), 365), ' - Days') AS 'Years and Days'
FROM student
ORDER BY Years DESC;

-- 3rd Query
SELECT first_name AS fname, last_name AS lname
FROM student
WHERE course_id = 4
ORDER BY last_name;

-- 4th Query
SELECT faculty_fname AS fname, faculty_lname AS lname
FROM faculty
WHERE (course_id = 1 OR course_id = 3 OR course_id = 4)
AND capacity = 30 OR capacity = 50
ORDER BY faculty_lname;

-- 5th Query
SELECT first_name AS fname, last_name AS lname
FROM student
WHERE course_id = 2 AND department_id = 2
ORDER BY last_name;

-- 6th Query 
SELECT dep.department_code, cur.course_num, cur.course_title AS name
FROM student stu
INNER JOIN course cur
ON cur.course_id = stu.course_id
INNER JOIN department dep
ON dep.department_id = stu.department_id
WHERE stu.first_name = 'Bryce' AND stu.last_name = 'Carlson'
GROUP BY cur.course_title
ORDER BY cur.course_title;

-- 7th Query
SELECT ter.term, ter.year, COUNT(*) AS enrollment
FROM student stu
INNER JOIN terms ter
ON ter.terms_id = stu.terms_id
WHERE stu.terms_id = 1;

-- 8th Query 
SELECT col.college AS colleges, COUNT(cur.course_title) AS Courses
FROM college col
INNER JOIN course cur
ON cur.department_id = col.department_id
GROUP BY col.college
HAVING COUNT(cur.course_title)
ORDER BY college;

-- 9th Query
SELECT DISTINCT fac.faculty_fname AS fname, fac.faculty_lname AS lname,
SUM(fac.capacity) AS 'TeachingCapacity'
FROM faculty fac
INNER JOIN section sec
ON fac.course_id = sec.course_id
INNER JOIN terms ter
ON sec.terms_id = ter.terms_id
WHERE ter.terms_id = 2
GROUP BY fac.faculty_fname
ORDER BY fac.capacity;

-- 10th Query
SELECT st.last_name AS lname, st.first_name AS fname,  SUM(cur.credits) AS credits
FROM student st
INNER JOIN course cur
ON cur.course_id = st.course_id
WHERE st.terms_id = 1
GROUP BY st.last_name DESC
HAVING SUM(cur.credits) > 3
ORDER BY cur.credits DESC;

-- ULISES MARIANO MELGAREJO
-- CIT111