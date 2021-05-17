create table serials(
id int unsigned not null auto_increment primary key comment 'Идентификатор строки',
name varchar (255) comment 'Название сериала',
serial_description text comment 'Описание сериала',
premiere_date date comment 'Дата премьеры',
rating decimal (2,1) comment 'Рейтинг сериала по мнению пользователей',
serial_status int unsigned not null comment 'ID статуса сериала',
site varchar (255) comment 'Официальный сайт',
channel varchar (255) comment 'Телеканал, на котором транслируется сериал',
country varchar (255) comment 'Страна-автор сериала',
created_at datetime default current_timestamp comment 'Время создания строки',
updated_at datetime default current_timestamp on update current_timestamp comment 'Время обновления строки'
) comment 'Сериалы';

create table seasons (
id int unsigned not null auto_increment primary key comment 'Идентификатор строки',
serial_id int unsigned not null comment 'Ссылка на сериал',
episodes int unsigned not null comment 'Количество серий',
sequential_number int unsigned not null comment 'Порядковый номер сезона',
premiere_date date comment 'Дата премьеры',
season_status int unsigned not null  comment 'ID статуса сезона',
rating decimal (2,1) comment 'Рейтинг сезона по мнению пользователей',
download_link varchar (255) comment 'Ссылка на скачивание',
created_at datetime default current_timestamp comment 'Время создания строки',
updated_at datetime default current_timestamp on update current_timestamp comment 'Время обновления строки'
) comment 'Сезоны';

create table episodes (
id int unsigned not null auto_increment primary key comment 'Идентификатор строки',
season_id int unsigned not null comment 'Ссылка на сезон сериала',
episode_number int unsigned not null comment 'Порядковый номер серии',
name varchar (255) comment 'Название серии',
episode_description text comment 'Описание серии',
premiere_date date comment 'Дата премьеры',
rating decimal (2,1) comment 'Рейтинг серии по мнению пользователей',
download_link varchar (255) comment 'Ссылка на скачивание',
created_at datetime default current_timestamp comment 'Время создания строки',
updated_at datetime default current_timestamp on update current_timestamp comment 'Время обновления строки'
) comment 'Серии';

create table users (
id int unsigned not null auto_increment primary key comment 'Идентификатор строки',
first_name varchar(100) comment 'Имя пользователя',
last_name varchar(100) comment 'Фамилия пользователя',
email varchar(100) comment 'Почта',
phone varchar(100) comment 'Телефон',
nickname varchar(100) not null comment 'Логин пользователя на сайте',
created_at datetime default current_timestamp comment 'Время создания строки',
updated_at datetime default current_timestamp on update current_timestamp comment 'Время обновления строки'
) comment 'Пользователи';

create table profiles (
user_id int unsigned not null primary key comment 'Ссылка на пользователя',
gender enum ('M', 'F')  comment 'Пол',
birthday date comment 'Дата рождения',
city varchar(100) comment 'Город',
country varchar(100) comment 'Страна',
created_at datetime default current_timestamp comment 'Время создания строки',
updated_at datetime default current_timestamp on update current_timestamp comment 'Время обновления строки'
) comment 'Профили';

create table favorites (
id int unsigned not null auto_increment primary key comment 'Идентификатор строки',
user_id int unsigned not null comment 'Ссылка на пользователя',
target_id int unsigned not null comment 'ID объекта',
target_type int unsigned not null comment 'ID типа объекта',
created_at datetime default current_timestamp comment 'Время создания строки',
updated_at datetime default current_timestamp on update current_timestamp comment 'Время обновления строки'
) comment 'Избранное';

create table rating (
id int unsigned not null auto_increment primary key comment 'Идентификатор строки',
user_id int unsigned not null comment 'Ссылка на пользователя, который поставил оценку',
target_id int unsigned not null comment 'ID объекта',
target_type int unsigned not null comment 'ID типа объекта',
user_rating int unsigned not null comment 'Оценка от пользователя',
created_at datetime default current_timestamp comment 'Время создания строки',
updated_at datetime default current_timestamp on update current_timestamp comment 'Время обновления строки'
) comment 'Рейтинг';

create table black_list (
id int unsigned not null auto_increment primary key comment 'Идентификатор строки',
user_id int unsigned not null comment 'Ссылка на инициатора блокировки',
target_user_id int unsigned not null comment 'Ссылка на заблокированного пользователя',
created_at datetime default current_timestamp comment 'Время создания строки',
updated_at datetime default current_timestamp on update current_timestamp comment 'Время обновления строки'
) comment 'Черный список';

create table viewed_episodes (
id int unsigned not null auto_increment primary key comment 'Идентификатор строки',
user_id int unsigned not null comment 'Ссылка на пользователя',
episode_id int unsigned not null comment 'Ссылка на серию',
created_at datetime default current_timestamp comment 'Время создания строки',
updated_at datetime default current_timestamp on update current_timestamp comment 'Время обновления строки'
) comment 'Просмотренные серии';

create table messages (
id int unsigned not null auto_increment primary key comment 'Идентификатор строки',
from_user_id int unsigned not null comment 'Ссылка на отправителя сообщения',
to_user_id int unsigned not null comment 'Ссылка на получателя сообщения',
body text  comment 'Текст сообщения',
created_at datetime default current_timestamp comment 'Время создания строки',
updated_at datetime default current_timestamp on update current_timestamp comment 'Время обновления строки'
) comment 'Сообщения';

