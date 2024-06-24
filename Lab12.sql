use Boreas3;

Select * Into �������_1 From �������; 
--DML
Go
Create or Alter Trigger UniaueCodeofClient
On �������_1
Instead of Insert
As
	Declare @client nvarchar(30)
	Set @client = (Select inserted.���������� From inserted)
	If ( Exists (Select * From �������_1 Where ���������� = @client))
		begin
			Select '���� �� ���������'
			Select @client
			Rollback Tran;
	end
	Else
		Begin
			Select '���� ���������'
		End
Go

GO
Create or Alter Trigger NonItalytrigger
On �������_1
Instead of Delete
As
	Declare @Country nvarchar(50)
	Set @Country = (Select deleted.������ From deleted)
	if @Country = N'������'
		begin
			select '������ ������,������� ����������� ';
			Select @Country
			Rollback Tran;
		end
	Else
		begin
			Select '������ �� ������';
		end
GO

Go
Create or Alter Trigger NonMainManagerTrigger
On �������_1
instead of Update
As
	Declare @��������� nvarchar(50);
	Set @��������� = (Select ��������� From deleted)
if @��������� = N'������� ��������'
		begin
			Select '������� ��������, ������� ����������� ';
			Rollback Tran;
		end
Go

Go
Insert Into �������_1
Values('1asd','Trigger','Lab12','���������','ul. Filtrowa 68',
'�������',null,'51100','������','(26) 642-7012','(26) 642-7012');
Delete From �������_1 Where ���������� = N'NewLa';
Insert Into �������_1
Values('NewLa','Trigger','Lab12','������� ��������','ul. Filtrowa 68','�������',null,'51100','������','(26) 642-7012','(26) 642-7012');
Update �������_1 Set ����������� = 'Lab12', ��������� = '���������' Where ���������� = 'NewLa'
GO

--DDL

Go
Create Or Alter Trigger Createorupdate1
On DATABASE
For Create_Table,Alter_Table
As
	Select '�������� ��� ��������� ������� ������'
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
	Print '�������� ��������'
	Rollback Tran;
end
Go

GO
Drop Trigger NonMainManagerTrigger;
GO