ALTER TABLE Lab2.dbo.����������
	DROP CK_����������_Salary

ALTER TABLE Lab2.dbo.����������
	ADD CONSTRAINT CK_����������_Salary CHECK(Salary >= 200 OR Salary < 500)

INSERT INTO Lab2.dbo.������(CountryName)
VALUES ('Russia');
INSERT INTO Lab2.dbo.������(CityName,CountryID)
VALUES ('Moscow',1);

INSERT INTO Lab2.dbo.����������(EmployeeFIO,BirhDay,Demartment,Salary,CityID,[�������� ���������])
VALUES ('������ ���� ��������','2002-11-12','1',2000,1,'��');
INSERT INTO Lab2.dbo.����������(EmployeeFIO,BirhDay,Demartment,Salary,CityID,[�������� ���������])
VALUES ('������ ����� ��������','2002-10-12','2',300,1,'���');
INSERT INTO Lab2.dbo.����������(EmployeeFIO,BirhDay,Demartment,Salary,CityID,[�������� ���������])
VALUES ('������ ������� ��������','2002-09-12','3',400,1,'���');
INSERT INTO Lab2.dbo.����������(EmployeeFIO,BirhDay,Demartment,Salary,CityID,[�������� ���������])
VALUES ('������ ������ ��������','2002-08-12','4',500,1,'��');
INSERT INTO Lab2.dbo.����������(EmployeeFIO,BirhDay,Demartment,Salary,CityID,[�������� ���������])
VALUES ('������ ������ ��������','2002-07-12','5',250,1,'��');

ALTER TABLE Lab2.dbo.����������
	ADD CONSTRAINT UQ_EmployeeFIO_BirhDay UNIQUE(EmployeeFIO, BirhDay)

ALTER TABLE Lab2.dbo.����������
	ADD CONSTRAINT CK_����������_BirhDay CHECK(YEAR(GETDATE()) - YEAR(BirhDay) > 19)