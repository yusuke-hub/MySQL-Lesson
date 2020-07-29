-- 132 データベース構造の操作「データベースの追加」
-- 一般的には、1アプリケーション 1データベースalter
-- ex, book_storeという名前のデータベースを作成する
-- 構文: create database データベース名

-- show databases;
-- mydbがこれまでも学習で使用してきたデータベースalter
-- それ以外はMySQLが管理で使用しているデータベース
-- create database book_store;
-- show databases;

-- 133 データベース構造の操作「命名ルール」
-- データベースオブジェクト(データベース名、テーブル名、 列名など)の命名ルールについて学習する
-- ◯ データベースオブジェクトに使って良い文字
-- 半角アルファベット
-- 半角数字
-- アンダースコア（_) 
-- ex, ● users、mydb2、products_categories ✖︎_users、1users
-- mydb2のような付けた人しか意味がわからない数字は「マジックナンバー」と呼ばれ、実務では避ける傾向にある

-- 134 データベース構造の操作「テーブルの追加」
-- ex, booksという名前のテーブルを作成する
-- 列 id、title
-- use book_store;
-- create table books(id int not null auto_increment primary key, title varchar(255) not null);
-- 列名 id
-- 　int: 整数型
-- 　not null: nullを許可しない
-- 　auto_increment: idを自動的にふる
-- 　primary key: 主キーの設定
-- 列名　title
-- 　varchar(255):最大255文字の可変長文字列型
-- 　not null: nullを許可しない
-- show columns from books;

-- 135 データベース構造の操作「テーブル構造の変更」
-- 構文: alter table テーブル名 change 旧列名 新列名 データ型;
-- ex1, 書籍を管理するbooksテーブルに、価格を管理する列を追加
-- 列名: price、 データ型: intを追加
-- show columns from books;
-- create table books(price int);
-- alter table books add price int after id;
-- alter table books delete rprice int after price;
-- show columns from books;
-- alter table books change price unit_price int;
-- show columns from books;
-- 構文 alter table テーブル名 drop 列名;
-- alter table books drop unit_price;
-- show columns from books;

-- 136 データベース構造の操作「テーブルの削除＿
-- booksテーブルを削除する
-- 構文: drop table テーブル名
-- show tables;
-- drop table books;
-- show tables;
-- *削除したテーブルは基本的に簡単には普及できないので注意

-- 137 データベース構造の操作「データベースの削除」
-- ex, データベースbook_storeを削除する
-- 構文: drop database データベース名
show databases;
-- drop database book_store;

-- 138 データベース構造の操作「操作の注意点」
-- 操作は基本的には取り消せない
-- 　特に、実務において本番環境を操作するときは、サービスをメンテナンスモードにして
-- 　バックアップをとってから、alter table等を実行する
-- 想定外に時間がかかりシステムトラブルになる場合も
-- 　テスト環境でalter tableのテストをして問題点を洗い出してから、
-- 　実行するのがオススメ