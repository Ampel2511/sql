create or replace view ser_prem_date as
select * from serials order by premiere_date desc; 

select * from ser_prem_date limit 10;

create or replace view most_blocked as
select *, count(target_user_id) as blocked from black_list group by user_id order by blocked desc;

select user_id, blocked from most_blocked limit 10;

blocked