CREATE TABLE Lab3.dbo.Страны
(
	CountryID int PRIMARY KEY IDENTITY(1, 1),
	CountryName nvarchar(30) NOT NULL

);
CREATE TABLE Lab3.dbo.Города
(
	CityID int PRIMARY KEY IDENTITY(1,1),
	CityName nvarchar(30) NOT NULL,
	CountryID int NOT NULL  FOREIGN KEY REFERENCES Lab3.dbo.Страны(CountryID)
	ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT UQ_Города_CityName_CountryID UNIQUE(CityName, CountryID)
);

CREATE TABLE Lab3.dbo.Сотрудники
(
	EmployeeID int PRIMARY KEY IDENTITY(1,1),
	EmployeeFIO nvarchar(150) NOT NULL,
	BirhDay date NOT NULL,
	Demartment int NOT NULL,
	Salary real NOT NULL,
	CityID int NOT NULL FOREIGN KEY REFERENCES Lab3.dbo.Города(CityID)
	ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO Lab3.dbo.Страны(CountryName)
VALUES ('Russia');
INSERT INTO Lab3.dbo.Города(CityName,CountryID)
VALUES ('Moscow',1);
INSERT INTO Lab3.dbo.Города(CityName,CountryID)
VALUES ('Peter',1);

INSERT INTO Lab3.dbo.Сотрудники(EmployeeFIO,Salary,Demartment,BirhDay,CityID)
VALUES('Иванов Иван Иванович',300,1,'1992-11-14',1);
INSERT INTO Lab3.dbo.Сотрудники(EmployeeFIO,Salary,Demartment,BirhDay,CityID)
VALUES('Иванов Федор Иванович',450,2,'1985-11-14',1);
INSERT INTO Lab3.dbo.Сотрудники(EmployeeFIO,Salary,Demartment,BirhDay,CityID)
VALUES('Иванова Анна Ивановна',100,2,'1985-09-15',2);
INSERT INTO Lab3.dbo.Сотрудники(EmployeeFIO,Salary,Demartment,BirhDay,CityID)
VALUES('Иванова Мария Ивановна',300,3,'1986-07-11',2);
INSERT INTO Lab3.dbo.Сотрудники(EmployeeFIO,Salary,Demartment,BirhDay,CityID)
VALUES('Иванов Андрей Александрович',100,1,'1985-07-11',1);
INSERT INTO Lab3.dbo.Сотрудники(EmployeeFIO,Salary,Demartment,BirhDay,CityID)
VALUES('Иванова Галина Александровна',451,2,'2000-07-11',2);
INSERT INTO Lab3.dbo.Сотрудники(EmployeeFIO,Salary,Demartment,BirhDay,CityID)
VALUES('Иванов Давид Иванович',250,3,'1995-11-14',1);
INSERT INTO Lab3.dbo.Сотрудники(EmployeeFIO,Salary,Demartment,BirhDay,CityID)
VALUES('Иванова Лариса Александровна',500,3,'2000-07-11',2);

UPDATE Lab3.dbo.Сотрудники SET Demartment = 1 
	WHERE Demartment = 3 AND Salary < 300;
UPDATE Lab3.dbo.Сотрудники SET Demartment = 2 
	WHERE Demartment = 3 AND Salary > 450;
UPDATE Lab3.dbo.Сотрудники SET Salary = Salary + 100 
	WHERE Demartment = 1 AND YEAR(BirhDay) = 1985;
DELETE FROM Lab3.dbo.Сотрудники 
	WHERE Demartment = 1 AND Salary > 450;
TRUNCATE TABLE Lab3.dbo.Сотрудники;