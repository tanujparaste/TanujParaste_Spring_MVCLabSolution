CREATE DATABASE IF NOT EXISTS student_management_db;

USE student_management_db;

/*
delete existing tables
*/

DROP TABLE IF EXISTS students;

/*
create tables
*/

CREATE TABLE students(
    id INT AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    department VARCHAR(50) NOT NULL,
    country VARCHAR(50) NOT NULL,
    PRIMARY KEY(id)
);
