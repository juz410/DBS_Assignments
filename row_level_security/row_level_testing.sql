--Testing using first user to change 2nd user address
EXECUTE AS USER = 'normalMember01';
GO

UPDATE dbo.Membership
SET Address = 'SOME ADDRESS'
WHERE UserID = 'normalMember02';
GO

REVERT;
GO


--Testing select membership table as normalMember01

EXECUTE AS USER = 'normalMember01'; 

OPEN SYMMETRIC KEY SymKey1 DECRYPTION BY CERTIFICATE Cert1;

SELECT 
  MembershipID,
  UserID,
  Name,
  Address,
  Phone,
  Email,
  CONVERT(VARCHAR(MAX), DecryptByKey(National_registration_ID_or_passport_number)) AS DecryptedNationalID,
  Status
FROM Membership

CLOSE SYMMETRIC KEY SymKey1;

REVERT;


--Testing select transaction table as normalMember01

EXECUTE AS USER = 'normalMember01'; 

SELECT * FROM Transactions;

REVERT;