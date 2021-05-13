drop table if exists logs;

create table logs (
  id int unsigned not null auto_increment primary key,
  table_name varchar(50) not null,
  data_id int unsigned not null,
  data_name varchar (255) not null,
  created_at datetime default current_timestamp 
  ) ENGINE = Archive;

drop trigger if exists users;
drop trigger if exists catalogs;
drop trigger if exists products;

delimiter //

create trigger users after insert on users
for each row
begin
    insert into logs (table_name, data_id, data_name)
   values ('users', new.id, new.name);
end//

create trigger catalogs after insert on catalogs
for each row
begin
    insert into logs (table_name, data_id, data_name)
   values ('catalogs', new.id, new.name);
end//

create trigger products after insert on products
for each row
begin
    insert into logs (table_name, data_id, data_name)
   values ('products', new.id, new.name);
end//

delimiter ;