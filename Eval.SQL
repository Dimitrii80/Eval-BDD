//Exercice 1
SELECT CompanyName AS 'Société',ContactName AS 'Contact',ContactTitle AS 'Fonction',Phone AS 'Téléphone'
FROM customers
WHERE Country = 'France'

//Exercice 2
SELECT ProductName AS 'Produit',UnitPrice AS 'Prix'
FROM suppliers
JOIN products ON suppliers.SupplierID=products.SupplierID
WHERE CompanyName = 'Exotic Liquids'

//Exercice 3
SELECT CompanyName AS 'Fournisseur',count(products.SupplierID) AS 'Nbre produits'
FROM suppliers
JOIN products ON suppliers.SupplierID=products.SupplierID
WHERE Country = 'France'
GROUP BY CompanyName
ORDER BY count(products.SupplierID) DESC 

//Exercice 4
SELECT CompanyName AS 'Client',count(orders.CustomerID) AS 'Nbre commandes'
FROM customers
JOIN orders ON customers.CustomerID=orders.CustomerID
WHERE Country = 'France' 
GROUP BY CompanyName
HAVING count(orders.CustomerID) > 10

//Exercice 5
SELECT CompanyName,sum(UnitPrice * Quantity) AS 'CA',Country AS 'Pays'
FROM customers
JOIN orders ON customers.CustomerID = orders.CustomerID
JOIN `order details` ON orders.OrderID = `order details`.OrderID
GROUP BY CompanyName
HAVING sum(UnitPrice * Quantity) > 30000
ORDER BY sum(UnitPrice * Quantity) DESC

//Exercice 6
SELECT ShipCountry AS 'Pays'
FROM orders
JOIN `order details` ON `order details`.OrderID = orders.OrderID
JOIN products ON products.ProductID = `order details`.ProductID
JOIN suppliers ON suppliers.SupplierID = products.SupplierID
WHERE CompanyName = 'Exotic Liquids'
GROUP BY ShipCountry
ORDER BY ShipCountry ASC 

//Exercice 7
SELECT sum(UnitPrice * Quantity) AS 'Montant Ventes 97'
FROM orders
JOIN `order details` ON `order details`.OrderID = orders.OrderID
WHERE OrderDate >= '1997-01-01'  AND OrderDate < '1998-01-01'

//Exercice 8
SELECT month(OrderDate) AS 'Mois 97',sum(UnitPrice * Quantity) AS 'Montant Ventes 97'
FROM orders
JOIN `order details` ON `order details`.OrderID = orders.OrderID
WHERE OrderDate >= '1997-01-01'  AND OrderDate < '1998-01-01'
GROUP BY month(OrderDate)

//Exercice 9
SELECT max(OrderDate) AS 'Date de dernière commande'
FROM orders
WHERE ShipName = 'Du monde entier'

//Exercice 10
SELECT ROUND (AVG(DATEDIFF (ShippedDate,OrderDate))) AS 'Délai moyen de livraison en jours'
FROM orders 