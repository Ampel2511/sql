select distinct
c.name,
count(cu.user_id) over(partition by c.id) as in_group,
first_value(p.birthday) over(partition by c.id order by birthday desc) as youngest,
last_value(p.birthday) over(partition by c.id order by birthday desc RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) as oldest,
count(u.id) over () as total,
count(cu.user_id) over(partition by c.id) / count(u.id) over () * 100 as '%%'
from communities as c
join communities_users as cu
on c.id = cu.community_id
join users as u 
on u.id = cu.user_id
join profiles as p 
on p.user_id = cu.user_id;
