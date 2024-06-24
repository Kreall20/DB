Use Boreas3;

Go

--10.1
Create Procedure ProductsCostByType
@typeName nvarchar(40) = N'�������'
As
	IF NOT EXISTS(SELECT 1 FROM ���� WHERE ��������� = @typeName)
BEGIN
	PRINT '������ ��������� ������� �� ����������'
	RETURN 1
END
ELSE
	Select ������.�����,������.����,������.��������,����.���������
	From ������
		Inner Join ���� On ����.������� = ������.������� And ����.��������� = @typeName
		Order By ������.�����
		RETURN 0
Go
--10.2
GO
Create Procedure Lab10_2
@percent real = 20,
@Name nvarchar(40) = N'�����',
@dt1 smalldatetime = '01-01-1994', 
@dt2 smalldatetime = '01-03-1994',
@count int Output
AS
If Object_id(N'dbo.������1', N'U') Is Not Null
	Drop Table ������1;

Select * Into ������1 From ������;

IF NOT EXISTS(SELECT 1 FROM ��������
	Where ��������.�������� = @Name)
BEGIN
	PRINT '������ ��������� ���'
	RETURN 1
END
ELSE

Update ������1 Set ����������������� = �����������������*@percent/100
From ������1
Inner Join �������� On ��������.����������� = ������1.��������
Where ��������.�������� = @Name And ������1.�������������� > @dt1 And ������1.�������������� < @dt2

Select ������1.���������,ROUND(������1.�����������������,2) As ���������,Convert(nvarchar(12),������1.��������������,104)
From ������1
Inner Join �������� On ��������.����������� = ������1.��������
Where ��������.�������� = @Name And ������1.�������������� > @dt1 And ������1.�������������� < @dt2

Set @count = 
(Select Count(*)
From ������1
Inner Join �������� On ��������.����������� = ������1.��������
Where ��������.�������� = @Name And ������1.�������������� > @dt1 And ������1.�������������� < @dt2)

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
IF NOT EXISTS(SELECT 1 FROM �������
	Where �������.���������� = @Name)
BEGIN
	PRINT '������� ������� ���'
	RETURN 1
END
ELSE

Select ������.���������,������.�����,������.��������������,Round(��������.����-(��������.����*��������.������),2)
From ������
Inner Join �������� On ��������.��������� = ������.���������
Inner Join ������ On ������.��������� = ��������.���������
Inner Join ������� On �������.������_Id = ������.������_ID
Where �������.���������� = @Name And ������.�������������� > @dt1 And ������.�������������� < @dt2

Set @sum = (Select Sum(��������.����) AS �����
From ��������
Inner Join ������ On ��������.��������� = ������.���������
Inner Join ������� On �������.������_Id = ������.������_ID
Where �������.���������� = @Name And ������.�������������� > @dt1 And ������.�������������� < @dt2)

Return 0
Go

--10.1
Go
	Declare @errorCode int
	EXEC @errorCode = ProductsCostByType N'��������'
	Select Case
	When @errorCode = 1 Then '������� ������ ���������� ���'
	End
	Declare @errorCode1 int
	EXEC @errorCode1 = ProductsCostByType N'NoType'
	Select Case
	When @errorCode1 = 1 Then '������� ������ ���������� ���'
	End
	Declare @errorcode3 int
	Exec @errorCode3 = ProductsCostByType Default
GO

--10.2
Go
	Declare @count int,@code int
	Exec @code = Lab10_2 20,N'�����','1993-07-01','1994-07-01',@count OUTPUT
	Select @count
Go


--10.3
Go
	Declare @sum real,@code int
	Exec @code = Lab10_3 N'ANATR','1993-07-01','1994-07-01',@sum OUTPUT
	Select @sum
Go