CREATE INDEX IX_DepNUmber_EMPLOYEEFIO 
	ON Lab3.dbo.Сотрудники(Demartment,EmployeeFIO);

CREATE UNIQUE INDEX IXUQ_countryName
	ON Lab3.dbo.Страны(CountryName);

CREATE UNIQUE INDEX IXUQ_CityName_CountryId
	ON Lab3.dbo.Города(CityName,CountryID);

DROP INDEX Сотрудники.IXUQ_DepNUmber_EMPLOYEEFIO;