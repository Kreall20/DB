Use Lab4;

GO
--9.1a 9.1b
If Object_id(N'dbo.—ырье1', N'U') Is Null
	Print '“акой таблицы нет';
Else
	Drop Table —ырье1;

--9.1c
Select * Into —ырье1 From —ырье;

--9.1d
Select —ырье1.Ќаим—ырь€ AS —ырье, “ипы_сырь€.Ќаим“ипа—ырь€ AS “ип From —ырье1
	Inner Join “ипы_сырь€ On “ипы_сырь€. од“ипа—ырь€ = —ырье1. од“ипа—ырь€ Where “ипы_сырь€.Ќаим“ипа—ырь€ = N'ѕосуда' or “ипы_сырь€.Ќаим“ипа—ырь€ = N'ѕрочие'

--9.1e
Update —ырье1 Set  од“ипа—ырь€ = 10
	Where  од“ипа—ырь€ = 11;

--9.1f
Select —ырье1.Ќаим—ырь€ AS —ырье, “ипы_сырь€.Ќаим“ипа—ырь€ AS “ип From —ырье1
	Inner Join “ипы_сырь€ On “ипы_сырь€. од“ипа—ырь€ = —ырье1. од“ипа—ырь€ where “ипы_сырь€.Ќаим“ипа—ырь€ = N'ѕосуда' or “ипы_сырь€.Ќаим“ипа—ырь€ = N'ѕрочие'

GO


GO
Use Lab4;
--9.2a 9.2b
If Object_id(N'dbo.—ырье1', N'U') Is Null
	Print '“акой таблицы нет';
Else
	Drop Table —ырье1;

--9.2c
Select * Into —ырье1 From —ырье;

/*Insert Into —ырье1
	Select * From —ырье;*/

--9.2d

	Declare @avgprod float
	Select @avgprod = AVG(÷ена—ырь€)
		From —ырье1
		Inner Join “ипы_сырь€ On “ипы_сырь€. од“ипа—ырь€ = —ырье1. од“ипа—ырь€ And  “ипы_сырь€.Ќаим“ипа—ырь€ = N'ѕродукты';

	Select Round(@avgprod,2) As —р_цена_продуктов;

	Declare @avgbef float
	Select @avgbef = AVG(÷ена—ырь€)
		From —ырье1
		Inner Join “ипы_сырь€ On “ипы_сырь€. од“ипа—ырь€ = —ырье1. од“ипа—ырь€ And  “ипы_сырь€.Ќаим“ипа—ырь€ = N'Ќапитки';

	Select Round(@avgbef,2) As —р_цена_напитков;

	Declare @i int,@flag int
	Set @i = 0
	If(@avgprod > @avgbef)
		Begin
			Print('—р.цена напитков меньше');
			While(@avgprod > @avgbef)
				Begin
					Set @avgprod -= @avgprod * 0.2
					Set @i +=1
					Set @flag = 0
				End
		End
	If(@avgprod < @avgbef)
		Begin
			Print('—р.цена напитков больше');
			While(@avgprod < @avgbef)
				Begin
					Set @avgbef -= @avgbef * 0.2
					Print(@avgprod);
					Set @i +=1
					Set @flag = 1
				End
		End
		
	Select @avgbef,@avgprod, @i;
Go	