USE Lab4

--1.2

ALTER TABLE dbo.≈д_изм ADD PRIMARY KEY( од≈д»зм);

ALTER TABLE dbo.ѕокупатели ADD PRIMARY KEY( одѕокупател€);

ALTER TABLE dbo.ѕоставщики ADD PRIMARY KEY( одѕокупател€);

ALTER TABLE dbo.ѕоставщики ADD PRIMARY KEY( одѕоставщика);

ALTER TABLE dbo.—клад ADD PRIMARY KEY( одƒвижени€);

ALTER TABLE dbo.—писок_складов ADD PRIMARY KEY( од—клада);

ALTER TABLE dbo.—ырье ADD PRIMARY KEY( од—ырь€);

ALTER TABLE dbo.“ипы_потребителей ADD PRIMARY KEY( од“ипаѕотреб);

ALTER TABLE dbo.“ипы_—ырь€ ADD PRIMARY KEY( од“ипа—ырь€);

--2.1
--USE Lab4
SELECT TOP 10 Ќаим—ырь€ Name,Price = ÷ена—ырь€
	FROM [—ырье]
		WHERE  од“ипа—ырь€ = 9
			ORDER BY ÷ена—ырь€ DESC;

--2.2A

SELECT Ќаим—ырь€,÷ена—ырь€, од≈д»зм
	FROM [—ырье]
		WHERE ÷ена—ырь€ > ALL
			(SELECT ÷ена—ырь€
				FROM [—ырье]
					WHERE  од≈д»зм = 3)
						ORDER BY Ќаим—ырь€;

--2.2B

SELECT Ќаим—ырь€,÷ена—ырь€, од≈д»зм
	FROM [—ырье]
		WHERE ÷ена—ырь€ > ANY
			(SELECT ÷ена—ырь€
				FROM [—ырье]
					WHERE  од≈д»зм = 3)
						ORDER BY Ќаим—ырь€;

--2.3

SELECT COUNT(Ќаим—ырь€) AS  оличество_Ќапитков_бутылка
	FROM [—ырье]
		WHERE  од“ипа—ырь€ = 9 AND  од≈д»зм = 5;

--2.4

SELECT MAX(÷ена—ырь€) AS ћаксимальна€_цена_сырь€, AVG(÷ена—ырь€) AS —редн€€_цена_сырь€
	FROM [—ырье]
		WHERE  од≈д»зм = 1;