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