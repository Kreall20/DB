Use [Расписание занятий];


Select Расписание.Семестр,Группы.Группа,ВидыПар.ВидПары,Аудитории.Аудитория
From Расписание
Inner Join Группы On Группы.КодГруппы = Расписание.Группа
Inner Join ВидыПар On ВидыПар.КодВидаПары = Расписание.ВидЗанятия
Inner Join Аудитории On Аудитории.КодАудитории = Расписание.Аудитория
Where ВидыПар.ВидПары = N'Лекция';

Go
Create or Alter Function ПарыГруппы(@группа nvarchar(10) = 'Епи 2-20')
Returns Table
	Return
		Select Расписание.Семестр,Преподаватели1.Преподаватель,ДниНедели.ДеньНедели,Расписание.Пара,Дисциплины.Дисциплина,ВидыПар.ВидПары,Аудитории.Аудитория
		From Расписание
		Inner Join Группы On Группы.КодГруппы = Расписание.Группа
		Inner Join ВидыПар On ВидыПар.КодВидаПары = Расписание.ВидЗанятия
		Inner Join Аудитории On Аудитории.КодАудитории = Расписание.Аудитория
		Inner Join Преподаватели1 On Преподаватели1.КодПреподавателя = Расписание.Преподаватель
		Inner Join ДниНедели On ДниНедели.КодДняНедели = Расписание.ДеньНедели
		Inner Join Дисциплины On Дисциплины.КодДисциплины = Расписание.ДеньНедели
		Where Группы.Группа = @группа
Go

Select * From ПарыГруппы('Епи 1-20')
Order by ДеньНедели

Go
Create or Alter Function ПарыПреподавателя(@Преподаватель nvarchar(80) = 'Турчанова Т.Г.')
Returns Table
	Return
		Select Расписание.Семестр,Преподаватели1.Преподаватель,ДниНедели.ДеньНедели,Группы.Группа,ВидыПар.ВидПары,Аудитории.Аудитория
		From Расписание
		Inner Join Группы On Группы.КодГруппы = Расписание.Группа
		Inner Join ВидыПар On ВидыПар.КодВидаПары = Расписание.ВидЗанятия
		Inner Join Аудитории On Аудитории.КодАудитории = Расписание.Аудитория
		Inner Join ДниНедели On ДниНедели.КодДняНедели = Расписание.ДеньНедели
		Inner Join Преподаватели1 On Преподаватели1.КодПреподавателя = Расписание.Преподаватель
		Where Преподаватели1.Преподаватель = @Преподаватель
Go

Select * From ПарыПреподавателя('Сухинин А.М.')
Order by ДеньНедели


Go
Create or ALter Trigger DeleteTable
On DataBase
For Drop_Table
As
Begin
	Select 'Таблицы удалять нельзя'
	Rollback Tran;
End
Go

Go
Create or Alter Trigger УникальностьПреподавателя
On Преподаватели1
Instead of Insert
As
	Declare @Преподаватель nvarchar(30)
	Set @Преподаватель = (Select inserted.Преподаватель From inserted)
	If ( Exists (Select * From Преподаватели1 Where Преподаватель = @Преподаватель))
		begin
			Select 'Поле не уникально'
			Select @Преподаватель
			Rollback Tran;
	end
	Else
		Begin
			Select 'Поле уникально'
			Insert Into Преподаватели1(Преподаватель,ДатаРождения)
			Select
			inserted.Преподаватель,
			inserted.ДатаРождения
			From inserted
		End
Go

Select * From Преподаватели1
Insert Into Преподаватели1(Преподаватель,ДатаРождения)
Values('Сухинин А.К.','20.02.1960')

Go
Create or Alter Trigger КоличествоПарВнеделюнебольше
On Расписание
Instead of Insert
As
	Declare @Неделя nvarchar(20)
	Declare @Четность nvarchar(20)
	Declare @Семестр int
	Set @Семестр = (Select inserted.Семестр From inserted)
	Set @Четность = (Select inserted.Четность From inserted)
	Set @Неделя = 
		(
			Select Top 1 ЧетностьНедели.Неделя 
			From ЧетностьНедели
			Inner Join Расписание On Расписание.Четность = ЧетностьНедели.КодЧетности
			Where КодЧетности = @Четность
		)
	Declare @count int
	Set @count = 
		(
			Select Count(*) 
			From Расписание
			Inner Join ЧетностьНедели On ЧетностьНедели.КодЧетности = Расписание.Четность
			Where Расписание.Семестр = @Семестр And ЧетностьНедели.Неделя = @Неделя Or ЧетностьНедели.Неделя = 'Всегда'
		)
	If(@count >= 30)
		Begin
			Select 'Количество пар в неделе больше чем нужно'
			Rollback Tran
		end
	Else
		Begin
			Select 'Количество Пар не больше чем нужно'
			Insert Into Расписание
			Select
			inserted.Семестр,
			inserted.Преподаватель,
			inserted.ДеньНедели,
			inserted.Четность,
			inserted.Пара,
			inserted.Группа,
			inserted.Дисциплина,
			inserted.ВидЗанятия,
			inserted.Аудитория
			From inserted
		end
Go

Create Table Lab12DeleteTrigger(
		Name nvarchar(100)
	);

Drop Table Lab12DeleteTrigger;
Disable Trigger DeleteTable On Database;
Enable Trigger DeleteTable On Database;














Go
Create or Alter Procedure КоличествоПарПоДню
	@count int Output
As
	IF NOT EXISTS(SELECT 1 FROM Расписание WHERE Дата = @date)
	BEGIN
		Select 'Такой даты в расписании нет'
		RETURN 1
	END
	ELSE
		Select @count = Count(Дата) 
		From Расписание
		Where Дата = @date

			Select Преподователи1.,Группы.Группа,ВидыПар.ВидПары,Аудитории.Аудитория
			From Расписание
			Inner Join Группы On Группы.КодГруппы = Расписание.Группа
			Inner Join ВидыПар On ВидыПар.КодВидаПары = Расписание.ВидЗанятия
			Inner Join Аудитории On Аудитории.КодАудитории = Расписание.Аудитория
			Where Дата = @date

		Return 0;
Go

Declare @count int,@error int
Declare @date smalldatetime = '16-01-2023';
Exec @error = КоличествоПарПоДате @date,@count Output
Select @error as Код_ошибки,@count as КоличествоПар,@date

