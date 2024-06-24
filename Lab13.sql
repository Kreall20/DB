Use [���������� �������];


Select ����������.�������,������.������,�������.�������,���������.���������
From ����������
Inner Join ������ On ������.��������� = ����������.������
Inner Join ������� On �������.����������� = ����������.����������
Inner Join ��������� On ���������.������������ = ����������.���������
Where �������.������� = N'������';

Go
Create or Alter Function ����������(@������ nvarchar(10) = '��� 2-20')
Returns Table
	Return
		Select ����������.�������,�������������1.�������������,���������.����������,����������.����,����������.����������,�������.�������,���������.���������
		From ����������
		Inner Join ������ On ������.��������� = ����������.������
		Inner Join ������� On �������.����������� = ����������.����������
		Inner Join ��������� On ���������.������������ = ����������.���������
		Inner Join �������������1 On �������������1.���������������� = ����������.�������������
		Inner Join ��������� On ���������.������������ = ����������.����������
		Inner Join ���������� On ����������.������������� = ����������.����������
		Where ������.������ = @������
Go

Select * From ����������('��� 1-20')
Order by ����������

Go
Create or Alter Function �����������������(@������������� nvarchar(80) = '��������� �.�.')
Returns Table
	Return
		Select ����������.�������,�������������1.�������������,���������.����������,������.������,�������.�������,���������.���������
		From ����������
		Inner Join ������ On ������.��������� = ����������.������
		Inner Join ������� On �������.����������� = ����������.����������
		Inner Join ��������� On ���������.������������ = ����������.���������
		Inner Join ��������� On ���������.������������ = ����������.����������
		Inner Join �������������1 On �������������1.���������������� = ����������.�������������
		Where �������������1.������������� = @�������������
Go

Select * From �����������������('������� �.�.')
Order by ����������


Go
Create or ALter Trigger DeleteTable
On DataBase
For Drop_Table
As
Begin
	Select '������� ������� ������'
	Rollback Tran;
End
Go

Go
Create or Alter Trigger �������������������������
On �������������1
Instead of Insert
As
	Declare @������������� nvarchar(30)
	Set @������������� = (Select inserted.������������� From inserted)
	If ( Exists (Select * From �������������1 Where ������������� = @�������������))
		begin
			Select '���� �� ���������'
			Select @�������������
			Rollback Tran;
	end
	Else
		Begin
			Select '���� ���������'
			Insert Into �������������1(�������������,������������)
			Select
			inserted.�������������,
			inserted.������������
			From inserted
		End
Go

Select * From �������������1
Insert Into �������������1(�������������,������������)
Values('������� �.�.','20.02.1960')

Go
Create or Alter Trigger ����������������������������
On ����������
Instead of Insert
As
	Declare @������ nvarchar(20)
	Declare @�������� nvarchar(20)
	Declare @������� int
	Set @������� = (Select inserted.������� From inserted)
	Set @�������� = (Select inserted.�������� From inserted)
	Set @������ = 
		(
			Select Top 1 ��������������.������ 
			From ��������������
			Inner Join ���������� On ����������.�������� = ��������������.�����������
			Where ����������� = @��������
		)
	Declare @count int
	Set @count = 
		(
			Select Count(*) 
			From ����������
			Inner Join �������������� On ��������������.����������� = ����������.��������
			Where ����������.������� = @������� And ��������������.������ = @������ Or ��������������.������ = '������'
		)
	If(@count >= 30)
		Begin
			Select '���������� ��� � ������ ������ ��� �����'
			Rollback Tran
		end
	Else
		Begin
			Select '���������� ��� �� ������ ��� �����'
			Insert Into ����������
			Select
			inserted.�������,
			inserted.�������������,
			inserted.����������,
			inserted.��������,
			inserted.����,
			inserted.������,
			inserted.����������,
			inserted.����������,
			inserted.���������
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
Create or Alter Procedure ������������������
	@count int Output
As
	IF NOT EXISTS(SELECT 1 FROM ���������� WHERE ���� = @date)
	BEGIN
		Select '����� ���� � ���������� ���'
		RETURN 1
	END
	ELSE
		Select @count = Count(����) 
		From ����������
		Where ���� = @date

			Select �������������1.,������.������,�������.�������,���������.���������
			From ����������
			Inner Join ������ On ������.��������� = ����������.������
			Inner Join ������� On �������.����������� = ����������.����������
			Inner Join ��������� On ���������.������������ = ����������.���������
			Where ���� = @date

		Return 0;
Go

Declare @count int,@error int
Declare @date smalldatetime = '16-01-2023';
Exec @error = ������������������� @date,@count Output
Select @error as ���_������,@count as �������������,@date

