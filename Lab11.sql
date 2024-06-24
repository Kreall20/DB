Use Lab4;

Go
Create or Alter Function MaxОбъем1(@month int = 7,@year int = 2002)
RETURNS real
AS
BEGIN
	Return
	(SELECT TOP 1 SUM(Склад.Количество * Склад.Цена) FROM Склад
		INNER JOIN Поставщики ON Склад.КодПоставщика = Поставщики.КодПоставщика
		WHERE Month(Склад.Датадвижения) = @month And Year(Склад.Датадвижения) = @year 
		And Склад.ПризнакДвижения = N'Поступление'
		GROUP BY Поставщики.КодПоставщика
		ORDER BY SUM(Склад.Количество * Склад.Цена) Desc)
End
Go


Go
Create or Alter Function Max2(@month int = 8,@year int = 2002)
Returns nvarchar(100)
As
Begin
	RETURN 
	(SELECT TOP 1 Поставщики.НаимПоставщика FROM Склад
		INNER JOIN Поставщики ON Склад.КодПоставщика = Поставщики.КодПоставщика
		WHERE Month(Склад.Датадвижения) = @month And Year(Склад.Датадвижения) = @year 
		And Склад.ПризнакДвижения = N'Поступление'
		GROUP BY Поставщики.НаимПоставщика
		ORDER BY SUM(Склад.Количество * Склад.Цена) Desc )
End
GO

Go
Create or Alter Function Max3(@month int = 7,@year int = 2002,@ТипСырья nvarchar(30) = 'Напитки',@sum real = 2000 )
RETURNS Table
As
Return
	Select Поставщики.КодПоставщика,Поставщики.НаимПоставщика as Поставщик,Round(Sum(Склад.Цена * Склад.Количество),2) As Объем
	From Склад
	Inner Join Поставщики On Поставщики.КодПоставщика = Склад.КодПоставщика
	Inner Join Сырье On Сырье.КодСырья = Склад.КодСырья
	Inner Join Типы_сырья On Типы_сырья.КодТипаСырья = Сырье.КодТипаСырья
	Where Month(Склад.Датадвижения) = @month And Year(Склад.Датадвижения) = @year 
	And Склад.ПризнакДвижения = N'Поступление' And Типы_сырья.НаимТипаСырья = @ТипСырья
	Group By Поставщики.КодПоставщика,Поставщики.НаимПоставщика
	Having Sum(Склад.Цена * Склад.Количество) >= @sum
Go


Go
Use Lab4;
Select dbo.MaxОбъем1(7,2002)

Select dbo.Max2(7,2002)

Select * From Max3(7,2002,'Продукты',2000)
Order by Max3.Поставщик


Go