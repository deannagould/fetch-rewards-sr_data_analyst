-- top 5 brands by receipts scanned for users 21+

-- getting user information from users table
-- flagging data quality issue with users table because there are user ages that are 115+ years old

with users as (
  select
  id as user_id,
  FLOOR(DATE_DIFF(CREATED_DATE, BIRTH_DATE, DAY) / 365) as user_age,
  CREATED_DATE
  from `fetch-data-analyst.fetch.users`
  where BIRTH_DATE is not null
  and FLOOR(DATE_DIFF(CREATED_DATE, BIRTH_DATE, DAY) / 365) >= 21
  and id is not null
  group by user_id, CREATED_DATE, BIRTH_DATE 
)

-- getting receipt and brand from product table

, receipt_brand_info as (
  select
  t.user_id,
  t.RECEIPT_ID,
  p.BRAND

  from `fetch-data-analyst.fetch.txns` t
  left join `fetch-data-analyst.fetch.products` p
  on t.barcode = p.BARCODE
  where p.barcode is not null
)

-- getting a count on receipt to get the number of receipts scanned
, main as (
  select
  count(distinct rb.receipt_id) as rcpt_ct,
  rb.brand

  from receipt_brand_info rb
  left join users u
  on rb.user_id = u.user_id

  where rb.brand is not null
  group by rb.brand
  order by count(rb.receipt_id) desc, rb.brand
  limit 5
)

select * from main
;
