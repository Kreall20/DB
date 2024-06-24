USE Lab4;

--5.1
SELECT  од—ырь€,Ќаим—ырь€ FROM —ырье
	WHERE —ырье. од—ырь€ = any
	(SELECT  од—ырь€ FROM —клад)
	ORDER BY  од—ырь€;

	SELECT  од—ырь€ 
		FROM —ырье
			WHERE  од—ырь€  IN
			(SELECT  од—ырь€ FROM —клад WHERE  —ырье. од—ырь€ = —клад. од—ырь€)
			ORDER BY   од—ырь€;


	SELECT —ырье. од—ырь€,—ырье.Ќаим—ырь€,—клад. од—ырь€
		FROM —ырье
			LEFT OUTER JOIN —клад ON —ырье. од—ырь€ = —клад. од—ырь€
				WHERE —клад. од—ырь€ IS NOT NULL
			GROUP BY —ырье. од—ырь€,—ырье.Ќаим—ырь€,—клад. од—ырь€
		ORDER BY —ырье. од—ырь€;
--5.2

SELECT  од—ырь€,Ќаим—ырь€ FROM —ырье
	WHERE —ырье. од—ырь€ != all
	(SELECT  од—ырь€ FROM —клад)
	ORDER BY  од—ырь€;


	SELECT  од—ырь€ 
		FROM —ырье
			WHERE  од—ырь€ NOT IN
			(SELECT  од—ырь€ FROM —клад WHERE  —ырье. од—ырь€ = —клад. од—ырь€)
			ORDER BY   од—ырь€;


	SELECT —ырье. од—ырь€,—ырье.Ќаим—ырь€,—клад. од—ырь€
		FROM —ырье
			LEFT OUTER JOIN —клад ON —ырье. од—ырь€ = —клад. од—ырь€
				WHERE —клад. од—ырь€ IS NULL
			GROUP BY —ырье. од—ырь€,—ырье.Ќаим—ырь€,—клад. од—ырь€
		ORDER BY —ырье. од—ырь€;
--5.3
SELECT —ырье.Ќаим—ырь€,—ырье. од“ипа—ырь€,—ырье. од≈д»зм,MAX(—клад.÷ена) AS макс_цена,ROUND(AVG(—клад.÷ена),2) AS ср_цена
	FROM [—клад] INNER JOIN —ырье ON —ырье. од—ырь€  = —клад. од—ырь€
		GROUP BY WITH ROLLUP(—ырье);
		ORDER BY  од“ипа—ырь€, од≈д»зм;

		SELECT —ырье.Ќаим—ырь€,—ырье. од“ипа—ырь€,—ырье. од≈д»зм,MAX(—клад.÷ена) AS макс_цена,ROUND(AVG(—клад.÷ена),2) AS ср_цена
		FROM [—клад] INNER JOIN —ырье ON —ырье. од—ырь€  = —клад. од—ырь€
		GROUP BY GROUPING SETS( од“ипа—ырь€, од≈д»зм,—ырье.Ќаим—ырь€);
		--ORDER BY  од“ипа—ырь€, од≈д»зм;
--5.4

SELECT  од—ырь€,ROUND(SUM( оличество*÷ена),2) AS ќбъем
	FROM [—клад]
		WHERE  од—клада = 1 AND YEAR(ƒатадвижени€) = 2002
			GROUP BY  од—ырь€ WITH ROLLUP
				ORDER BY  од—ырь€;

SELECT  од—ырь€,ROUND(SUM( оличество*÷ена),2) AS ќбъем
	FROM [—клад]
		WHERE  од—клада = 1 AND YEAR(ƒатадвижени€) = 2002
			GROUP BY  од—ырь€ WITH CUBE
				ORDER BY  од—ырь€;
