-- top 5 brands (by sale) for users with accounts 6mos+

-- getting user information from users table

with users as (
  select
  id as user_id,
  CREATED_DATE
  from `fetch-data-analyst.fetch.users`
  where BIRTH_DATE is not null
  and id is not null
  group by user_id, CREATED_DATE, BIRTH_DATE 
)

-- getting receipt and product information

, receipt_brand_info as (
  select
  t.user_id,
  t.RECEIPT_ID,
  t.PURCHASE_DATE,
  t.SCAN_DATE,
  t.final_sale,
  p.BRAND,
  p.CATEGORY_1,
  p.CATEGORY_2

  from `fetch-data-analyst.fetch.txns` t
  left join `fetch-data-analyst.fetch.products` p
  on t.barcode = p.BARCODE
  where p.barcode is not null
)

, main as (
  select
  DATE_DIFF(DATE(rb.scan_date), DATE(u.CREATED_DATE), MONTH) AS acct_length_months,
  sum(rb.FINAL_SALE) as sale_amt,
  rb.brand

  from receipt_brand_info rb
  left join users u
  on rb.user_id = u.user_id

  group by u.user_id, rb.brand, u.created_date, rb.scan_date
)

select distinct
sale_amt,
brand
from main
where acct_length_months >= 6
order by sale_amt desc
limit 5
;


