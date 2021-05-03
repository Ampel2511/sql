select 
gender,
count(likes.id) as total_likes
from profiles 
join likes
on profiles.user_id = likes.user_id 
group by gender;