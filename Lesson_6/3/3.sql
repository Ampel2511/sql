select 
gender, 
sum((select count(user_id) from likes where likes.user_id = profiles.user_id)) as total
from profiles group by gender;
