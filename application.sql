-- select
--  round(avg(amount), 0)
-- from
--  orders;

-- select
--  date_format(order_time, '%Y%m') as order_year_month,
--  round(avg(amount), 0) as average_customer_spend
-- from
--  orders
-- group by
--  date_format(order_time, '%Y%m')
-- order by order_year_month;

-- 13/118 自分の回答
-- select	
--  u.prefecture_id,
--  p.name,
--  round(avg(o.amount), 0) as average_customer_spend
-- from
--  users u
-- inner join
--  orders o
-- on u.id = o.user_id
-- inner join
--  prefectures p
-- on u.prefecture_id = p.id
-- group by
--  prefecture_id
-- order by prefecture_id;

-- select
--  pref.id as prefecture_id,
--  pref.name as prefecture_name,
--  round(avg(o.amount), 0) as average_customer_spend
-- from
--  orders o
-- inner join users u
--  on o.user_id = u.id
-- inner join prefectures pref
--  on u.prefecture_id = pref.id
-- group by
--  pref.id
-- order by
--  pref.id
-- ;

-- 自分の回答
-- select
--  pref.id as prefecture_id,
--  pref.name as prefecture_name,
--  date_format(o.order_time, '%Y%m') as order_year_month,
--  round(avg(o.amount), 0) as average_customer_spend
-- from
--  orders o
-- inner join users u
--  on o.user_id = u.id
-- inner join prefectures pref
--  on u.prefecture_id = pref.id
-- group by
--  pref.id,
--  date_format(order_time, '%Y%m')
-- order by
--  pref.id
-- ;

select
 pref.id as prefecture_id,
 pref.name as prefecture_name,
 date_format(o.order_time, '%Y%m') as order_year_month,
 round(avg(o.amount), 0) as average_customer_spend
from
 orders o
inner join users u
 on o.user_id = u.id
inner join prefectures pref
 on u.prefecture_id = pref.id
group by
 prefecture_id, order_year_month
order by
 prefecture_id, order_year_month
;