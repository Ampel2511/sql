alter table video
add constraint video_type_id_fk
foreign key (type_id) references video_type(id),
add constraint video_target_type_fk
foreign key (target_type) references content_types(id);

alter table photo
add constraint photo_type_id_fk
foreign key (type_id) references photo_types(id),
add constraint photo_target_type_fk
foreign key (target_type) references content_types(id);

alter table news
add constraint news_type_id_fk
foreign key (type_id) references news_types(id),
add constraint news_target_type_fk
foreign key (target_type) references content_types(id);

alter table serials
add constraint serials_serial_status_fk
foreign key (serial_status) references season_statuses(id);

alter table seasons
add constraint seasons_season_status_fk
foreign key (season_status) references season_statuses(id),
add constraint seasons_serial_id_fk
foreign key (serial_id) references serials(id);

alter table serial_genres
add constraint serial_genres_genre_id_fk
foreign key (genre_id) references genres(id),
add constraint serial_genres_serial_id_fk
foreign key (serial_id) references serials(id);

alter table serial_cast
add constraint serial_cast_person_id_fk
foreign key (person_id) references persons(id),
add constraint serial_cast_serial_id_fk
foreign key (serial_id) references serials(id);

alter table episodes 
add constraint episodes_season_id_fk
foreign key (season_id) references seasons(id);

alter table profiles 
add constraint profiles_user_id_fk
foreign key (user_id) references users(id);

alter table persons 
add constraint persons_profession_fk
foreign key (profession) references professions(id);

alter table comments 
add constraint comments_user_id_fk
foreign key (user_id) references users(id),
add constraint comments_target_type_fk
foreign key (target_type) references content_types(id);

alter table favorites 
add constraint favorites_user_id_fk
foreign key (user_id) references users(id),
add constraint favorites_target_type_fk
foreign key (target_type) references content_types(id);

alter table viewed_episodes 
add constraint viewed_episodes_user_id_fk
foreign key (user_id) references users(id),
add constraint viewed_episodes_episode_id_fk
foreign key (episode_id) references episodes(id);

alter table black_list 
add constraint black_list_user_id_fk
foreign key (user_id) references users(id),
add constraint black_list_target_user_id_fk
foreign key (target_user_id) references users(id);

alter table rating 
add constraint rating_user_id_fk
foreign key (user_id) references users(id),
add constraint rating_target_type_fk
foreign key (target_type) references content_types(id);

alter table messages 
add constraint messages_from_user_id_fk
foreign key (from_user_id) references users(id),
add constraint messages_to_user_id_fk
foreign key (to_user_id) references users(id);



