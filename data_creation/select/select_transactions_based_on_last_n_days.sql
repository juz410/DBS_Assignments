EXECUTE AS USER = 'DBA01'; 

DECLARE @n INT = 7;  -- Replace 7 with any number you want

SELECT 
    t.TransactionID,
    t.TransactionDate,
    ti.ItemID,
    i.ItemName,
    ti.Quantity,
    i.Price * ti.Quantity * (1 + i.TaxRate) AS ItemTotalPriceAfterTax,
    t.TotalPrice AS TransactionTotalPrice
FROM 
    Transactions t
JOIN 
    TransactionItem ti ON t.TransactionID = ti.TransactionID
JOIN 
    Items i ON ti.ItemID = i.ItemID
WHERE 
    DATEDIFF(DAY, t.TransactionDate, GETDATE()) <= @n
ORDER BY
    t.TransactionDate DESC, 
    ti.ItemID;

Revert;
