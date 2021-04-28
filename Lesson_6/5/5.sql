select
user_id,
(select concat(first_name, ' ', last_name) from users where users.id = user_id) as Name,
(select count(id) from messages where from_user_id = profiles.user_id or to_user_id = profiles.user_id) as messages,
(select count(id) from posts where user_id = profiles.user_id) as posts,
(select count(id) from media where media.user_id = profiles.user_id) as media,
(select count(community_id) from communities_users where communities_users.user_id = profiles.user_id) as community
from profiles order by (media + posts + messages + community) limit 10;