CREATE TABLE Lab2.dbo.Страны
(
	CountryID int PRIMARY KEY IDENTITY(1, 1),
	CountryName nvarchar(30) NOT NULL

);
CREATE TABLE Lab2.dbo.Города
(
	CityID int PRIMARY KEY IDENTITY(1,1),
	CityName nvarchar(30) NOT NULL,
	CountryID int NOT NULL  FOREIGN KEY REFERENCES Lab2.dbo.Страны(CountryID)
	ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT UQ_Города_CityName_CountryID UNIQUE(CityName, CountryID)
);
CREATE TABLE Lab2.dbo.Сотрудники
(
	EmployeeID int PRIMARY KEY IDENTITY(1,1),
	EmployeeFIO nvarchar(150) NOT NULL,
	BirhDay date NOT NULL,
	Demartment nvarchar(80) NOT NULL,
	Salary real NOT NULL CHECK(Salary >= 200),
	CityID int NOT NULL FOREIGN KEY REFERENCES Lab2.dbo.Города(CityID)
	ON DELETE CASCADE ON UPDATE CASCADE
);
ALTER TABLE Lab2.dbo.Сотрудники
	ADD [Семейное положение] nvarchar(3) NOT NULL CHECK(LOWER([Семейное положение]) = 'да' OR LOWER([Семейное положение]) = 'нет')
