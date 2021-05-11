delimiter //
create function hello ()
returns text not DETERMINISTIC
begin
	declare hour int;
	set hour = hour(now());
	case 
	when hour between 6 and 11
	return 'Доброе утро';
	when hour between 12 and 17
	return 'Добрый день';
	when hour between 18 and 23
	return 'Добрый вечер';
	when hour between 0 and 5
	return 'Доброй ночи';
end case;
end//
delimiter ;