SELECT * FROM Orders

/* 
Satışlar kaç günde teslim edilmiştir?

SELECT OrderID, OrderDate, ShippedDate, DATEDIFF(DAY,OrderDate,ShippedDate) Sure FROM Orders
WHERE ShippedDate NOT LIKE 'NULL'
ORDER BY Sure DESC


SELECT OrderID, OrderDate, ShippedDate, DATEDIFF(DAY,OrderDate,ShippedDate) Sure FROM Orders
WHERE ShippedDate NOT LIKE 'NULL'
ORDER BY 4 DESC

*/

/* 
Hangi kargo şirketine toplam 25000 birimden daha az ödeme yapılmıştır?

SELECT T1.CompanyName, SUM(T1.Freight) Toplam FROM
(SELECT ShipperID,CompanyName,Freight FROM Shippers S LEFT JOIN Orders O ON S.ShipperID = O.ShipVia) T1
GROUP BY CompanyName
HAVING SUM(T1.Freight) <= 25000

*/ 

/*

Çalışanlar ne kadarlık satış yapmıştır?

SELECT E.FirstName + ' ' + E.LastName Calisan_Adi, SUM(OD.Quantity * OD.UnitPrice) Monetary FROM Employees E 
INNER JOIN Orders O ON E.EmployeeID = O.EmployeeID
INNER JOIN [Order Details] OD ON OD.OrderID = O.OrderID 
GROUP BY E.FirstName + ' ' + E.LastName


*/

 /* 

Çalışanlar ürün bazında ne kadarlık satış yaptı?
  
SELECT * FROM [Order Details]
 SELECT * FROM Orders
 SELECT * FROM Products
 SELECT * FROM Employees

 SELECT e.FirstName + ' ' + e.LastName Calisan, p.ProductName, SUM(od.Quantity) Miktar, SUM(od.Quantity * od.UnitPrice) Ciro FROM Products p 
 INNER JOIN [Order Details] od ON p.ProductID = od.ProductID 
 INNER JOIN Orders o ON o.OrderID = od.OrderID 
 INNER JOIN Employees e ON e.EmployeeID = o.EmployeeID
 GROUP BY e.FirstName + ' ' + e.LastName, p.ProductName
 ORDER BY Ciro DESC

 */

 /* 
 Toplam birim fiyatı 200'den düşük olan kategoriler

  SELECT CategoryName FROM Categories INNER JOIN 
 (SELECT CategoryID, SUM(UnitPrice) Fiyat FROM Products
 GROUP BY CategoryID
 HAVING SUM(UnitPrice) <= 200) T1 ON Categories.CategoryID = T1.CategoryID

 */

 /* 
 
 En değerli müşterim hangisi? (Adet, Quantity bazında)
 
 SELECT c.ContactName, SUM(od.Quantity) Adet, SUM(od.Quantity * od.UnitPrice) Ciro FROM Customers c 
INNER JOIN Orders o ON c.CustomerID = o.CustomerID 
INNER JOIN [Order Details] od ON o.OrderID = od.OrderID 
GROUP BY c.ContactName
ORDER BY 2 DESC 


 */

 /* 
 
 En yüksek 2.unitPrice değerini ROW NUMBER kullanmadan bul
 
 SELECT MAX(UnitPrice) AS Unit_Price
 FROM [Order Details]
 WHERE UnitPrice <> (SELECT MAX(UnitPrice) FROM [Order Details]) 
 
 
  */

  /* 
  
  Sipariş tarihi ile sipariş tarihi ayının son günü arasındaki farkı bulunuz
  
  SELECT OrderDate, EOMONTH(OrderDate) End_Of_The_Month, DATEDIFF(DAY,OrderDate, EOMONTH(OrderDate)) Day_Diff  FROM 
  Orders 
  
  
  */

  /*
  
  Farklı ve 10'dan fazla sipariş veren müşterilerin Id ve sipariş sayılarını bulunuz.
  
  SELECT CustomerID, COUNT(OrderID) Siparis_Adeti FROM Orders
GROUP BY CustomerID
HAVING COUNT(DISTINCT OrderID) > 10 
  
  
   */

SELECT * FROM [Order Details]
 SELECT * FROM Orders
 SELECT * FROM Products
 SELECT * FROM Employees
SELECT * FROM Categories 
SELECT * FROM Customers




