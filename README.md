# fetch-rewards-sr_data_analyst
This repository is a take home assessment for the Fetch Rewards Senior Data Analyst position.

### Data Exploration

The data provided for this take home is easy to understand, however there are some data quality issues that I found. The steps I took can be seen in the [.ipynb file]() of this github repository. For the CSV's provided, I read them in with pandas and checked on datatypes and percentage of null values. Some of the datetime fields needed to be stripped of a 'Z' which denotes UTC time before converting to a datetime. Of the dataframes, it was most concerning that `Brand` and `Manufacturer` in the brands table is null 27% of the time. 

### SQL Queries and Questions

After exploring the data with pandas, I exported as CSV's and created queries in SQL. Those can be found here:[top_brands_21](), [top_brands_acct_age](), and [power_users](). 

1. What are the top 5 brands by receipts scanned among users 21 and over?

While determining top brands by sales for users over 21, I noticed that there were a lot of `BIRTH_DATE` values that were not null, but unrealistic. Some users had an age of 115 years old. This is likely due to a date slider starting at a certain date, and users not setting it to their actual birth date. 

The top 5 brands by receipts scanned among users 21 and over were 1) Coca-Cola (527 receipts), 2) Great Value (384 receipts), 3) Pepsi (361 receipts), 4) Equate (341 receipts), and 5) Lay's (324 receipts). [top_brands_21]().

2. What are the top 5 brands by sales among users that have had their account for at least six months?

The top 5 brands by sales among users with an account age of 6+ months were:
1. CVS ($72)
2. Coors Light ($34.96)
3. Dove ($23.94)
4. Trident ($23.36)
5. Axe ($15.98)

[top_brands_acct_age]()

3. Who are Fetch’s power users?

Answering this open-ended question required an assumption. I defined Fetch's power users as those who scan the most receipts, and not by those who spend the most. There were 9 users that had scanned 6 receipts in the past 6 months, with a geography spread across the US. The states included New York, West Virginia, Tennessee, Wisconsin, Connecticut, Pennsylvania, and Georgia. 

[power_users]()



### Stakeholder Email

Hi Team,

I've been analyzing the data and wanted to share key findings and questions:

**Interesting Trend:** Soft drink brands (Coca-Cola, Pepsi) dominate, along with Walmart-owned brands (Great Value, Equate). Additional data on store locations in addition to names could provide more insights.

**Data Quality Issues:**
1. Brands Table: Brand and Manufacturer fields are null in 27% of cases—can these be cross-referenced with another table?
2. Barcode Data: Missing in 12% of transactions—does this mean no barcode exists for the entire transaction or just specific items?
3. User Birth Dates: Some dates (e.g., 1/1/1900, 11/1/1900) appear invalid. Is there a way to verify user ages, perhaps by prompting users in exchange for bonus Fetch points?

Would love any guidance on resolving these issues. Happy to discuss further if needed!

Best,
Deanna



