   ------------------------------------------ Database Name: AdventureWorks--------------------------------------------------
   
   USE WORKSADVENTURES;
   
   /* 1. Write a query to display employee numbers and employee name (first name, last name) 
of all the sales employees who received an amount of 2000 in bonus.*/
SELECT Emplyee_Id,Emp_Name
FROM worksadventures.st_employee
WHERE Bonus=2000;


/*2. Fetch address details of employees belonging to the state CA. If address is null, provide 
default value N/A.  */
SELECT Emplyee_Id,
CASE
 WHEN  Emp_Add IS NULL THEN 'N/A'
 ELSE Emp_Add
END AS Employee_Add
FROM worksadventures.st_employee
WHERE Emp_State='CA';

/* 3. Write a query that displays all the products along with the Sales OrderID even if an order 
has never been placed for that product.  */
SELECT P.Product_ID,S.Order_Id,P.Product_Name
FROM worksadventures.products AS P
RIGHT JOIN worksadventures.sales_orderid AS S
ON P.Product_ID=S.Product_ID;

/*4. Find the subcategories that have at least two different prices less than $15.  */
SELECT DrugSubCate_Code,Product_Name
FROM worksadventures.products 
WHERE Unit_Price<200 AND Sales_Price<200 AND Unit_Price <> Sales_Price
ORDER BY DrugSubCate_Code,Product_Name  ;

/* 5. A. Write a query to display employees and their manager details. Fetch employee id, 
employee first name, and manager id, manager name. */
SELECT Emplyee_Id,Emp_Name,Manager_Id,Mang_Name
FROM worksadventures.st_employee;

/*5. B. Display the employee id and employee name of employees who do not have manager.*/
SELECT Emplyee_Id,Emp_Name
FROM worksadventures.st_employee
WHERE Manager_Id IS NULL;

/* 6. A. Display the names of all products of a particular subcategory 15 and the names of their vendors. */
SELECT P.Product_ID,P.Product_Name,P.DrugSubCate_Code,V.Vendor_ID,V.Vendor_Name
FROM worksadventures.products AS P
JOIN worksadventures.vendors AS V
                 ON P.Drug_Code=V.DrudSell_Code
WHERE P.DrugSubCate_Code=15;

/* 6.B. Find the products that have more than one vendor. */
SELECT P.Product_ID,P.Product_Name,COUNT(Vendor_ID) TotalVendor
FROM worksadventures.products AS P
  JOIN worksadventures.vendors AS V
                 ON P.Drug_Code=V.DrudSell_Code
GROUP BY P.Product_ID
HAVING COUNT(Vendor_ID)>1 ;


/* 7. Find all the customers who do not belong to any store. */
SELECT C.Customer_Id,E.Store_IDD
FROM worksadventures.customer AS C
LEFT JOIN worksadventures.sales_orderid AS SO
    ON C.Pro_Order_ID=SO.Order_Id
LEFT JOIN worksadventures.st_employee AS E
    ON E.Emplyee_Id=SO.Emp_Id
GROUP BY C.Customer_Id,E.Store_IDD;
    

/* 8. Find sales prices of product 718 that are less than the list price recommended for that product.  */
SELECT Product_ID
FROM worksadventures.products
WHERE Unit_Price>Sales_Price;

/* 9. Display product number, description and sales of each product in the year 2001. */
SELECT P.Product_ID,P.Product_Name,P.Description,COUNT(P.Product_ID) AS QTY
FROM worksadventures.products AS P
JOIN worksadventures.sales_orderid AS SO
ON P.Product_ID=SO.Product_ID
WHERE YEAR(SO.Ship_date)=2001
GROUP BY P.Product_ID;

/*10. Build the logic on the above question to extract sales for each category by year. Fetch 
Product Name, Sales_2001, Sales_2002, Sales_2003.   */
SELECT P.Product_ID,P.Product_Name,YEAR(SO.Ship_date) AS SalesYear ,COUNT(P.Product_ID) AS QTY
FROM worksadventures.products AS P
JOIN worksadventures.sales_orderid AS SO
ON P.Product_ID=SO.Product_ID
WHERE YEAR(SO.Ship_date) IN (2001,2002,2003)
GROUP BY P.Product_ID,P.Product_Name,YEAR(SO.Ship_date)
ORDER BY P.Product_ID ;


