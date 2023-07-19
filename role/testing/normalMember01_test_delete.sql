--this should fail
-- Switch to normalMember01 user
EXECUTE AS USER = 'normalMember01';

-- Attempt to delete a record
DELETE FROM Membership
WHERE MembershipID = 1;

-- Switch back to the original user
REVERT;
