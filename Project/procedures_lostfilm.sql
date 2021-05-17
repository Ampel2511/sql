delimiter //

drop procedure if exists  rating//
create procedure rating ()
begin
	update episodes set rating = (select avg(user_rating) from rating where rating.target_id = episodes.id);
	update seasons set rating = (select avg(rating) from episodes where episodes.season_id = seasons.id);
	update serials set rating = (select avg(rating) from seasons where seasons.serial_id = serials.id);
end//

drop procedure if exists  correcting_dates//
create procedure correcting_dates ()
begin
	UPDATE black_list SET updated_at = NOW() WHERE updated_at < created_at;
	UPDATE comments SET updated_at = NOW() WHERE updated_at < created_at;
	UPDATE content_types SET updated_at = NOW() WHERE updated_at < created_at;
	UPDATE episodes SET updated_at = NOW() WHERE updated_at < created_at;
	UPDATE favorites SET updated_at = NOW() WHERE updated_at < created_at;
	UPDATE messages SET updated_at = NOW() WHERE updated_at < created_at;
	UPDATE news SET updated_at = NOW() WHERE updated_at < created_at;
	UPDATE news_types SET updated_at = NOW() WHERE updated_at < created_at;
	UPDATE persons SET updated_at = NOW() WHERE updated_at < created_at;
	UPDATE photo SET updated_at = NOW() WHERE updated_at < created_at;
	UPDATE photo_types SET updated_at = NOW() WHERE updated_at < created_at;
	UPDATE professions SET updated_at = NOW() WHERE updated_at < created_at;
	UPDATE profiles SET updated_at = NOW() WHERE updated_at < created_at;
	UPDATE rating SET updated_at = NOW() WHERE updated_at < created_at;
	UPDATE season_statuses SET updated_at = NOW() WHERE updated_at < created_at;
	UPDATE seasons SET updated_at = NOW() WHERE updated_at < created_at;
	UPDATE serial_cast SET updated_at = NOW() WHERE updated_at < created_at;
	UPDATE serial_genres SET updated_at = NOW() WHERE updated_at < created_at;
	UPDATE serials SET updated_at = NOW() WHERE updated_at < created_at;
	UPDATE users SET updated_at = NOW() WHERE updated_at < created_at;
	UPDATE video SET updated_at = NOW() WHERE updated_at < created_at;
	UPDATE video_type SET updated_at = NOW() WHERE updated_at < created_at;
	UPDATE viewed_episodes SET updated_at = NOW() WHERE updated_at < created_at;
	UPDATE genres SET updated_at = NOW() WHERE updated_at < created_at;
end//

drop procedure if exists  photo_path//
create procedure photo_path ()
begin
	update photo set file_path = concat('http://dropbox.net/lostfilm/photo/','id',photo.id,'.jpeg');
end//

drop procedure if exists  video_path//
create procedure video_path ()
begin
	update video set file_path = concat('http://dropbox.net/lostfilm/video/','id',video.id,'.avi');
end//

drop procedure if exists season_status //
create procedure season_status ()
begin 
	declare i int default 1;
	while i <= 590 do
		if ((select premiere_date from seasons where id = i) > now()) then
			update seasons set
			season_status = 6 where id = i;
		elseif
			(date_add((select premiere_date from seasons where id = i), interval (select episodes from seasons where id = i) week)  > now()) then
			update seasons set
			season_status = 2 where id = i;
		elseif
			(date_add((select premiere_date from seasons where id = i), interval (select episodes from seasons where id = i) week)  < now()) then
			update seasons set
			season_status = 1 where id = i;
		end if;
		set i = i + 1;
	end while;
end //

drop procedure if exists serial_status //
create procedure serial_status ()
begin 
	declare i int default 1;
	while i <= 100 do
		if (2 in (select season_status from seasons where serial_id = i)) then
			update serials set serial_status = 2 where id = i;
		elseif
			(2 not in (select season_status from seasons where serial_id = i) and 6 in (select season_status from seasons where serial_id = i)) then
			update serials set serial_status = 3 where id = i;
		elseif
			(2 not in (select season_status from seasons where serial_id = i) and 6 not in (select season_status from seasons where serial_id = i)) then
			update serials set serial_status = 1 where id = i;
		elseif
			((select premiere_date from serials where id = i) > now()) then
			update serials set serial_status = 4 where id = i;
		end if;
		set i = i + 1;
	end while;
end //

delimiter ;
