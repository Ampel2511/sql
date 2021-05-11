delimiter //

create trigger before_update before update on products
for each row
begin 
	if new.name is null and new.description is null then 
	signal sqlstate '45000'
	set message_text = 'product name and product description is NULL'
	end if;
end//

create trigger before_insert before insert on products
for each row
begin 
	if new.name is null and new.description is null then 
	signal sqlstate '45000'
	set message_text = 'product name and product description is NULL'
	end if;
end//

delimiter ;