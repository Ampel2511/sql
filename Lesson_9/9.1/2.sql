create view name as
select
c.name as catalog_name,
p.name as product_name
from products as p
join catalogs as c
on c.id = p.catalog_id;
select * from name;