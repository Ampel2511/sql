select catalogs.id, catalogs.name, products.name, products.description, products.catalog_id 
from products
join catalogs
on catalogs.id = products.catalog_id;