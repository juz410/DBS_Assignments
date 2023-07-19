--Testing using first user to change 2nd user address
EXECUTE AS USER = 'normalMember01';
GO

UPDATE dbo.Membership
SET Address = 'SOME ADDRESS'
WHERE UserID = 'normalMember02';
GO

REVERT;
GO
