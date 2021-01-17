CREATE DATABASE [Library]
ON							  
(
	NAME = 'Library',            
	FILENAME = 'D:\SQLDATABASE\Library.mdf', 
	SIZE = 10MB,                    
	MAXSIZE = 100MB,				
	FILEGROWTH = 10MB				
)
LOG ON						  
( 
	NAME = 'LogLibraryDB',            
	FILENAME = 'D:\LogLibrary.ldf', 
	SIZE = 5MB,                        
	MAXSIZE = 50MB,                    
	FILEGROWTH = 5MB                   
)   
COLLATE Cyrillic_General_CI_AS 
GO 

USE [Library]
GO

CREATE TABLE Authors
(
	
	AuthorId smallint IDENTITY NOT NULL,
	AuthorFirstName Varchar(20),
	AuthorLastName Varchar(20),
	AuthorAge TinyInt NULL

)
GO 


INSERT INTO Authors 
(AuthorFirstName, AuthorLastName, AuthorAge)
VALUES
('Александр', 'Пушкин', 37),
('Сергей', 'Есенин', 30),
('Джек', 'Лондон', 40),
('Шота', 'Руставели', 44),
('Рабиндранат', 'Тагор', 80);
GO


ALTER TABLE Authors
ADD Country Varchar(20) DEFAULT 'Не известно'
WITH VALUES
GO


ALTER TABLE Authors
ADD CONSTRAINT PK_Authors
PRIMARY KEY (AuthorId)
GO
SELECT * FROM Authors;
GO

CREATE TABLE Books
(
	
	BookId smallint IDENTITY NOT NULL,
	AuthorId smallint
	FOREIGN KEY REFERENCES Authors(AuthorId),
	BookTitle varchar(max)
)
GO 


INSERT INTO Books 
(BookTitle, AuthorId)
VALUES
('Руслан и Людмила', 1),
('Кавказский пленник' , 1),
('Евгений Онегин ' , 1),
('Радуница', 2),
('Преображение', 2),
('Мартин Иден', 3),
('Морской волк', 3),
('Белый Клык', 3);
GO


SELECT * FROM Books;
GO



DROP TABLE Books
GO
DROP TABLE Authors
GO

USE master
DROP DATABASE [Library]
GO