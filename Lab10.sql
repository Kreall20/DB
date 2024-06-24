Use Boreas3;

Go

--10.1
Create Procedure ProductsCostByType
@typeName nvarchar(40) = N'Напитки'
As
	IF NOT EXISTS(SELECT 1 FROM Типы WHERE Категория = @typeName)
BEGIN
	PRINT 'Данной категории товаров не существует'
	RETURN 1
END
ELSE
	Select Товары.Марка,Товары.Цена,Товары.НаСкладе,Типы.Категория
	From Товары
		Inner Join Типы On Типы.КодТипа = Товары.КодТипа And Типы.Категория = @typeName
		Order By Товары.Марка
		RETURN 0
Go
--10.2
GO
Create Procedure Lab10_2
@percent real = 20,
@Name nvarchar(40) = N'Почта',
@dt1 smalldatetime = '01-01-1994', 
@dt2 smalldatetime = '01-03-1994',
@count int Output
AS
If Object_id(N'dbo.Заказы1', N'U') Is Not Null
	Drop Table Заказы1;

Select * Into Заказы1 From Заказы;

IF NOT EXISTS(SELECT 1 FROM Доставка
	Where Доставка.Название = @Name)
BEGIN
	PRINT 'Данной Категории нет'
	RETURN 1
END
ELSE

Update Заказы1 Set СтоимостьДоставки = СтоимостьДоставки*@percent/100
From Заказы1
Inner Join Доставка On Доставка.КодДоставки = Заказы1.Доставка
Where Доставка.Название = @Name And Заказы1.ДатаИсполнения > @dt1 And Заказы1.ДатаИсполнения < @dt2

Select Заказы1.КодЗаказа,ROUND(Заказы1.СтоимостьДоставки,2) As Стоимость,Convert(nvarchar(12),Заказы1.ДатаИсполнения,104)
From Заказы1
Inner Join Доставка On Доставка.КодДоставки = Заказы1.Доставка
Where Доставка.Название = @Name And Заказы1.ДатаИсполнения > @dt1 And Заказы1.ДатаИсполнения < @dt2

Set @count = 
(Select Count(*)
From Заказы1
Inner Join Доставка On Доставка.КодДоставки = Заказы1.Доставка
Where Доставка.Название = @Name And Заказы1.ДатаИсполнения > @dt1 And Заказы1.ДатаИсполнения < @dt2)

Set @count = @@ROWCOUNT
Return 0
Go
--10.3
Go
Create Procedure Lab10_3
@Name nvarchar(40) = N'ANATR',
@dt1 smalldatetime = '01-01-1994', 
@dt2 smalldatetime = '01-03-1994',
@sum real Output
As
IF NOT EXISTS(SELECT 1 FROM Клиенты
	Where Клиенты.КодКлиента = @Name)
BEGIN
	PRINT 'Данного клиента нет'
	RETURN 1
END
ELSE

Select Заказы.КодЗаказа,Товары.Марка,Заказы.ДатаИсполнения,Round(Заказано.Цена-(Заказано.Цена*Заказано.Скидка),2)
From Заказы
Inner Join Заказано On Заказано.КодЗаказа = Заказы.КодЗаказа
Inner Join Товары On Товары.КодТовара = Заказано.КодТовара
Inner Join Клиенты On Клиенты.Клиент_Id = Заказы.Клиент_ID
Where Клиенты.КодКлиента = @Name And Заказы.ДатаИсполнения > @dt1 And Заказы.ДатаИсполнения < @dt2

Set @sum = (Select Sum(Заказано.Цена) AS Объем
From Заказано
Inner Join Заказы On Заказано.КодЗаказа = Заказы.КодЗаказа
Inner Join Клиенты On Клиенты.Клиент_Id = Заказы.Клиент_ID
Where Клиенты.КодКлиента = @Name And Заказы.ДатаИсполнения > @dt1 And Заказы.ДатаИсполнения < @dt2)

Return 0
Go

--10.1
Go
	Declare @errorCode int
	EXEC @errorCode = ProductsCostByType N'Приправы'
	Select Case
	When @errorCode = 1 Then 'Товаров данной катергории нет'
	End
	Declare @errorCode1 int
	EXEC @errorCode1 = ProductsCostByType N'NoType'
	Select Case
	When @errorCode1 = 1 Then 'Товаров данной катергории нет'
	End
	Declare @errorcode3 int
	Exec @errorCode3 = ProductsCostByType Default
GO

--10.2
Go
	Declare @count int,@code int
	Exec @code = Lab10_2 20,N'Почта','1993-07-01','1994-07-01',@count OUTPUT
	Select @count
Go


--10.3
Go
	Declare @sum real,@code int
	Exec @code = Lab10_3 N'ANATR','1993-07-01','1994-07-01',@sum OUTPUT
	Select @sum
Go