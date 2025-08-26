--Answers to assignment given on Day 1

-- 1) List all the books that are written by Author Loni and has price less than 600.
SELECT * 
FROM Books
WHERE Author_Name = 'Loni'
  AND Cost < 600;

-- 2) List the Issue details for the books that are not returned yet.
SELECT * 
FROM Issue
WHERE Return_Date IS NULL;

-- 3) Update all the blank return_date with 31-Dec-06 excluding 7005 and 7006.
UPDATE Issue
SET Return_Date = TO_DATE('31-DEC-2006','DD-MON-YYYY')
WHERE Return_Date IS NULL
  AND Lib_Issue_Id NOT IN (7005, 7006);

-- 4) List all the Issue details that have books issued for more than 30 days.
SELECT * 
FROM Issue
WHERE Return_Date IS NOT NULL
  AND (Return_Date - Issue_Date) > 30;

-- 5) List all the books that have price in range of 500 to 750 and has category as Database.
SELECT * 
FROM Books
WHERE Cost BETWEEN 500 AND 750
  AND Category = 'Database';

-- 6) List all the books that belong to categories Science, Database, Fiction, Management.
SELECT * 
FROM Books
WHERE Category IN ('Science','Database','Fiction','Management');

-- 7) List all the members in the descending order of Penalty due on them.
SELECT * 
FROM Member
ORDER BY Penalty_Amount DESC;

-- 8) List all the books in ascending order of category and descending order of price.
SELECT * 
FROM Books
ORDER BY Category ASC, Cost DESC;

-- 9) List all the books that contain word SQL in the name of the book.
SELECT * 
FROM Books
WHERE UPPER(Book_Name) LIKE '%SQL%';

-- 10) List all the members whose name starts with R or G and contains letter I in it.
SELECT * 
FROM Member
WHERE (Member_Name LIKE 'R%' OR Member_Name LIKE 'G%')
  AND Member_Name LIKE '%I%';

-- 11) List the entire book name in Init cap and author in upper case in descending order of book name.
SELECT INITCAP(Book_Name) AS Book_Title,
       UPPER(Author_Name) AS Author
FROM Books
ORDER BY Book_Name DESC;

-- 12) List the Issue Details for all the books issued by member 101 with Issue_date and Return Date in format: ‘Monday, July, 10, 2006’.
SELECT Lib_Issue_Id, Book_No, Member_Id,
       TO_CHAR(Issue_Date, 'Day, Month, DD, YYYY') AS Issue_Date,
       TO_CHAR(Return_Date, 'Day, Month, DD, YYYY') AS Return_Date
FROM Issue
WHERE Member_Id = 101;

-- 13) List the data in the book table with category displayed as 
-- D for Database, S for Science, R for RDBMS and O for others.
SELECT Book_No, Book_Name, Author_Name, Cost,
       CASE 
         WHEN Category = 'Database' THEN 'D'
         WHEN Category = 'Science'  THEN 'S'
         WHEN Category = 'RDBMS'    THEN 'R'
         ELSE 'O'
       END AS Category_Code
FROM Books;

-- 14) List all the members that became members in the year 2006.
SELECT * 
FROM Member
WHERE TO_CHAR(Acc_Open_Date, 'YYYY') = '2006';

-- 15) List the Lib_Issue_Id, Issue_Date, Return_Date and No of days Book was issued.
SELECT Lib_Issue_Id, Issue_Date, Return_Date,
       (NVL(Return_Date, SYSDATE) - Issue_Date) AS Days_Issued
FROM Issue;

-- 16) Find the details of the member of the Library in the order of their joining.
SELECT * 
FROM Member
ORDER BY Acc_Open_Date;

-- 17) Display the count of total no of books issued to Member 101.
SELECT COUNT(*) AS Total_Books_Issued
FROM Issue
WHERE Member_Id = 101;

-- 18) Display the total penalty due for all the members.
SELECT SUM(Penalty_Amount) AS Total_Penalty
FROM Member;

-- 19) Display the total no of members.
SELECT COUNT(*) AS Total_Members
FROM Member;

-- 20) Display the total no of books issued.
SELECT COUNT(*) AS Total_Issued
FROM Issue;

-- 21) Display the average membership fees paid by all the members.
SELECT AVG(Fees_Paid) AS Avg_Fees
FROM Member;

-- 22) Display no of months between issue date and return date for all issue.
SELECT Lib_Issue_Id,
       MONTHS_BETWEEN(NVL(Return_Date, SYSDATE), Issue_Date) AS Months_Diff
FROM Issue;

-- 23) Display the length of member’s name.
SELECT Member_Id, Member_Name, LENGTH(Member_Name) AS Name_Length
FROM Member;

-- 24) Display the first 5 characters of membership_type for all members.
SELECT Member_Id, Membership_Type,
       SUBSTR(Membership_Type, 1, 5) AS First_Five
FROM Member;

-- 25) Display the last day of the month of issue date.
SELECT Lib_Issue_Id, Issue_Date,
       LAST_DAY(Issue_Date) AS Last_Day_Of_Month
FROM Issue;