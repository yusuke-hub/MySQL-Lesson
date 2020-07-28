
select
 p.id,
 p.name,
 sum(product_qty),
 case
  when sum(product_qty) >= 20 then 'A'
  when sum(product_qty) >= 10 then 'B'
  else 'C'
 end as product_rank
from
 products p
left outer join
 order_details od
 on p.id = od.product_id;
 
-- select
--  p.id,
--  p.name,
--  case
--   when sum(od.product_qty) is null then 0
--   else sum(od.product_qty)
--  end as num
-- from
--  products p
-- left outer join
--  order_details od
-- on p.id = od.product_id
-- group by p.id;

-- 自分の回答
-- select
--  p.id,
--  p.name,
--  case
--   when count(*) >= 20 then 'A'
--   when count(*) >= 10 then 'B'
--   else 'C'
--  end as ranking
-- from products p
-- left outer join
--  order_details od
-- on p.id = od.product_id
-- group by p.id;d



Error Code: 1140. In aggregated query without GROUP BY, expression #1 of SELECT list contains nonaggregated column 'mydb.p.id'; this is incompatible with sql_mode=only_full_group_by
