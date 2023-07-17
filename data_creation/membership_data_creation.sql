OPEN SYMMETRIC KEY SymKey1 DECRYPTION BY CERTIFICATE Cert1;

INSERT INTO Membership
(UserID, Name, Address, Phone, Email, National_registration_ID_or_passport_number, Status)
VALUES
('normalMember01', 'TAN KOK FEENG', 'Address 1', 'Phone1', 'Email1', EncryptByKey(Key_GUID('SymKey1'),'123'), 'Active'),
('normalMember02', 'LEE ZHAO YOU', 'Address 2', 'Phone2', 'Email2', EncryptByKey(Key_GUID('SymKey1'),'456'), 'Active'),
('normalMember03', 'TANG SHI YING', 'Address 3', 'Phone3', 'Email3', EncryptByKey(Key_GUID('SymKey1'),'789'), 'Active'),
('normalMember04', 'Member 4', 'Address 4', 'Phone4', 'Email4', EncryptByKey(Key_GUID('SymKey1'),'abc'), 'Active'),
('normalMember05', 'Member 5', 'Address 5', 'Phone5', 'Email5', EncryptByKey(Key_GUID('SymKey1'),'def'), 'Active');

CLOSE SYMMETRIC KEY SymKey1;


-- DELETE FROM Membership;