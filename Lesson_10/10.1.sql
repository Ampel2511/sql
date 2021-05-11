use vk;

create index users_first_name_last_name_idx on users(first_name, last_name);
create index profiles_city_idx on profiles (city);
create index profiles_country_idx on profiles (country);