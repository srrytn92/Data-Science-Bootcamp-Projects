CREATE TABLE OrderID (
  OrderID INT PRIMARY KEY,
  OrderDate date,
  Amount INT,
  Price REAL,
  MenuID INT,
  StaffID INT,
  PaymentID INT,
  CustomerID INT,
  FOREIGN KEY (MenuID) REFERENCES Menu(MenuID),
  FOREIGN KEY (StaffID) REFERENCES Staff(StaffID),
  FOREIGN KEY (PaymentID) REFERENCES PaymentMethod(PaymentID),
  FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO OrderID VALUES
  (1, "2022-07-01", 2, 130, 2, 1, 1, 1),
  (2, "2022-07-03", 1, 55, 1, 2, 2, 2),
  (3, "2022-07-09", 1, 65, 3, 2, 3, 3),
  (4, "2022-07-15", 2, 130, 2, 1, 1, 1),
  (5, "2022-07-31", 2, 130, 4, 2, 3, 4),
  (6, "2022-08-04", 1, 60, 6, 1, 1, 5),
  (7, "2022-08-28", 1, 60, 5, 1, 3, 6),
  (8, "2022-09-06", 2, 120, 5, 2, 2, 5),
  (9, "2022-09-13", 3, 165, 1, 2, 2, 2),
  (10, "2022-09-18", 4, 260, 4, 1, 3, 7), 
  (11, "2022-09-21", 2, 130, 2, 1, 1, 1),
  (12, "2022-10-03", 2, 110, 1, 1, 2, 2),
  (13, "2022-10-09", 3, 195, 3, 2, 1, 3),
  (14, "2022-10-15", 2, 130, 2, 1, 3, 1),
  (15, "2022-10-31", 2, 130, 4, 2, 1, 4),
  (16, "2022-11-04", 5, 300, 6, 1, 3, 5),
  (17, "2022-11-28", 1, 60, 5, 1, 1, 6),
  (18, "2022-11-06", 2, 120, 5, 2, 2, 5),
  (19, "2022-11-13", 1, 55, 1, 1, 2, 2),
  (20, "2022-11-18", 4, 260, 4, 1, 1, 7);

---------------------------------------------------------------------
CREATE TABLE Menu (
  MenuID INT PRIMARY KEY,
  Menulist TEXT,
  Price REAL
);

INSERT INTO Menu VALUES
  (1, "Americano", 55.0),
  (2, "Esspresso", 65.0),
  (3, "Latte", 65.0),
  (4, "Mocha", 65.0),
  (5, "Matcha Latte", 60),
  (6, "Cocoa", 60);
    
---------------------------------------------------------------------   
CREATE TABLE Staff (
  StaffID INT PRIMARY KEY,
  StaffName TEXT
);

INSERT INTO Staff VALUES
  (1, "Lionel"),
  (2, "andres");
    
---------------------------------------------------------------------    
CREATE TABLE PaymentMethod (
  PaymentID INT PRIMARY KEY,
 	Paymenttype TEXT
);

INSERT INTO PaymentMethod VALUES
  (1, "Cash"),
  (2, "Creditcard"),
  (3, "Debitcard");
    
---------------------------------------------------------------------    
CREATE TABLE Customers (
  CustomerID INT PRIMARY KEY,
  name TEXT,
  Gender TEXT
);

INSERT INTO Customers VALUES
  (1, "Jadon", "Male"),
  (2, "Kingley", "Male"),
  (3, "Vinicius", "Male"),
  (4, "Ousmane", "Male"),
  (5, "Marry", "Female"),
  (6, "Anna", "Female"),
  (7, "Kendra", "Female");
---------------------------------------------------------------------
.mode markdown
.header on

-- menu top sales
SELECT 
  Menulist,
  SUM(Amount) AS Total_Sales,
  SUM(Price) AS Sum_Price  
FROM(
  SELECT 
    *
  FROM OrderID AS oid
  JOIN Menu AS m ON oid.MenuID = m.MenuID
  JOIN Staff AS s ON oid.StaffID = s.StaffID
  JOIN PaymentMethod AS pm ON oid.PaymentID = pm.PaymentID
  JOIN Customers AS c ON oid.CustomerID = c.CustomerID
) AS sub
--HAVING SUM(oid.Price) > 100
GROUP BY Menulist
ORDER BY Total_Sales DESC;
---------------------------------------------------------------------

-- staff top sales
SELECT 
  StaffName,
  SUM(Amount) AS Total_Sales,
  SUM(Price) AS Sum_Price
FROM(
  SELECT
    *
  FROM OrderID AS oid
  JOIN Staff AS s ON oid.StaffID = s.StaffID
) AS sub
GROUP BY StaffName
ORDER BY Total_Sales DESC;
---------------------------------------------------------------------

-- Top Customers
SELECT
  name,
  SUM(Amount) AS Total_Sales,
  SUM(Price) AS Sum_Price
FROM (
  SELECT
    *
  FROM OrderID AS oid
  JOIN Customers AS c  ON oid.CustomerID = c.CustomerID
  ) AS sub
GROUP BY 1
ORDER BY 2 DESC;
---------------------------------------------------------------------

-- Top month sales
WITH sub AS(
SELECT
  *
FROM OrderID
)
SELECT
 STRFTIME('%m', OrderDate) AS Months,
 SUM(Amount) AS Total_Sales,
 SUM(Price) AS Sum_Price
FROM sub
GROUP BY Months
ORDER BY Total_Sales DESC;
---------------------------------------------------------------------

-- Top Payment Method
WITH sub2 AS(
  SELECT 
  *
  FROM OrderID AS oid, PaymentMethod AS p
  WHERE oid.PaymentID = p.PaymentID
)
SELECT 
  Paymenttype,
  COUNT(PaymentID) AS n_type
FROM sub2
GROUP BY Paymenttype
ORDER BY n_type DESC;
