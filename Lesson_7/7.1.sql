insert into orders (user_id)
select id from users where name = 'Сергей';

insert into orders_products (order_id, product_id, total)
select LAST_INSERT_ID(), id, 4 from products
where name = 'Intel Core i5-7400';

insert into orders (user_id)
select id from users where name = 'Геннадий';

insert into orders_products (order_id, product_id, total)
select LAST_INSERT_ID(), id, 2 from products
where name = 'AMD FX-8320';

insert into orders (user_id)
select id from users where name = 'Мария';

insert into orders_products (order_id, product_id, total)
select LAST_INSERT_ID(), id, 3 from products
where name = 'Gigabyte H310M S2H';

select users.id, users.name
from users 
join orders 
on users.id = orders.user_id;