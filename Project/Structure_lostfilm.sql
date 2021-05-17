create table serials(
id int unsigned not null auto_increment primary key comment '������������� ������',
name varchar (255) comment '�������� �������',
serial_description text comment '�������� �������',
premiere_date date comment '���� ��������',
rating decimal (2,1) comment '������� ������� �� ������ �������������',
serial_status int unsigned not null comment 'ID ������� �������',
site varchar (255) comment '����������� ����',
channel varchar (255) comment '���������, �� ������� ������������� ������',
country varchar (255) comment '������-����� �������',
created_at datetime default current_timestamp comment '����� �������� ������',
updated_at datetime default current_timestamp on update current_timestamp comment '����� ���������� ������'
) comment '�������';

create table seasons (
id int unsigned not null auto_increment primary key comment '������������� ������',
serial_id int unsigned not null comment '������ �� ������',
episodes int unsigned not null comment '���������� �����',
sequential_number int unsigned not null comment '���������� ����� ������',
premiere_date date comment '���� ��������',
season_status int unsigned not null  comment 'ID ������� ������',
rating decimal (2,1) comment '������� ������ �� ������ �������������',
download_link varchar (255) comment '������ �� ����������',
created_at datetime default current_timestamp comment '����� �������� ������',
updated_at datetime default current_timestamp on update current_timestamp comment '����� ���������� ������'
) comment '������';

create table episodes (
id int unsigned not null auto_increment primary key comment '������������� ������',
season_id int unsigned not null comment '������ �� ����� �������',
episode_number int unsigned not null comment '���������� ����� �����',
name varchar (255) comment '�������� �����',
episode_description text comment '�������� �����',
premiere_date date comment '���� ��������',
rating decimal (2,1) comment '������� ����� �� ������ �������������',
download_link varchar (255) comment '������ �� ����������',
created_at datetime default current_timestamp comment '����� �������� ������',
updated_at datetime default current_timestamp on update current_timestamp comment '����� ���������� ������'
) comment '�����';

create table users (
id int unsigned not null auto_increment primary key comment '������������� ������',
first_name varchar(100) comment '��� ������������',
last_name varchar(100) comment '������� ������������',
email varchar(100) comment '�����',
phone varchar(100) comment '�������',
nickname varchar(100) not null comment '����� ������������ �� �����',
created_at datetime default current_timestamp comment '����� �������� ������',
updated_at datetime default current_timestamp on update current_timestamp comment '����� ���������� ������'
) comment '������������';

create table profiles (
user_id int unsigned not null primary key comment '������ �� ������������',
gender enum ('M', 'F')  comment '���',
birthday date comment '���� ��������',
city varchar(100) comment '�����',
country varchar(100) comment '������',
created_at datetime default current_timestamp comment '����� �������� ������',
updated_at datetime default current_timestamp on update current_timestamp comment '����� ���������� ������'
) comment '�������';

create table favorites (
id int unsigned not null auto_increment primary key comment '������������� ������',
user_id int unsigned not null comment '������ �� ������������',
target_id int unsigned not null comment 'ID �������',
target_type int unsigned not null comment 'ID ���� �������',
created_at datetime default current_timestamp comment '����� �������� ������',
updated_at datetime default current_timestamp on update current_timestamp comment '����� ���������� ������'
) comment '���������';

create table rating (
id int unsigned not null auto_increment primary key comment '������������� ������',
user_id int unsigned not null comment '������ �� ������������, ������� �������� ������',
target_id int unsigned not null comment 'ID �������',
target_type int unsigned not null comment 'ID ���� �������',
user_rating int unsigned not null comment '������ �� ������������',
created_at datetime default current_timestamp comment '����� �������� ������',
updated_at datetime default current_timestamp on update current_timestamp comment '����� ���������� ������'
) comment '�������';

create table black_list (
id int unsigned not null auto_increment primary key comment '������������� ������',
user_id int unsigned not null comment '������ �� ���������� ����������',
target_user_id int unsigned not null comment '������ �� ���������������� ������������',
created_at datetime default current_timestamp comment '����� �������� ������',
updated_at datetime default current_timestamp on update current_timestamp comment '����� ���������� ������'
) comment '������ ������';

create table viewed_episodes (
id int unsigned not null auto_increment primary key comment '������������� ������',
user_id int unsigned not null comment '������ �� ������������',
episode_id int unsigned not null comment '������ �� �����',
created_at datetime default current_timestamp comment '����� �������� ������',
updated_at datetime default current_timestamp on update current_timestamp comment '����� ���������� ������'
) comment '������������� �����';

create table messages (
id int unsigned not null auto_increment primary key comment '������������� ������',
from_user_id int unsigned not null comment '������ �� ����������� ���������',
to_user_id int unsigned not null comment '������ �� ���������� ���������',
body text  comment '����� ���������',
created_at datetime default current_timestamp comment '����� �������� ������',
updated_at datetime default current_timestamp on update current_timestamp comment '����� ���������� ������'
) comment '���������';

create table comments (
id int unsigned not null auto_increment primary key comment '������������� ������',
user_id int unsigned not null comment '������ �� ������������',
body text not null comment '����� �����������',
target_id int unsigned not null comment 'ID �������, � �������� ���������� �����������',
target_type int unsigned not null comment 'ID ���� �������',
created_at datetime default current_timestamp comment '����� �������� ������',
updated_at datetime default current_timestamp on update current_timestamp comment '����� ���������� ������'
) comment '�����������';

