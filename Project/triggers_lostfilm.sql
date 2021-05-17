drop function if exists row_exists;
drop trigger if exists video_validation;
drop trigger if exists photo_validation;
drop trigger if exists rating_validation;
drop trigger if exists favorites_validation;
drop trigger if exists news_validation;
drop trigger if exists comments_validation;

delimiter //

create function row_exists (target_id int, target_type int)
returns boolean reads sql data
begin
	case (select name from content_types where id = target_type)
		when 'video' then 
			return exists (select 1 from video where id = target_id);
		when 'photo' then 
			return exists (select 1 from photo where id = target_id);
		when 'serial' then 
			return exists (select 1 from serials where id = target_id);
		when 'episode' then 
			return exists (select 1 from episodes where id = target_id);
		when 'comment' then 
			return exists (select 1 from comments where id = target_id);
		when 'news' then 
			return exists (select 1 from news where id = target_id);
		when 'person' then 
			return exists (select 1 from persons where id = target_id);
		else
			return false;
	end case;
end //

create trigger video_validation before insert on video
for each row
begin 
	if not row_exists(new.target_id, new.target_type) then 
	signal sqlstate '45000'
	set message_text = "Error! Target table doesn't contain row id provided!";
	end if;
end //

create trigger photo_validation before insert on photo
for each row
begin 
	if not row_exists(new.target_id, new.target_type) then 
	signal sqlstate '45000'
	set message_text = "Error! Target table doesn't contain row id provided!";
	end if;
end //

create trigger rating_validation before insert on rating
for each row
begin 
	if not row_exists(new.target_id, new.target_type) then 
	signal sqlstate '45000'
	set message_text = "Error! Target table doesn't contain row id provided!";
	end if;
end //

create trigger favorites_validation before insert on favorites
for each row
begin 
	if not row_exists(new.target_id, new.target_type) then 
	signal sqlstate '45000'
	set message_text = "Error! Target table doesn't contain row id provided!";
	end if;
end //

create trigger news_validation before insert on news
for each row
begin 
	if not row_exists(new.target_id, new.target_type) then 
	signal sqlstate '45000'
	set message_text = "Error! Target table doesn't contain row id provided!";
	end if;
end //

create trigger comments_validation before insert on comments
for each row
begin 
	if not row_exists(new.target_id, new.target_type) then 
	signal sqlstate '45000'
	set message_text = "Error! Target table doesn't contain row id provided!";
	end if;
end //

delimiter //
