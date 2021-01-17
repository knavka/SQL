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
('���������', '������', 37),
('������', '������', 30),
('����', '������', 40),
('����', '���������', 44),
('�����������', '�����', 80);
GO


ALTER TABLE Authors
ADD Country Varchar(20) DEFAULT '�� ��������'
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
('������ � �������', 1),
('���������� �������' , 1),
('������� ������ ' , 1),
('��������', 2),
('������������', 2),
('������ ����', 3),
('������� ����', 3),
('����� ����', 3);
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