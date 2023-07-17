-- Create Role table
CREATE TABLE [Role](
  RoleID INT PRIMARY KEY,
  RoleName NVARCHAR(50)
);

-- Create User table
CREATE TABLE [User](
  UserID NVARCHAR(255) PRIMARY KEY,
  RoleID INT FOREIGN KEY REFERENCES Role(RoleID)
);

-- Create Items table
CREATE TABLE Items(
  ItemID INT PRIMARY KEY,
  ItemName NVARCHAR(255),
  Price DECIMAL(18,2),
  Category NVARCHAR(255),
  StockQuantity INT,
  CountryOfProduction NVARCHAR(255),
  IsImported BIT,
  TaxRate DECIMAL(18,2) DEFAULT 0.1  -- 10% tax for imported items
);

-- Create Transactions table
CREATE TABLE Transactions(
  TransactionID INT IDENTITY(1,1) PRIMARY KEY,
  UserID NVARCHAR(255) FOREIGN KEY REFERENCES [User](UserID),
  TransactionDate DATE
);

-- Create TransactionItem table
CREATE TABLE TransactionItem(
  TransactionID INT FOREIGN KEY REFERENCES Transactions(TransactionID),
  ItemID INT FOREIGN KEY REFERENCES Items(ItemID),
  Quantity INT,
  PRIMARY KEY (TransactionID, ItemID)  -- composite primary key
);

-- Create Membership table
CREATE TABLE Membership(
  MembershipID INT IDENTITY(1,1) PRIMARY KEY,
  UserID NVARCHAR(255) FOREIGN KEY REFERENCES [User](UserID),
  Name NVARCHAR(255),
  Address NVARCHAR(MAX),
  Phone NVARCHAR(20),
  Email NVARCHAR(255),
  National_registration_ID_or_passport_number VARBINARY(MAX),
  Status NVARCHAR(50)
);
