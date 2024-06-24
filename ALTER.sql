ALTER TABLE Lab2.dbo.Сотрудники
	DROP CK_Сотрудники_Salary

ALTER TABLE Lab2.dbo.Сотрудники
	ADD CONSTRAINT CK_Сотрудники_Salary CHECK(Salary >= 200 OR Salary < 500)

INSERT INTO Lab2.dbo.Страны(CountryName)
VALUES ('Russia');
INSERT INTO Lab2.dbo.Города(CityName,CountryID)
VALUES ('Moscow',1);

INSERT INTO Lab2.dbo.Сотрудники(EmployeeFIO,BirhDay,Demartment,Salary,CityID,[Семейное положение])
VALUES ('Иванов Иван Иванович','2002-11-12','1',2000,1,'да');
INSERT INTO Lab2.dbo.Сотрудники(EmployeeFIO,BirhDay,Demartment,Salary,CityID,[Семейное положение])
VALUES ('Иванов Федор Иванович','2002-10-12','2',300,1,'нет');
INSERT INTO Lab2.dbo.Сотрудники(EmployeeFIO,BirhDay,Demartment,Salary,CityID,[Семейное положение])
VALUES ('Иванов Алексей Иванович','2002-09-12','3',400,1,'нет');
INSERT INTO Lab2.dbo.Сотрудники(EmployeeFIO,BirhDay,Demartment,Salary,CityID,[Семейное положение])
VALUES ('Иванов Михаил Иванович','2002-08-12','4',500,1,'да');
INSERT INTO Lab2.dbo.Сотрудники(EmployeeFIO,BirhDay,Demartment,Salary,CityID,[Семейное положение])
VALUES ('Иванов Максим Иванович','2002-07-12','5',250,1,'да');

ALTER TABLE Lab2.dbo.Сотрудники
	ADD CONSTRAINT UQ_EmployeeFIO_BirhDay UNIQUE(EmployeeFIO, BirhDay)

ALTER TABLE Lab2.dbo.Сотрудники
	ADD CONSTRAINT CK_Сотрудники_BirhDay CHECK(YEAR(GETDATE()) - YEAR(BirhDay) > 19)