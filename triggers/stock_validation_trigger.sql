CREATE TRIGGER CheckStockTrigger
ON TransactionItem
INSTEAD OF INSERT, UPDATE
AS
BEGIN
  DECLARE @TransactionID INT;
  DECLARE @ItemID NVARCHAR(255);
  DECLARE @Quantity INT;
  DECLARE @StockQuantity INT;

  SELECT @TransactionID = TransactionID, @ItemID = ItemID, @Quantity = Quantity FROM inserted;

  SELECT @StockQuantity = StockQuantity FROM Items WHERE ItemID = @ItemID;

  IF @Quantity > @StockQuantity
  BEGIN
    RAISERROR ('Not enough stock for the requested item', 16, 1);
    RETURN;
  END
  ELSE
  BEGIN
    UPDATE Items
    SET StockQuantity = StockQuantity - @Quantity
    WHERE ItemID = @ItemID;

    -- Perform different operations based on whether the record exists
    IF EXISTS (SELECT 1 FROM TransactionItem WHERE TransactionID = @TransactionID AND ItemID = @ItemID)
    BEGIN
      -- If record exists, update it
      UPDATE TransactionItem
      SET Quantity = @Quantity
      WHERE TransactionID = @TransactionID AND ItemID = @ItemID;
    END
    ELSE
    BEGIN
      -- If record does not exist, insert it
      INSERT INTO TransactionItem
      SELECT * FROM inserted;
    END
  END;
END;
GO
