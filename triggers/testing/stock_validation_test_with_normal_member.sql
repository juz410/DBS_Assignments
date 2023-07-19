EXECUTE AS USER = 'normalMember01';
SELECT * FROM Transactions;
REVERT;

EXECUTE AS USER = 'normalMember01';
SELECT * FROM TransactionItem;
REVERT;

EXECUTE AS USER = 'normalMember01';
UPDATE TransactionItem
SET Quantity = 100
WHERE TransactionID = 1 AND ItemID = 'P001';
REVERT;

EXECUTE AS USER = 'normalMember01';
SELECT * FROM Transactions;
REVERT;

EXECUTE AS USER = 'normalMember01';
SELECT * FROM TransactionItem;
REVERT;

EXECUTE AS USER = 'Manager01';
SELECT * FROM Items;
REVERT;