select 
profiles.user_id,
concat(users.first_name, ' ', users.last_name) as Name,
profiles.birthday,
count(likes.id) as total_likes
from profiles 
left join likes
on profiles.user_id = likes.target_id and target_type = 'users'
left join users
on profiles.user_id = users.id
group by profiles.user_id
order by profiles.birthday desc limit 10;