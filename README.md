# fetch-rewards-sr_data_analyst
This repository is a take home assessment for the Fetch Rewards Senior Data Analyst position.

### Data Exploration

The data provided for this take home is easy to understand, however there are some data quality issues that I found. The steps I took can be seen in the [.ipynb file]() of this github repository. For the CSV's provided, I read them in with pandas and checked on datatypes and percentage of null values. Some of the datetime fields needed to be stripped of a 'Z' which denotes UTC time before converting to a datetime. Of the dataframes, it was most concerning that `Brand` and `Manufacturer` in the brands table is null 27% of the time. 

### SQL Queries

After exploring the data with pandas, I exported as CSV's and created queries in SQL. Those can be found here: [top_brands_acct_age](), [top_brands_21](), and [power_users](). While determining top brands by sales for users over 21, I noticed that there were a lot of `BIRTH_DATE` values that were not null, but unrealistic. Some users had an age of 115 years old. This is likely due to a date slider starting at a certain date, and users not setting it to their actual birth date. 

### Stakeholder Email

