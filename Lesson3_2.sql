CREATE DATABASE Staff    
ON							  
(
	NAME = 'Staff',            
	FILENAME = 'D:\SQLDATABASE\Staff.mdf', 
	SIZE = 10MB,                    
	MAXSIZE = 100MB,				
	FILEGROWTH = 10MB				
)
LOG ON						  
( 
	NAME = 'LogStaff',            
	FILENAME = 'D:\LogStaff.ldf', 
	SIZE = 5MB,                        
	MAXSIZE = 50MB,                    
	FILEGROWTH = 5MB                   
)   
COLLATE Cyrillic_General_CI_AS
GO

USE Staff
GO
CREATE TABLE Proffs
(
	ProffId smallint IDENTITY NOT NULL
	PRIMARY KEY (ProffId),
	ProffName Varchar(20)
)
GO

CREATE TABLE Staffs
(
	StaffId smallint IDENTITY NOT NULL
	PRIMARY KEY (StaffId),
	ProffId smallint
	FOREIGN KEY REFERENCES Proffs(ProffId),
	FirstName Varchar(20),
	LastName Varchar(20),
	Phone char(13)
	CHECK (Phone like '+380[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'), --'+380[0-9]{9}'
	StartDate SmallDateTime
)
GO


CREATE TABLE Shifts
(
	ShiftId smallint IDENTITY NOT NULL
	PRIMARY KEY (ShiftId),
	HoursPerDay Varchar(20)
)
GO

CREATE TABLE ShiftsStaffs
(
	ShiftId smallint NOT NULL
	FOREIGN KEY REFERENCES Shifts(ShiftId),
	StaffId smallint NOT NULL
	FOREIGN KEY REFERENCES Staffs(StaffId),
	ShiftDate SmallDateTime
)
GO


INSERT INTO Proffs 
(ProffName)
VALUES
('Механик'),
('Мастер')
GO

INSERT INTO Staffs
(FirstName,LastName,Phone,StartDate,ProffId)
VALUES
('Иван','Иванов','+380661234567','2018-01-01', 2),
('Петр','Петров','+380661111111','2019-09-09', 1),
('Василий','Петров','+380662222222','2019-10-10', 1)
GO


INSERT INTO Shifts 
(HoursPerDay)
VALUES
(8),
(12)
GO

INSERT INTO ShiftsStaffs 
(ShiftId,StaffId,ShiftDate)
VALUES
(1,1,'2021-01-01'),
(2,2,'2021-01-01'),
(2,2,'2021-01-02'),
(2,3,'2021-01-03'),
(1,1,'2021-01-04'),
(2,3,'2021-01-04')
GO

Select * from Proffs
Select * from Staffs
Select * from Shifts
Select * from ShiftsStaffs
GO


DROP TABLE ShiftsStaffs
GO
DROP TABLE Shifts
GO
DROP TABLE Staffs
GO
DROP TABLE Proffs
GO

USE master
DROP DATABASE Staff 
GO
