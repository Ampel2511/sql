drop table if exists users;

create table users (
id int unsigned not null auto_increment primary key,
name varchar (255),
created_at datetime default current_timestamp,
updated_at datetime default current_timestamp on update current_timestamp 
);

insert into users (name)
values
('Евгений'),
('Мария'),
('Олег'),
('Иван'),
('Егор'),
('Игорь'),
('Максим'),
('Елена'),
('Артем'),
('Ольга'),
('Надежда');

select count(*) 
from users as u 
join users as uu
join users as uuu
join users as uuuu
join users as uuuuu
join users as uuuuuu;


