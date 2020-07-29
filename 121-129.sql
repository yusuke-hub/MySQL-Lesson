-- 121 新規データを1件追加する insert
-- insert into products(name, price) values('新商品A', 1000);
-- select * from products;

-- 122 列リストを省略して1件レコードを追加する
-- insert products values(1005, '新商品B',2000)

-- 123  行を複数追加する
-- insert into products(name, price)
-- values
-- 	('新商品C', 3000),
-- 	('新商品D', 4000),
-- 	('新商品E', 5000);
-- select * from products;

-- 124 データの更新 Update
-- select * from products;
-- セーフモードを解除
-- 実務で使う場合は注意
-- set sql_safe_updates = 0;d
-- update products set price = price * 0.9;
-- select * from products;

-- 125 データの更新「特定の条件に合致する行のデータを更新する」
-- ◯ 社長からの依頼
-- 商品idが3の商品名を、「SQL入門」に変えておいて
-- 構文: update テーブル名　set 列1 = 値1, [ 列2 = 値2... ][ where条件式 ]; 
-- select * from products where id = 3;
-- update products set name = 'SQL入門1' where id = 3;
-- select * from products where id = 3;

-- 126 データの更新「更新条件にサブクエリを使う」
-- update テーブル名 set 列1 = 値1, [ 列2 = 値2... ][ where 条件式 ];
-- select * from products; 
-- update
--  products
-- set
--  price = price * 1.05
-- where
--  id in
--  (
--  select
--   product_id
--  from
--   order_details
--  group by
--   product_id
--  having
--   sum(product_qty) >= 10
--  );
--  
--  select * from products;

-- 127 データの更新「行の削除」
-- ◯ 社長からの依頼
-- 今、商品に割り振られている商品カテゴリを使うのをやめるので、
-- 商品とカテゴリの紐付きを削除して欲しい
-- 構文: delete from テーブル名 [ where 削除条件 ]
-- select * from products_categories; 
-- delete from products_categories;
-- select * from products_categories;
-- * 注意点
-- deleteで削除したデータは、基本的には元に戻せない。
-- 大量のデータをdeleteする時に予想外に時間がかかる場合がある(10万件くらいから要注意)

-- 128 データの更新「条件を指定して行を削除」
-- ◯ 社長からの依頼
-- 商品ID1001は、間違いで登録してしまった物だから、削除して欲しい
-- delete from products where id = 1001;
-- select * from products;
-- insert products values(1001, '商品E',5000);
-- select * from products;

-- 129 データの更新「削除条件にサブクエリを使う」
-- ◯ 社長からの依頼
-- 1個も売れていない商品は、売るのをやめるので削除して
-- delete from テーブル名 [ where 削除条件 ]

-- * 自分の回答
-- delete
--  id  
-- from
--  products
-- where
--  id in(
-- 	select
-- 	 product_id
-- 	from
-- 	 order_details
-- 	where product_qty = 0
--     );


 
delete
from
 products
where
 id not in(
	SELECT 
		product_id
	FROM
		order_details	
	GROUP BY product_id
 );
 
 select * from products;