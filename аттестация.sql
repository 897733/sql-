
/*Задание: Создайте таблицу EmployeeDetails для хранения информации о
сотрудниках. Таблица должна содержать следующие столбцы:
● EmployeeID (INTEGER, PRIMARY KEY)
● EmployeeName (TEXT)
● Position (TEXT)
● HireDate (DATE)
● Salary (NUMERIC)
После создания таблицы добавьте в неё три записи с произвольными данными о
сотрудниках.
*/

CREATE TABLE EmployeeDetails (
EmployeeID INTEGER PRIMARY KEY,
EmployeeName TEXT,
Position TEXT,
HireDate DATE,
Salary NUMERIC
);
-- Добавление данных
INSERT INTO EmployeeDetails (EmployeeID, EmployeeName, Position,
HireDate, Salary) VALUES (1, 'John Smith', 'Sales Manager',
'2022-01-15', 55000);
INSERT INTO EmployeeDetails (EmployeeID, EmployeeName, Position,
HireDate, Salary) VALUES (2, 'Jane Doe', 'Marketing Specialist',
'2021-06-30', 48000);
INSERT INTO EmployeeDetails (EmployeeID, EmployeeName, Position,
HireDate, Salary) VALUES (3, 'Emily Johnson', 'Software Engineer',
'2023-03-22', 65000);


/*Задание: Создайте представление HighValueOrders для отображения всех заказов,
сумма которых превышает 10000. В представлении должны быть следующие столбцы:
● OrderID (идентификатор заказа),
● OrderDate (дата заказа),
● TotalAmount (общая сумма заказа, вычисленная как сумма всех Quantity *
Price).
Используйте таблицы Orders, OrderDetails и Products.
Подсказки:
1. Используйте JOIN для объединения таблиц.
2. Используйте функцию SUM() для вычисления общей суммы заказа.
*/

--CREATE View HighValueOrders AS
SELECT o.OrderID,
o.OrderDate,
p.ProductName,
SUM(Quantity * Price) as TotalAmount
FROM Orders o 
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID 
GROUP BY o.OrderID 
HAVING SUM(od.Quantity * p.Price) > 10000
;

/*Задание: Удалите все записи из таблицы EmployeeDetails, где Salary меньше
50000. Затем удалите таблицу EmployeeDetails из базы данных.
Подсказки:
1. Используйте команду DELETE FROM для удаления данных.
2. Используйте команду DROP TABLE для удаления таблицы.
*/

DELETE FROM EmployeeDetails WHERE Salary < 50000

DROP TABLE EmployeeDetails


/*Задание: Создайте хранимую процедуру GetProductSales с одним параметром
ProductID. Эта процедура должна возвращать список всех заказов, в которых
участвует продукт с заданным ProductID, включая следующие столбцы:
● OrderID (идентификатор заказа),
● OrderDate (дата заказа),
● CustomerID (идентификатор клиента).
Подсказки:
1. Используйте команду CREATE PROCEDURE для создания процедуры.
2. Используйте JOIN для объединения таблиц и WHERE для фильтрации данных по
ProductID.
*/

CREATE PROCEDURE GetProductSales(IN p.ProductID INTEGER)
BEGIN
	SELECT 
	o.OrderID,
	o.OrderDate,
	o.CustomerID
FROM Orders o 
JOIN OrderDetails od ON o.OrderID = od.OrderID
WHERE od.ProductID = p_ProductID;
END
;








































