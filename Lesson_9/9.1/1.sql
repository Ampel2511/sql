start transaction;
insert into sample.users select id, name from shop.users where id = 1;
delete from shop.users where id = 1;
commit;