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
    t.UserID = 'normalMember02'
ORDER BY
    t.TransactionDate DESC, 
    ti.ItemID;
