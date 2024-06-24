Use Lab4;

Go
Create or Alter Function Max�����1(@month int = 7,@year int = 2002)
RETURNS real
AS
BEGIN
	Return
	(SELECT TOP 1 SUM(�����.���������� * �����.����) FROM �����
		INNER JOIN ���������� ON �����.������������� = ����������.�������������
		WHERE Month(�����.������������) = @month And Year(�����.������������) = @year 
		And �����.��������������� = N'�����������'
		GROUP BY ����������.�������������
		ORDER BY SUM(�����.���������� * �����.����) Desc)
End
Go


Go
Create or Alter Function Max2(@month int = 8,@year int = 2002)
Returns nvarchar(100)
As
Begin
	RETURN 
	(SELECT TOP 1 ����������.�������������� FROM �����
		INNER JOIN ���������� ON �����.������������� = ����������.�������������
		WHERE Month(�����.������������) = @month And Year(�����.������������) = @year 
		And �����.��������������� = N'�����������'
		GROUP BY ����������.��������������
		ORDER BY SUM(�����.���������� * �����.����) Desc )
End
GO

Go
Create or Alter Function Max3(@month int = 7,@year int = 2002,@�������� nvarchar(30) = '�������',@sum real = 2000 )
RETURNS Table
As
Return
	Select ����������.�������������,����������.�������������� as ���������,Round(Sum(�����.���� * �����.����������),2) As �����
	From �����
	Inner Join ���������� On ����������.������������� = �����.�������������
	Inner Join ����� On �����.�������� = �����.��������
	Inner Join ����_����� On ����_�����.������������ = �����.������������
	Where Month(�����.������������) = @month And Year(�����.������������) = @year 
	And �����.��������������� = N'�����������' And ����_�����.������������� = @��������
	Group By ����������.�������������,����������.��������������
	Having Sum(�����.���� * �����.����������) >= @sum
Go


Go
Use Lab4;
Select dbo.Max�����1(7,2002)

Select dbo.Max2(7,2002)

Select * From Max3(7,2002,'��������',2000)
Order by Max3.���������


Go