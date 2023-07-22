-- Execute commands as specific user
EXECUTE AS USER = 'normalMember01'; 

-- Your test SQL commands here, such as:
SELECT * FROM Membership;
UPDATE Membership SET Address = 'New Address123' WHERE UserID = 'normalMember01';

-- Revert back to original execution context
REVERT;
