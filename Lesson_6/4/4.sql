select 
user_id, 
(select concat(first_name, ' ', last_name) from users where users.id = user_id) as Name,
birthday,
(select count(id) from likes where target_id = profiles.user_id and target_type = 'users') as likes
from profiles order by birthday desc limit 10;