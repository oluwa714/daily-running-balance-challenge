INSERT INTO Working_Capital (Date, Daily_Balance, Account)
SELECT Date,
       CASE 
             WHEN Accounts = 'Account1' THEN CAST(Balance AS NUMBER(38,2)) + 47742.37
             WHEN Accounts = 'Account2' THEN CAST(Balance AS NUMBER(38,2)) + 422.75
             WHEN Accounts = 'Account3' THEN CAST(Balance AS NUMBER(38,2)) + 5181.13
             WHEN Accounts = 'Account4' THEN CAST(Balance AS NUMBER(38,2)) + 7108874.05
       END Daily_Balance,
       Accounts
FROM(
    WITH dates_cte AS
    (
        SELECT (MIN(DATE::DATE)) Dates, (MAX(DATE::DATE)) End_Date
        FROM accounts_receivable
        UNION ALL
        SELECT Dates + 1, End_Date
        FROM dates_cte
        WHERE Dates + 1 <= End_Date
    )
    SELECT dates_cte.Dates as Date,
        tj1.Account Accounts,
        SUM(COALESCE(ar.Credit, 0)) Credit,
        SUM(COALESCE(ar.Debit, 0)) Debit,
        SUM(SUM(COALESCE(Debit,0)) - SUM(COALESCE(Credit, 0))) OVER (PARTITION BY tj1.Account ORDER BY dates_cte.Dates) AS Balance
    FROM dates_cte
    CROSS JOIN (SELECT DISTINCT Account FROM Accounts_Receivable) tj1
    LEFT JOIN Accounts_Receivable ar
        ON ar.Date = dates_cte.Dates
        AND ar.Account = tj1.Account
    GROUP BY tj1.Account, dates_cte.Dates
    ORDER BY dates_cte.Dates, tj1.Account
    )
    
SELECT * FROM Working_Capital;
