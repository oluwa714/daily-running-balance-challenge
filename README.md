# Daily Running Balance Challenge

This coding challenge is to create a new time series reporting table that includes a daily balance of each of the 4 accounts.

## Assumptions

A raw ETL table of dates and transactions and the starting balances for each of the 4 accounts was provided for this challenge. For the sake of this challenge, Debits are counted as (+) values, and Credits are counted as (-) values
The final table only needs 3 Columns: Date, Daily Balance and Account. 

## Requirements

Supporting tables can be created in addition to the final table. however the challenge can be completed with onlyone additional table  
No hardcoded dates should be used

## Verification 

The final table should have 2920 total records
The daily balance for Account 3 should be 258,069.78 on 4/27/2019

## Data

The raw data for this challenge was stored in a Snowflake warehouse under an Accounts_Receivable table
There were roughly 12,000 transactions in the raw table. 
The final output table for this challenge is named Working_Capital. 