create table photo (
id int unsigned not null auto_increment primary key comment '������������� ������',
name varchar (255)  not null comment '��������',
file_path varchar (255) not null comment '���� � �����',
type_id int unsigned not null comment '��� ����',
target_id int unsigned not null comment 'ID �������, � �������� ��������� ����',
target_type int unsigned not null comment 'ID ���� �������',
created_at datetime default current_timestamp comment '����� �������� ������',
updated_at datetime default current_timestamp on update current_timestamp comment '����� ���������� ������'
) comment '����';

create table video (
id int unsigned not null auto_increment primary key comment '������������� ������',
name varchar (255) not null comment '�������� �����',
video_description text  comment '������� �����',
file_path varchar (255)  comment '���� � �����',
type_id int unsigned not null comment '��� �����',
target_id int unsigned not null comment 'ID �������, � �������� ��������� �����',
target_type int unsigned not null comment 'ID ���� �������',
created_at datetime default current_timestamp comment '����� �������� ������',
updated_at datetime default current_timestamp on update current_timestamp comment '����� ���������� ������'
) comment '�����';

create table content_types (
id int unsigned not null auto_increment primary key comment '������������� ������',
name varchar (255) not null comment '�������� ���� ��������',
created_at datetime default current_timestamp comment '����� �������� ������',
updated_at datetime default current_timestamp on update current_timestamp comment '����� ���������� ������'
) comment '���� �������� �� �����';

create table photo_types (
id int unsigned not null auto_increment primary key comment '������������� ������',
name varchar (255) not null comment '�������� ���� ����',
created_at datetime default current_timestamp comment '����� �������� ������',
updated_at datetime default current_timestamp on update current_timestamp comment '����� ���������� ������'
) comment '���� ����';

create table video_type (
id int unsigned not null auto_increment primary key comment '������������� ������',
name varchar (255) not null comment '�������� ���� �����',
created_at datetime default current_timestamp comment '����� �������� ������',
updated_at datetime default current_timestamp on update current_timestamp comment '����� ���������� ������'
) comment '���� �����';

create table news_types (
id int unsigned not null auto_increment primary key comment '������������� ������',
name varchar (255) not null comment '�������� ���� ��������',
created_at datetime default current_timestamp comment '����� �������� ������',
updated_at datetime default current_timestamp on update current_timestamp comment '����� ���������� ������'
) comment '���� ��������';

create table genres (
id int unsigned not null auto_increment primary key comment '������������� ������',
name varchar (255) not null comment '�������� �����',
created_at datetime default current_timestamp comment '����� �������� ������',
updated_at datetime default current_timestamp on update current_timestamp comment '����� ���������� ������'
) comment '�����';

create table season_statuses (
id int unsigned not null auto_increment primary key comment '������������� ������',
name varchar (255) not null comment '�������� �������',
created_at datetime default current_timestamp comment '����� �������� ������',
updated_at datetime default current_timestamp on update current_timestamp comment '����� ���������� ������'
) comment '�����';

create table serial_genres (
serial_id int unsigned not null comment 'ID �������',
genre_id int unsigned not null comment 'ID �����',
created_at datetime default current_timestamp comment '����� �������� ������',
updated_at datetime default current_timestamp on update current_timestamp comment '����� ���������� ������'
) comment '����� �������';

create table news (
id int unsigned not null auto_increment primary key comment '������������� ������',
name varchar (255) not null comment '�������� �������',
head text not null comment '��������� �������',
body text not null comment '����� �������',
type_id int unsigned not null comment '��� �������',
target_id int unsigned not null comment 'ID �������, � �������� ��������� �������',
target_type int unsigned not null comment 'ID ���� �������',
created_at datetime default current_timestamp comment '����� �������� ������',
updated_at datetime default current_timestamp on update current_timestamp comment '����� ���������� ������'
) comment '�������';

create table persons (
id int unsigned not null auto_increment primary key comment '������������� ������',
first_name varchar (255) not null comment '���',
last_name varchar (255) not null comment '�������',
birthday date comment '���� ��������',
birth_place varchar(255) comment '����� ��������',
zodiac_sign varchar (50) comment '���� �������',
gender enum ('M', 'F')  comment '���',
height int comment '���� ��',
profession int unsigned not null comment 'ID ���������',
created_at datetime default current_timestamp comment '����� �������� ������',
updated_at datetime default current_timestamp on update current_timestamp comment '����� ���������� ������'
) comment '�����������';

create table professions (
id int unsigned not null auto_increment primary key comment '������������� ������',
name varchar (255) not null comment '�������� ���������',
created_at datetime default current_timestamp comment '����� �������� ������',
updated_at datetime default current_timestamp on update current_timestamp comment '����� ���������� ������'
) comment '���������';

create table serial_cast (
serial_id int unsigned not null comment 'ID �������',
person_id int unsigned not null comment 'ID �����������',
created_at datetime default current_timestamp comment '����� �������� ������',
updated_at datetime default current_timestamp on update current_timestamp comment '����� ���������� ������'
) comment '���������';



