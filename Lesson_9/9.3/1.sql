delimiter //
create function hello ()
returns text not DETERMINISTIC
begin
	declare hour int;
	set hour = hour(now());
	case 
	when hour between 6 and 11
	return '������ ����';
	when hour between 12 and 17
	return '������ ����';
	when hour between 18 and 23
	return '������ �����';
	when hour between 0 and 5
	return '������ ����';
end case;
end//
delimiter ;