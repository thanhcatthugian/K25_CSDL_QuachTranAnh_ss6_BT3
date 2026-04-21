/*
count(*) là để đếm số dòng, có thể sử dụng case when để cộng order time > 10
và stats = 'cancelled'
*/
create database ss6bai3;
use ss6bai3;
create table users(
user_id int primary key auto_increment,
user_name varchar(50)
);
insert into users(user_name)
values
('Nguyen Van A'),
('Tran Thi B');
create table orders(
user_id int,
foreign key(user_id) references users(user_id),
id int primary key auto_increment,
order_time int not null,
stats varchar(50)
);
INSERT INTO orders (user_id,order_time, stats) VALUES
(1,1, 'CANCELLED'), 
(1,36, 'CANCELLED'), 
(1,6, 'CANCELLED'), 
(1,18, 'CANCELLED'), 
(1,8, 'CANCELLED'), 
(1,1, 'CANCELLED'),
(1,2, 'COMPLETED'), 
(1,3, 'COMPLETED'), 
(2,5, 'COMPLETED'),
(2,12, 'COMPLETED'), 
(2,20, 'COMPLETED'),
(2,30, 'CANCELLED'), 
(2,1, 'COMPLETED');
select o.user_id, sum(case when o.order_time > 10 then o.order_time else 0 end) as total_orders,
sum(case when o.stats = 'CANCELLED' then 1 else 0 end) as total_cancelled_orders
from users as u inner join orders as o
group by o.user_id
having total_orders>=10 and total_cancelled_orders >=5;
drop database ss6bai3