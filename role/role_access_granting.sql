-- Members can only update their own membership details.
-- Assuming Membership table has UserID column to identify the respective member.
GRANT UPDATE ON dbo.Membership TO Members;

-- Members must be able to check, add, update and delete their own transactions only
GRANT SELECT, INSERT, UPDATE, DELETE ON dbo.Transactions TO Members;

-- Store Clerks must be able to manage (add, update, remove) all data except membership and transaction details
GRANT INSERT, UPDATE, DELETE ON dbo.Items TO StoreClerks;

-- Store Clerks must be able to view all transaction records (full details) but not modify them
GRANT SELECT ON dbo.Transactions TO StoreClerks;

-- Store Clerks must be able to add new membership data
GRANT INSERT ON dbo.Membership TO StoreClerks;

-- Store Clerks must be able to view and update non confidential membership data
GRANT SELECT, UPDATE ON dbo.Membership TO StoreClerks;

-- Store Clerks should not be able to view any member’s confidential data
DENY SELECT ON OBJECT::dbo.Membership (National_registration_ID_or_passport_number) TO StoreClerks;

-- All DDL queries can only be performed by database administrators (DBA).
-- Assuming DBA role has been created
EXEC sp_addrolemember 'db_owner', 'DBA';

-- Database Administrators (DBA) should not be able to view any member’s confidential data
DENY SELECT ON OBJECT::dbo.Membership (National_registration_ID_or_passport_number) TO DBA;

-- Management staffs must be able to query all tables but not make any changes to it.
GRANT SELECT ON SCHEMA::dbo TO Management;

-- Management should not be able to view any member’s confidential data
DENY SELECT ON OBJECT::dbo.Membership (National_registration_ID_or_passport_number) TO Management;
