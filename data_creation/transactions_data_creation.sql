-- First, we insert the transactions
INSERT INTO Transactions (UserID, TotalPrice, TransactionDate)
VALUES 
('normalMember01', 50*2 + 100*1 + 150*2*1.1 + 200*1, GETDATE()), -- today
('normalMember01', 50*1 + 100*2 + 150*2*1.1 + 200*1, DATEADD(DAY, -1, GETDATE())), -- yesterday
('normalMember01', 250*2*1.1 + 50*1 + 100*2 + 200*2, DATEADD(DAY, -2, GETDATE())), -- two days ago
('normalMember02', 50*1 + 100*1 + 150*2*1.1 + 200*1, GETDATE()), -- today
('normalMember02', 50*2 + 100*1 + 150*1*1.1 + 200*2, DATEADD(DAY, -1, GETDATE())), -- yesterday
('normalMember02', 250*1*1.1 + 50*2 + 100*2 + 200*1, DATEADD(DAY, -2, GETDATE())), -- two days ago
('normalMember03', 50*1 + 100*2 + 150*1*1.1, GETDATE()), -- today
('normalMember04', 50*2 + 100*1 + 150*2*1.1, GETDATE()); -- today