create table comments (
id int unsigned not null auto_increment primary key comment 'Идентификатор строки',
user_id int unsigned not null comment 'Ссылка на пользователя',
body text not null comment 'Текст комментария',
target_id int unsigned not null comment 'ID объекта, к которому прикреплен комментарий',
target_type int unsigned not null comment 'ID типа объекта',
created_at datetime default current_timestamp comment 'Время создания строки',
updated_at datetime default current_timestamp on update current_timestamp comment 'Время обновления строки'
) comment 'Комментарии';

create table photo (
id int unsigned not null auto_increment primary key comment 'Идентификатор строки',
name varchar (255)  not null comment 'Название',
file_path varchar (255) not null comment 'Путь к файлу',
type_id int unsigned not null comment 'Тип фото',
target_id int unsigned not null comment 'ID объекта, к которому относится фото',
target_type int unsigned not null comment 'ID типа объекта',
created_at datetime default current_timestamp comment 'Время создания строки',
updated_at datetime default current_timestamp on update current_timestamp comment 'Время обновления строки'
) comment 'Фото';

create table video (
id int unsigned not null auto_increment primary key comment 'Идентификатор строки',
name varchar (255) not null comment 'Название видео',
video_description text  comment 'Опиание видео',
file_path varchar (255)  comment 'Путь к файлу',
type_id int unsigned not null comment 'Тип видео',
target_id int unsigned not null comment 'ID объекта, к которому относится видео',
target_type int unsigned not null comment 'ID типа объекта',
created_at datetime default current_timestamp comment 'Время создания строки',
updated_at datetime default current_timestamp on update current_timestamp comment 'Время обновления строки'
) comment 'Видео';

create table content_types (
id int unsigned not null auto_increment primary key comment 'Идентификатор строки',
name varchar (255) not null comment 'Название типа контента',
created_at datetime default current_timestamp comment 'Время создания строки',
updated_at datetime default current_timestamp on update current_timestamp comment 'Время обновления строки'
) comment 'Типы контента на сайте';

create table photo_types (
id int unsigned not null auto_increment primary key comment 'Идентификатор строки',
name varchar (255) not null comment 'Название типа фото',
created_at datetime default current_timestamp comment 'Время создания строки',
updated_at datetime default current_timestamp on update current_timestamp comment 'Время обновления строки'
) comment 'Типы фото';

create table video_type (
id int unsigned not null auto_increment primary key comment 'Идентификатор строки',
name varchar (255) not null comment 'Название типа видео',
created_at datetime default current_timestamp comment 'Время создания строки',
updated_at datetime default current_timestamp on update current_timestamp comment 'Время обновления строки'
) comment 'Типы видео';

create table news_types (
id int unsigned not null auto_increment primary key comment 'Идентификатор строки',
name varchar (255) not null comment 'Название типа новостей',
created_at datetime default current_timestamp comment 'Время создания строки',
updated_at datetime default current_timestamp on update current_timestamp comment 'Время обновления строки'
) comment 'Типы новостей';

create table genres (
id int unsigned not null auto_increment primary key comment 'Идентификатор строки',
name varchar (255) not null comment 'Название жанра',
created_at datetime default current_timestamp comment 'Время создания строки',
updated_at datetime default current_timestamp on update current_timestamp comment 'Время обновления строки'
) comment 'Жанры';

create table season_statuses (
id int unsigned not null auto_increment primary key comment 'Идентификатор строки',
name varchar (255) not null comment 'Название статуса',
created_at datetime default current_timestamp comment 'Время создания строки',
updated_at datetime default current_timestamp on update current_timestamp comment 'Время обновления строки'
) comment 'Жанры';

create table serial_genres (
serial_id int unsigned not null comment 'ID сериала',
genre_id int unsigned not null comment 'ID жанра',
created_at datetime default current_timestamp comment 'Время создания строки',
updated_at datetime default current_timestamp on update current_timestamp comment 'Время обновления строки'
) comment 'Жанры сериала';

create table news (
id int unsigned not null auto_increment primary key comment 'Идентификатор строки',
name varchar (255) not null comment 'Название новости',
head text not null comment 'Заголовок новости',
body text not null comment 'Текст новости',
type_id int unsigned not null comment 'Тип новости',
target_id int unsigned not null comment 'ID объекта, к которому относится новость',
target_type int unsigned not null comment 'ID типа объекта',
created_at datetime default current_timestamp comment 'Время создания строки',
updated_at datetime default current_timestamp on update current_timestamp comment 'Время обновления строки'
) comment 'Новости';

create table persons (
id int unsigned not null auto_increment primary key comment 'Идентификатор строки',
first_name varchar (255) not null comment 'Имя',
last_name varchar (255) not null comment 'Фамилия',
birthday date comment 'Дата рождения',
birth_place varchar(255) comment 'Место рождения',
zodiac_sign varchar (50) comment 'Знак зодиака',
gender enum ('M', 'F')  comment 'Пол',
height int comment 'Рост см',
profession int unsigned not null comment 'ID профессии',
created_at datetime default current_timestamp comment 'Время создания строки',
updated_at datetime default current_timestamp on update current_timestamp comment 'Время обновления строки'
) comment 'Исполнители';

create table professions (
id int unsigned not null auto_increment primary key comment 'Идентификатор строки',
name varchar (255) not null comment 'Название профессии',
created_at datetime default current_timestamp comment 'Время создания строки',
updated_at datetime default current_timestamp on update current_timestamp comment 'Время обновления строки'
) comment 'Профессии';

create table serial_cast (
serial_id int unsigned not null comment 'ID сериала',
person_id int unsigned not null comment 'ID исполнителя',
created_at datetime default current_timestamp comment 'Время создания строки',
updated_at datetime default current_timestamp on update current_timestamp comment 'Время обновления строки'
) comment 'Профессии';



