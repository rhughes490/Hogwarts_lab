DROP TABLE students;
DROP TABLE houses;

CREATE TABLE students (
  id SERIAL primary key,
  first_name varchar(255),
  second_name varchar(255),
  house varchar(255),
  age INT
);

CREATE TABLE houses (
  id SERIAL primary key,
  name varchar(255)
);