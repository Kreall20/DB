use Boreas3;

Select * Into Клиенты_1 From Клиенты; 
--DML
Go
Create or Alter Trigger UniaueCodeofClient
On Клиенты_1
Instead of Insert
As
	Declare @client nvarchar(30)
	Set @client = (Select inserted.КодКлиента From inserted)
	If ( Exists (Select * From Клиенты_1 Where КодКлиента = @client))
		begin
			Select 'Поле не уникально'
			Select @client
			Rollback Tran;
	end
	Else
		Begin
			Select 'Поле уникально'
		End
Go

GO
Create or Alter Trigger NonItalytrigger
On Клиенты_1
Instead of Delete
As
	Declare @Country nvarchar(50)
	Set @Country = (Select deleted.Страна From deleted)
	if @Country = N'Италия'
		begin
			select 'Старна Италия,триггер завершается ';
			Select @Country
			Rollback Tran;
		end
	Else
		begin
			Select 'Страна не Италия';
		end
GO

Go
Create or Alter Trigger NonMainManagerTrigger
On Клиенты_1
instead of Update
As
	Declare @должность nvarchar(50);
	Set @должность = (Select Должность From deleted)
if @должность = N'Главный менеджер'
		begin
			Select 'Главный менеджер, триггер завершается ';
			Rollback Tran;
		end
Go

Go
Insert Into Клиенты_1
Values('1asd','Trigger','Lab12','Бухгалтер','ul. Filtrowa 68',
'Варшава',null,'51100','Италия','(26) 642-7012','(26) 642-7012');
Delete From Клиенты_1 Where КодКлиента = N'NewLa';
Insert Into Клиенты_1
Values('NewLa','Trigger','Lab12','Главный менеджер','ul. Filtrowa 68','Варшава',null,'51100','Италия','(26) 642-7012','(26) 642-7012');
Update Клиенты_1 Set ОбращатьсяК = 'Lab12', Должность = 'Бухгалтер' Where КодКлиента = 'NewLa'
GO

--DDL

Go
Create Or Alter Trigger Createorupdate1
On DATABASE
For Create_Table,Alter_Table
As
	Select 'Изменять или создавать таблицы нельзя'
	Rollback Tran;
Go

Go
	Create Table Lab12DeleteTrigger(
		Name nvarchar(100)
	);
Go

Create or Alter Trigger DeleteTrigger1
On DATABASE
For Drop_Trigger
As
begin
	Print 'Удаление триггера'
	Rollback Tran;
end
Go

GO
Drop Trigger NonMainManagerTrigger;
GO