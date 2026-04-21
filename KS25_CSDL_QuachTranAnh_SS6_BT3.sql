/*
count(*) là để đếm số dòng, có thể sử dụng case when để cộng order time > 10
và stats = 'cancelled'
*/
create database ss6bai3;
use ss6bai3;
create table users(
user_id int primary key auto_increment,
order_time int not null,
stats varchar(50)
);
INSERT INTO users (order_time, stats) VALUES
(1, 'CANCELLED'), 
(36, 'CANCELLED'), 
(6, 'CANCELLED'), 
(18, 'CANCELLED'), 
(8, 'CANCELLED'), 
(1, 'CANCELLED'),
(2, 'COMPLETED'), 
(3, 'COMPLETED'), 
(5, 'COMPLETED'),
(12, 'COMPLETED'), 
(20, 'COMPLETED'),
(30, 'CANCELLED'), 
(1, 'COMPLETED');
select sum(case when order_time > 10 then order_time else 0 end) as total_orders,sum(case when stats = 'CANCELLED' then 1 else 0 end) as total_cancelled_orders
from users;