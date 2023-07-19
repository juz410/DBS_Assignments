
CREATE SCHEMA Security;

--Transactions Table
CREATE OR ALTER FUNCTION Security.fn_securitypredicate_Transactions
(@UserID AS NVARCHAR(255))
RETURNS TABLE
WITH SCHEMABINDING
AS
RETURN SELECT 1 AS fn_securitypredicate_result
WHERE @UserID = USER_NAME()
OR IS_MEMBER('StoreClerks') = 1
OR IS_MEMBER('DBA') = 1
OR IS_MEMBER('Management') = 1;
GO

CREATE SECURITY POLICY Security.TransactionsSecurityPolicy 
ADD FILTER PREDICATE Security.fn_securitypredicate_Transactions(UserID)
ON dbo.Transactions;
GO


--Membership Table
CREATE OR ALTER FUNCTION Security.fn_securitypredicate_Membership
(@UserID AS NVARCHAR(255))
RETURNS TABLE
WITH SCHEMABINDING
AS
RETURN SELECT 1 AS fn_securitypredicate_result
WHERE @UserID = USER_NAME()
OR IS_MEMBER('StoreClerks') = 1
OR IS_MEMBER('DBA') = 1
OR IS_MEMBER('Management') = 1;
GO

CREATE SECURITY POLICY Security.MembershipSecurityPolicy 
ADD FILTER PREDICATE Security.fn_securitypredicate_Membership(UserID)
ON dbo.Membership;
GO
