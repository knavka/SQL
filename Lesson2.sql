USE AdventureWorks2014
GO

SELECT FirstName, COUNT(*) AS Total FROM [Person].[Person]
GROUP BY FirstName
ORDER BY Total desc


SELECT DaysToManufacture FROM [Production].[Product]
GROUP BY DaysToManufacture
HAVING SUM (ListPrice)>3000


SELECT *,  (CommissionPct*SalesLastYear) AS SalesSalary FROM [Sales].[SalesPerson]
WHERE ModifiedDate>'20120101'
AND CommissionPct*SalesLastYear>0