-- Insert the transaction items
INSERT INTO TransactionItem (TransactionID, ItemID, Quantity)
VALUES
(1, 'P001', 2), (1, 'P002', 1), (1, 'P003', 2), (1, 'P004', 1), -- normalMember01, first transaction
(2, 'P001', 1), (2, 'P002', 2), (2, 'P003', 2), (2, 'P004', 1), -- normalMember01, second transaction
(3, 'P001', 1), (3, 'P002', 2), (3, 'P004', 2), (3, 'P005', 2), -- normalMember01, third transaction
(4, 'P001', 1), (4, 'P002', 1), (4, 'P003', 2), (4, 'P004', 1), -- normalMember02, first transaction
(5, 'P001', 2), (5, 'P002', 1), (5, 'P003', 1), (5, 'P004', 2), -- normalMember02, second transaction
(6, 'P001', 2), (6, 'P002', 2), (6, 'P004', 1), (6, 'P005', 1), -- normalMember02, third transaction
(7, 'P001', 1), (7, 'P002', 2), (7, 'P003', 1), -- normalMember03, only transaction
(8, 'P001', 2), (8, 'P002', 1), (8, 'P003', 2); -- normalMember04, only transaction


-- Update stock

-- Finally, we decrease the stock for each item
UPDATE Items 
SET StockQuantity = StockQuantity - 
    (SELECT SUM(Quantity) FROM TransactionItem WHERE ItemID = 'P001')
WHERE ItemID = 'P001';

UPDATE Items 
SET StockQuantity = StockQuantity - 
    (SELECT SUM(Quantity) FROM TransactionItem WHERE ItemID = 'P002')
WHERE ItemID = 'P002';

UPDATE Items 
SET StockQuantity = StockQuantity - 
    (SELECT SUM(Quantity) FROM TransactionItem WHERE ItemID = 'P003')
WHERE ItemID = 'P003';

UPDATE Items 
SET StockQuantity = StockQuantity - 
    (SELECT SUM(Quantity) FROM TransactionItem WHERE ItemID = 'P004')
WHERE ItemID = 'P004';

UPDATE Items 
SET StockQuantity = StockQuantity - 
    (SELECT SUM(Quantity) FROM TransactionItem WHERE ItemID = 'P005')
WHERE ItemID = 'P005';
