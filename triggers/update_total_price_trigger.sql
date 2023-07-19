CREATE TRIGGER UpdateTotalPriceTrigger
ON TransactionItem
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
  DECLARE @TransactionID INT;
  DECLARE @TotalPrice DECIMAL(18,2);

  SELECT @TransactionID = TransactionID FROM inserted;

  SELECT @TotalPrice = SUM(i.Price * ti.Quantity * (1 + (CASE WHEN i.IsImported = 1 THEN i.TaxRate ELSE 0 END)))
  FROM TransactionItem ti
  INNER JOIN Items i ON ti.ItemID = i.ItemID
  WHERE ti.TransactionID = @TransactionID;

  UPDATE Transactions
  SET TotalPrice = @TotalPrice
  WHERE TransactionID = @TransactionID;
END;
GO
