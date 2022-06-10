-- Exercise 1: 
DROP DATABASE IF EXISTS fresher;
CREATE DATABASE fresher;
USE fresher;

DROP TABLE IF EXISTS Trainee;
CREATE TABLE Trainee (
     TraineeID         TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
     Full_Name         VARCHAR(50),
     Birth_Date        DATE,
     Gender            ENUM('male','female','unknown'),
     ET_IQ             INT NOT NULL CHECK (ET_IQ BETWEEN 0 AND 20),
     ET_Gmath          INT NOT NULL CHECK (ET_Gmath BETWEEN 0 AND 20),
     ET_English        INT NOT NULL CHECK (ET_English BETWEEN 0 AND 50),
     Training_Class    VARCHAR(50),
     Evaluation_Notes  VARCHAR(100),
     VTI_Account       VARCHAR(50) NOT NULL UNIQUE
);
INSERT INTO Trainee(Full_Name,Birth_Date,Gender,ET_IQ ,ET_Gmath,ET_English, Training_Class,Evaluation_Notes,VTI_Account)
VALUES ('Phạm Minh Hải','2001-01-21','male','19','13','30','Rocket25','abc','minhhai123'),
       ('Nguyễn Minh Quang','2000-01-19','male','20','09','15','Rocket21','bcd','abc123'),
       ('Nguyễn Minh Hiếu ','2000-01-25','male','15','09','15','Rocket21','bcd','bcd.234'),
       ('Hoàng Ngọc Thảo','1998-07-01','female','16','13','30','Rocket19','abc','xyz123');
SELECT * FROM Trainee;

-- Exercise 2:
DROP TABLE IF EXISTS `Data Types`;
CREATE TABLE `Data Types`(
     ID            TINYINT PRIMARY KEY AUTO_INCREMENT,
     `Name`        VARCHAR(50),
     `Code`        VARCHAR(50),
     ModifiedDate  TIME
);
INSERT INTO `Data Types`( `Name`, `Code`, ModifiedDate)
VALUES ('Hello','abcd','10:50:20'),
	   ('Hello 2','abcdef','15:30:23'),
       ('Hello 3','abcdef','17:21:01');
SELECT * FROM `Data Types`;

-- Exercise 3: 
DROP TABLE IF EXISTS `Data Types 2`;
CREATE TABLE `Data Types 2`(
     ID             TINYINT PRIMARY KEY AUTO_INCREMENT,
     `Name`         VARCHAR(50),
     BirthDate      DATE,
     Gender         ENUM('Male','Female','Unknow'),
     IsDeletedFlag  BOOLEAN
);
INSERT INTO `Data Types 2`(`Name`,BirthDate, Gender,IsDeletedFlag)
VALUES ('Minh Hai','2001-01-21','Male','0'),
       ('Hoang Linh','2003-09-12','Female','1'),
       ('Van Tien','1999-03-12','Unknow','1'),
       ('Huy Quang','2005-12-23','Male','0'),
       ('Hung Dung','2003-01-13','Male','1');
SELECT * FROM `Data Types 2`;



        
