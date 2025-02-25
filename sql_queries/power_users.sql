-- getting information from users table

with users as (
  select
  id as user_id,
  CREATED_DATE,
  STATE
  from `fetch-data-analyst.fetch.users`
)

-- main subquery will be getting counts of receipts scanned to use as a kpi to define a power user

, main as (
  select
  count(receipt_id) as receipt_count,
  users.user_id,
  users.state
  from `fetch-data-analyst.fetch.txns` txns
  join users on 
  txns.USER_ID = users.user_id
  group by users.user_id, users.state
  order by count(receipt_id) desc
)

select * from main