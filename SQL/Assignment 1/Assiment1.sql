DROP DATABASE IF EXISTS Testing_System_Assignment1;
CREATE DATABASE Testing_System_Assignment1;
USE Testing_System_Assignment1;

DROP TABLE IF EXISTS Department;
CREATE TABLE Department(
     DepartmentID      TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
     DepartmentName    VARCHAR(50) UNIQUE NOT NULL
);

DROP TABLE IF EXISTS `Position`;
CREATE TABLE `Position` (
     PositionID       TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
     PositionName     ENUM('DEV','TEST','Scrum Master','PM')
);

DROP TABLE IF EXISTS Account;
CREATE TABLE Account(
     AccountID        TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
     Email            VARCHAR(50) UNIQUE KEY,
     Username         VARCHAR(50) UNIQUE KEY NOT NULL,
     FullName         VARCHAR(50) NOT NULL,
     DepartmentID     TINYINT UNSIGNED,
     PositionID       VARCHAR(50),
     CreateDate       DATE
);

DROP TABLE IF EXISTS `Group`;
CREATE TABLE `Group`(
     GroupID         TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
     GroupName       VARCHAR(50),
     CreatorID       TINYINT UNSIGNED,
     CreateDate      DATE
);

DROP TABLE IF EXISTS GroupAccount;
CREATE TABLE GroupAccount(
     GroupID         TINYINT UNSIGNED PRIMARY KEY,
     AccountID       TINYINT UNSIGNED,
     JoinDate        DATE
);

DROP TABLE IF EXISTS TypeQuestion;
CREATE TABLE TypeQuestion(
     TypeID          TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
     TypeName        ENUM('(Essay','Multiple-Choice')
);

DROP TABLE IF EXISTS CategoryQuestion;
CREATE TABLE CategoryQuestion(
     CategoryID     TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
     CategoryName   ENUM('Java','.NET','SQL','Postman','Ruby,')
);

DROP TABLE IF EXISTS Question;
CREATE TABLE Question(
     QuestionID     TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
     Content        VARCHAR(100) NOT NULL,
     CategoryID     TINYINT UNSIGNED,
     TypeID         TINYINT UNSIGNED,
     CreatorID      TINYINT UNSIGNED,
     CreateDate     DATE
);

DROP TABLE IF EXISTS Answer;
CREATE TABLE Answer(
     AnswerID      TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
     Content       VARCHAR(100) NOT NULL,
     QuestionID    TINYINT UNSIGNED,
     isCorrect     BOOLEAN NOT NULL
);

DROP TABLE IF EXISTS Exam;
CREATE TABLE Exam(
     ExamID        TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
     Code          TINYINT UNSIGNED,
     Title         VARCHAR(100) NOT NULL,
     CategoryID    TINYINT UNSIGNED,
     Duration      TIME,
     CreatorID     TINYINT UNSIGNED,
     CreateDate    DATE
);

DROP TABLE IF EXISTS ExamQuestion;
CREATE TABLE ExamQuestion(
     ExamID       TINYINT UNSIGNED PRIMARY KEY,
     QuestionID   TINYINT UNSIGNED
);