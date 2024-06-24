CREATE TABLE Lab3.dbo.������
(
	CountryID int PRIMARY KEY IDENTITY(1, 1),
	CountryName nvarchar(30) NOT NULL

);
CREATE TABLE Lab3.dbo.������
(
	CityID int PRIMARY KEY IDENTITY(1,1),
	CityName nvarchar(30) NOT NULL,
	CountryID int NOT NULL  FOREIGN KEY REFERENCES Lab3.dbo.������(CountryID)
	ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT UQ_������_CityName_CountryID UNIQUE(CityName, CountryID)
);

CREATE TABLE Lab3.dbo.����������
(
	EmployeeID int PRIMARY KEY IDENTITY(1,1),
	EmployeeFIO nvarchar(150) NOT NULL,
	BirhDay date NOT NULL,
	Demartment int NOT NULL,
	Salary real NOT NULL,
	CityID int NOT NULL FOREIGN KEY REFERENCES Lab3.dbo.������(CityID)
	ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO Lab3.dbo.������(CountryName)
VALUES ('Russia');
INSERT INTO Lab3.dbo.������(CityName,CountryID)
VALUES ('Moscow',1);
INSERT INTO Lab3.dbo.������(CityName,CountryID)
VALUES ('Peter',1);

INSERT INTO Lab3.dbo.����������(EmployeeFIO,Salary,Demartment,BirhDay,CityID)
VALUES('������ ���� ��������',300,1,'1992-11-14',1);
INSERT INTO Lab3.dbo.����������(EmployeeFIO,Salary,Demartment,BirhDay,CityID)
VALUES('������ ����� ��������',450,2,'1985-11-14',1);
INSERT INTO Lab3.dbo.����������(EmployeeFIO,Salary,Demartment,BirhDay,CityID)
VALUES('������� ���� ��������',100,2,'1985-09-15',2);
INSERT INTO Lab3.dbo.����������(EmployeeFIO,Salary,Demartment,BirhDay,CityID)
VALUES('������� ����� ��������',300,3,'1986-07-11',2);
INSERT INTO Lab3.dbo.����������(EmployeeFIO,Salary,Demartment,BirhDay,CityID)
VALUES('������ ������ �������������',100,1,'1985-07-11',1);
INSERT INTO Lab3.dbo.����������(EmployeeFIO,Salary,Demartment,BirhDay,CityID)
VALUES('������� ������ �������������',451,2,'2000-07-11',2);
INSERT INTO Lab3.dbo.����������(EmployeeFIO,Salary,Demartment,BirhDay,CityID)
VALUES('������ ����� ��������',250,3,'1995-11-14',1);
INSERT INTO Lab3.dbo.����������(EmployeeFIO,Salary,Demartment,BirhDay,CityID)
VALUES('������� ������ �������������',500,3,'2000-07-11',2);

UPDATE Lab3.dbo.���������� SET Demartment = 1 
	WHERE Demartment = 3 AND Salary < 300;
UPDATE Lab3.dbo.���������� SET Demartment = 2 
	WHERE Demartment = 3 AND Salary > 450;
UPDATE Lab3.dbo.���������� SET Salary = Salary + 100 
	WHERE Demartment = 1 AND YEAR(BirhDay) = 1985;
DELETE FROM Lab3.dbo.���������� 
	WHERE Demartment = 1 AND Salary > 450;
TRUNCATE TABLE Lab3.dbo.����������;