select gender, count(*) as total
from profiles where profiles.user_id in (
select user_id from likes)
group by gender;