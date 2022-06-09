DROP DATABASE IF EXISTS Testing_System_Assignment1;
CREATE DATABASE Testing_System_Assignment1;
USE Testing_System_Assignment1;

DROP TABLE IF EXISTS Department;
CREATE TABLE Department(
     DepartmentID      TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
     DepartmentName    VARCHAR(50) UNIQUE NOT NULL
);
INSERT INTO Department(DepartmentName)
VALUES ('Sale1'),
	   ('Sale2'),
       ('Sale3'),
       ('Sale4'),
       ('Sale5'),
       ('Sale6'),
       ('Sale7'),
       ('Sale8'),
       ('Sale9'),
       ('Sale10');
SELECT * FROM Department;

DROP TABLE IF EXISTS `Position`;
CREATE TABLE `Position` (
     PositionID       TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
     PositionName     ENUM('DEV','TEST','Scrum Master','PM')
);
INSERT INTO `Position`(PositionName)
VALUES ('DEV'),
	   ('DEV'),
       ('DEV'),
       ('TEST'),
       ('TEST'),
       ('TEST'),
       ('Scrum Master'),
       ('Scrum Master'),
       ('Scrum Master'),
       ('PM');
SELECT * FROM `Position`;

DROP TABLE IF EXISTS Account;
CREATE TABLE Account(
     AccountID        TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
     Email            VARCHAR(50) UNIQUE KEY,
     Username         VARCHAR(50) UNIQUE KEY NOT NULL,
     FullName         VARCHAR(50) NOT NULL,
     DepartmentID     TINYINT UNSIGNED,
     PositionID       TINYINT UNSIGNED,
     CreateDate       DATE,
     FOREIGN KEY(DepartmentID) REFERENCES Department(DepartmentID),
     FOREIGN KEY(PositionID) REFERENCES `Position`(PositionID)
);
INSERT INTO Account(Email, Username, FullName, DepartmentID, PositionID,  CreateDate)
VALUES ('minhhai21022001@gmail.com','haiphamminh','pham minh hai','01','02','2022-04-12'),
       ('minhhoang21032002@gmail.com','hoangphamminh','pham minh hoang','02','01','2022-05-13'),
       ('quangdang21042003@gmail.com','quangdang','pham quang dang','03','03','2022-06-14'),
       ('minhhuy21052004@gmail.com','minhhuy','pham minh huy','04','04','2022-07-15'),
       ('minhhang21062005@gmail.com','minhhang','nguyen minh hang','01','03','2022-08-16'),
       ('minhhien21072006@gmail.com','hienphamminh','pham the hien','03','01','2022-01-09'),
       ('haidang21082007@gmail.com','haidang','pham hai dang','02','04','2022-03-08'),
       ('quochuy21092008@gmail.com','quochuy','vu quoc huy','04','03','2022-02-19'),
       ('vietanh210102009@gmail.com','vietanhnd','nguyen viet anh','05','03','2022-01-29'),
       ('vantien211120010@gmail.com','vantien','nguyen van tien','03','05','2022-03-21');
SELECT * FROM Account;

DROP TABLE IF EXISTS `Group`;
CREATE TABLE `Group`(
     GroupID         TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
     GroupName       VARCHAR(50),
     CreatorID       TINYINT UNSIGNED,
     CreateDate      DATE
);
INSERT INTO `Group`(GroupName, CreatorID , CreateDate)
VALUES ('BA','01','2022-01-15'),
	   ('FE','02','2022-02-13'),
       ('BE','03','2022-07-09'),
       ('Tester','04','2022-03-11'),
       ('SQL','05','2022-01-19');
SELECT * FROM `Group`;

DROP TABLE IF EXISTS GroupAccount;
CREATE TABLE GroupAccount(
     GroupID         TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
     AccountID       TINYINT UNSIGNED,
     JoinDate        DATE
);
INSERT INTO GroupAccount(AccountID , JoinDate )
VALUES ('01','2022-03-15'),
       ('02','2022-04-16'),
       ('03','2022-05-17'),
       ('04','2022-06-18'),
       ('03','2022-07-19'),
       ('02','2022-08-09'),
       ('04','2022-09-03'),
       ('01','2022-05-01'),
       ('02','2022-02-27'),
       ('03','2022-01-21');
SELECT * FROM GroupAccount;

DROP TABLE IF EXISTS TypeQuestion;
CREATE TABLE TypeQuestion(
     TypeID          TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
     TypeName        ENUM('Essay','Multiple-Choice')
);
INSERT INTO TypeQuestion(TypeName)
VALUES ('Essay'),
       ('Essay'),
       ('Essay'),
       ('Essay'),
       ('Essay'),
       ('Multiple-Choice'),
       ('Multiple-Choice'),
       ('Multiple-Choice'),
       ('Multiple-Choice'),
       ('Multiple-Choice');
SELECT * FROM TypeQuestion;


