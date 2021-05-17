-- 10 сериалов с самыми молодыми актерами.

select distinct
s.id as serial_id,
s.name as serial_name,
avg(timestampdiff(year, birthday, now())) over (partition by prof.name order by s.name) as avg_age
from serials as s
join serial_cast as sc
on s.id = sc.serial_id 
join persons as p 
on p.id = sc.person_id 
join professions as prof
on prof.id = p.profession order by avg_age limit 10;

-- 10 самых популярных актеров

select distinct
p.id as person_id,
concat(p.first_name, ' ', p.last_name) as name,
prof.name as profession_name,
count(sc.serial_id) over(partition by p.id order by prof.name) as roles_in_series
from persons as p
join professions as prof 
on p.profession = prof.id 
join serial_cast as sc 
on sc.person_id = p.id 
join serials as s
on s.id = sc.serial_id order by profession_name, roles_in_series desc limit 10;

-- 10 самых активных пользователей

select
user_id,
(select concat(first_name, ' ', last_name) from users where users.id = user_id) as Name,
(select count(id) from messages where from_user_id = profiles.user_id or to_user_id = profiles.user_id) as messages,
(select count(id) from favorites where favorites.user_id = profiles.user_id) as favorite_serials,
(select count(id) from comments where comments.user_id = profiles.user_id) as comments,
(select count(id) from viewed_episodes where viewed_episodes.user_id = profiles.user_id) as episodes
from profiles order by (favorite_serials + comments + messages + episodes) desc limit 10;


-- 10 самых комментируемых новостей

select
id,
name,
(select count(target_id) from comments where target_id = news.id and target_type = (select id from content_types where name = 'news')) as total_comment
from news order by total_comment desc limit 10;

-- 10 самых просматриваемых эпизодов

select 
id,
episode_id,
count(user_id) as total
from viewed_episodes group by episode_id order by total desc limit 10;