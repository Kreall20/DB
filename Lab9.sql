Use Lab4;

GO
--9.1a 9.1b
If Object_id(N'dbo.�����1', N'U') Is Null
	Print '����� ������� ���';
Else
	Drop Table �����1;

--9.1c
Select * Into �����1 From �����;

--9.1d
Select �����1.��������� AS �����, ����_�����.������������� AS ��� From �����1
	Inner Join ����_����� On ����_�����.������������ = �����1.������������ Where ����_�����.������������� = N'������' or ����_�����.������������� = N'������'

--9.1e
Update �����1 Set ������������ = 10
	Where ������������ = 11;

--9.1f
Select �����1.��������� AS �����, ����_�����.������������� AS ��� From �����1
	Inner Join ����_����� On ����_�����.������������ = �����1.������������ where ����_�����.������������� = N'������' or ����_�����.������������� = N'������'

GO


GO
Use Lab4;
--9.2a 9.2b
If Object_id(N'dbo.�����1', N'U') Is Null
	Print '����� ������� ���';
Else
	Drop Table �����1;

--9.2c
Select * Into �����1 From �����;

/*Insert Into �����1
	Select * From �����;*/

--9.2d

	Declare @avgprod float
	Select @avgprod = AVG(���������)
		From �����1
		Inner Join ����_����� On ����_�����.������������ = �����1.������������ And  ����_�����.������������� = N'��������';

	Select Round(@avgprod,2) As ��_����_���������;

	Declare @avgbef float
	Select @avgbef = AVG(���������)
		From �����1
		Inner Join ����_����� On ����_�����.������������ = �����1.������������ And  ����_�����.������������� = N'�������';

	Select Round(@avgbef,2) As ��_����_��������;

	Declare @i int,@flag int
	Set @i = 0
	If(@avgprod > @avgbef)
		Begin
			Print('��.���� �������� ������');
			While(@avgprod > @avgbef)
				Begin
					Set @avgprod -= @avgprod * 0.2
					Set @i +=1
					Set @flag = 0
				End
		End
	If(@avgprod < @avgbef)
		Begin
			Print('��.���� �������� ������');
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