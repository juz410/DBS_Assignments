USE DBS_Assignments
GO


EXECUTE AS USER = 'DBA01';
CREATE TABLE TestTable(
    TestID INT PRIMARY KEY,
    TestName VARCHAR(50) NOT NULL
);
GO


ALTER TABLE TestTable
ADD TestDescription VARCHAR(255);
GO


DROP TABLE TestTable;
GO

REVERT;