select 
p.user_id,
concat(u.first_name, ' ', u.last_name) as Name,
count(m.id) as messages,
count(posts.id) as posts,
count(media.id) as media,
count(cu.community_id) as community
from profiles as p
left join messages as m
on p.user_id = m.from_user_id or p.user_id = m.to_user_id 
left join posts
on p.user_id = posts.user_id 
left join media
on p.user_id = media.user_id 
left join communities_users  as cu 
on p.user_id = cu.user_id
left join users as u
on p.user_id = u.id
group by p.user_id 
order by (media + posts + messages + community) limit 10;