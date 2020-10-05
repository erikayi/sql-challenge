-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/YCPLl2
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

DROP TABLE departments;
DROP TABLE dept_emp;
DROP TABLE dept_manager;
DROP TABLE employees;
DROP TABLE salaries;
DROP TABLE titles;

CREATE TABLE departments (
    dept_no VARCHAR,
    dept_name VARCHAR NOT NULL
);

CREATE TABLE dept_emp (
    emp_no int,
    dept_no VARCHAR
);

CREATE TABLE dept_manager (
    dept_no VARCHAR,
    emp_no int
);

CREATE TABLE employees (
    emp_no SERIAL PRIMARY KEY NOT NULL,
    emp_title_id VARCHAR NOT NULL,
    birth_date DATE NOT NULL,
    first_name VARCHAR NOT NULL,
    last_name VARCHAR NOT NULL,
    sex VARCHAR NOT NULL,
    hire_date DATE NOT NULL
);

CREATE TABLE salaries (
    emp_no int,
    salary int
);

CREATE TABLE titles (
    title_id VARCHAR NOT NULL,
    title VARCHAR NOT NULL
);
