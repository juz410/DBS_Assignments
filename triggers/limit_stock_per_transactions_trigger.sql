CREATE TRIGGER LimitQuantityTrigger
ON TransactionItem
AFTER INSERT, UPDATE
AS
BEGIN
  IF EXISTS (SELECT 1 FROM inserted WHERE Quantity > 20)
  BEGIN
    RAISERROR ('Cannot purchase more than 100 units of an item in a single transaction', 16, 1);
    ROLLBACK TRANSACTION;
    RETURN;
  END;
END;
GO
