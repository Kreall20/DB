USE Lab4

--1.2

ALTER TABLE dbo.��_��� ADD PRIMARY KEY(��������);

ALTER TABLE dbo.���������� ADD PRIMARY KEY(�������������);

ALTER TABLE dbo.���������� ADD PRIMARY KEY(�������������);

ALTER TABLE dbo.���������� ADD PRIMARY KEY(�������������);

ALTER TABLE dbo.����� ADD PRIMARY KEY(�����������);

ALTER TABLE dbo.������_������� ADD PRIMARY KEY(���������);

ALTER TABLE dbo.����� ADD PRIMARY KEY(��������);

ALTER TABLE dbo.����_������������ ADD PRIMARY KEY(�������������);

ALTER TABLE dbo.����_����� ADD PRIMARY KEY(������������);

--2.1
--USE Lab4
SELECT TOP 10 ��������� Name,Price = ���������
	FROM [�����]
		WHERE ������������ = 9
			ORDER BY ��������� DESC;

--2.2A

SELECT ���������,���������,��������
	FROM [�����]
		WHERE ��������� > ALL
			(SELECT ���������
				FROM [�����]
					WHERE �������� = 3)
						ORDER BY ���������;

--2.2B

SELECT ���������,���������,��������
	FROM [�����]
		WHERE ��������� > ANY
			(SELECT ���������
				FROM [�����]
					WHERE �������� = 3)
						ORDER BY ���������;

--2.3

SELECT COUNT(���������) AS ����������_��������_�������
	FROM [�����]
		WHERE ������������ = 9 AND �������� = 5;

--2.4

SELECT MAX(���������) AS ������������_����_�����, AVG(���������) AS �������_����_�����
	FROM [�����]
		WHERE �������� = 1;