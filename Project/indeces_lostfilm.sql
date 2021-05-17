create index genres_name_idx on genres(name);

create index persons_birthday_idx on persons(birthday);

create index serials_premiere_date_idx on serials(premiere_date);

create index serials_rating_idx on serials(rating);

create index serials_channel_idx on serials(channel);

create index serials_country_idx on serials(country);

create index seasons_premiere_date_idx on seasons(premiere_date);

create index seasons_rating_idx on seasons(rating);

create index episodes_premiere_date_idx on episodes(premiere_date);

create index episodes_rating_idx on episodes(rating);

create index users_first_name_last_name_idx on users(first_name, last_name);

create index profiles_city_idx on profiles (city);

create index profiles_country_idx on profiles (country);

create index profiles_birthday_idx on profiles (birthday);