DROP TABLE IF EXISTS CategoryQuestion;
CREATE TABLE CategoryQuestion(
     CategoryID     TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
     CategoryName   ENUM('Java','.NET','SQL','Postman','Ruby')
);
INSERT INTO CategoryQuestion(CategoryID , CategoryName )
VALUES ('01','Java'),
       ('02','.NET'),
       ('03','SQL'),
       ('04','Postman'),
       ('05','Ruby');
SELECT * FROM CategoryQuestion;

DROP TABLE IF EXISTS Question;
CREATE TABLE Question(
     QuestionID     TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
     Content        VARCHAR(100) NOT NULL,
     CategoryID     TINYINT UNSIGNED,
     TypeID         TINYINT UNSIGNED,
     CreatorID      TINYINT UNSIGNED,
     CreateDate     DATE,
     FOREIGN KEY (CategoryID) REFERENCES CategoryQuestion(CategoryID),
     FOREIGN KEY (TypeID) REFERENCES TypeQuestion(TypeID)
);
INSERT INTO Question(Content,CategoryID,TypeID,CreatorID,CreateDate)
VALUES ('ban muon lap trinh ve mang nao','01','01','01','2022-01-19'),
	   ('ban biet gi ve .NET','02','02','02','2022-03-21'),
       ('ban da su dung thanh thao SQL chua','03','03','03','2022-05-03'),
       ('ban biet gi ve Postman','04','04','04','2022-06-12'),
       ('ban biet gi ve Ruby','05','05','05','2022-05-11'),
       ('ban da lam du an ve Java chua','01','01','01','2022-03-10'),
       ('ban hoc .NET o dau','02','02','02','2022-09-13'),
       ('ban hoc SQL trog bao lau','03','03','03','2022-04-01'),
       ('ban da lap trinh postman chua','04','04','04','2022-03-07');
SELECT * FROM Question;


DROP TABLE IF EXISTS Answer;
CREATE TABLE Answer(
     AnswerID      TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
     Content       VARCHAR(100) NOT NULL,
     QuestionID    TINYINT UNSIGNED,
     isCorrect     BOOLEAN NOT NULL,
     FOREIGN KEY (QuestionID) REFERENCES Question(QuestionID)
);
INSERT INTO Answer(Content, QuestionID , isCorrect)
VALUES  ('toi lap trinh web','01','1'),
	    ('toi da lam bai tap lon ve .NET','02','0'),
        ('toi da thanh thao SQL','03','1'),
        ('toi chua hoc ve Postman','04','0'),
        ('toi chua hoc ve Ruby','05','1'),
        ('toi da lam du an ve Java','01','1'),
        ('toi hoc o EPU','02','0'),
        ('toi hoc trong 2 thang','03','1'),
        ('toi lap trinh web','01','1'),
        ('toi chua lap trinh Postman','04','0');
SELECT * FROM Answer;


DROP TABLE IF EXISTS Exam;
CREATE TABLE Exam(
     ExamID        TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
     `Code`        TINYINT UNSIGNED,
     Title         VARCHAR(100) NOT NULL,
     CategoryID    TINYINT UNSIGNED,
     Duration      TIME,
     CreatorID     TINYINT UNSIGNED,
     CreateDate    DATE,
     FOREIGN KEY (CategoryID) REFERENCES CategoryQuestion(CategoryID)
);
INSERT INTO Exam(`Code`,Title ,CategoryID,Duration,CreatorID,CreateDate)
VALUES ('01','lap trinh Java','01','13:00:00','01','2022-03-11'),
       ('02','lap trinh .NET','02','14:00:00','02','2022-03-12'),
       ('01','co so du lieu SQL','03','15:00:00','03','2022-03-13'),
       ('01','lap trinh Postman','04','16:00:00','04','2022-03-14'),
       ('01','lap trinh Ruby','05','17:00:00','05','2022-03-15'),
       ('01','lap trinh Java nang cao','01','12:00:00','01','2022-03-16'),
       ('01','do an lap trinh .NET','02','09:00:00','02','2022-03-17'),
       ('01','he qun tri co so du lieu SQL','03','07:00:00','03','2022-03-18'),
       ('01','lap trinh Ruby nang cao','04','06:00:00','04','2022-03-19'),
       ('01','lap trinh Postman nang cao','05','05:00:00','05','2022-03-20');
SELECT * FROM Exam;

DROP TABLE IF EXISTS ExamQuestion;
CREATE TABLE ExamQuestion(
     ExamID       TINYINT UNSIGNED PRIMARY KEY,
     QuestionID   TINYINT UNSIGNED
);
INSERT INTO ExamQuestion(ExamID, QuestionID)
VALUES ('01','01'),
	   ('02','02'),
       ('03','03'),
       ('04','04'),
       ('05','05'),
       ('06','01'),
       ('07','04'),
       ('08','03'),
       ('09','01');
SELECT * FROM ExamQuestion;
