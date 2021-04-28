desc profiles;
ALTER TABLE profiles
  ADD CONSTRAINT profiles_user_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id)
      ON DELETE CASCADE;

desc messages;
ALTER TABLE messages
  ADD CONSTRAINT messages_from_user_id_fk 
    FOREIGN KEY (from_user_id) REFERENCES users(id),
  ADD CONSTRAINT messages_to_user_id_fk 
    FOREIGN KEY (to_user_id) REFERENCES users(id);

desc communities_users;
ALTER TABLE communities_users
  ADD CONSTRAINT communities_users_community_id_fk 
    FOREIGN KEY (community_id) REFERENCES communities(id),
  ADD CONSTRAINT communities_users_user_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id);

desc friendship;
ALTER TABLE friendship
 ADD CONSTRAINT friendship_user_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id),
  ADD CONSTRAINT friendship_friend_id_fk 
    FOREIGN KEY (friend_id) REFERENCES users(id),
  ADD CONSTRAINT friendship_friendship_status_id_fk 
    FOREIGN KEY (friendship_status_id) REFERENCES friendship_statuses(id);
 
desc media;
 alter table media
 add constraint media_user_id_fk
 foreign key (user_id) references users(id),
 add constraint media_media_type_id_fk
 foreign key (media_type_id) references media_types(id);

desc posts;
alter table posts 
add constraint posts_user_id_fk
foreign key (user_id) references users(id),
add constraint posts_community_id_fk
foreign key (community_id) references communities(id),
add constraint posts_media_id_fk
foreign key (media_id) references media(id);

desc likes;
alter table likes 
add constraint likes_user_id_fk
foreign key (user_id) references users(id),
add constraint likes_target_id_users_fk
foreign key (target_id) references users(id),
add constraint likes_target_id_media_fk
foreign key (target_id) references media(id),
add constraint likes_target_id_posts_fk
foreign key (target_id) references posts(id),
add constraint likes_target_id_messages_fk
foreign key (target_id) references messages(id);

 