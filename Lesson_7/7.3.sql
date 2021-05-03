DROP TABLE IF EXISTS flights;
CREATE TABLE flights (
  id SERIAL PRIMARY KEY,
  `from` VARCHAR(255) COMMENT '����� ����������',
  `to` VARCHAR(255) COMMENT '����� ��������'
) COMMENT = '�����';

INSERT INTO flights (`from`, `to`) VALUES
('moscow', 'omsk'),
('novgorod', 'kazan'),
('irkutsk', 'moscow'),
('omsk', 'irkutsk'),
('moscow', 'kazan');

DROP TABLE IF EXISTS cities;
CREATE TABLE cities (
  id SERIAL PRIMARY KEY,
  label VARCHAR(255) COMMENT '��� ������',
  name VARCHAR(255) COMMENT '�������� ������'
) COMMENT = '������� �������';

INSERT INTO cities (label, name) VALUES
('moscow', '������'),
('irkutsk', '�������'),
('novgorod', '��������'),
('kazan', '������'),
('omsk', '����');

select
name_from.name,
name_to.name
from flights 
join cities as name_from
on flights.from = name_from.label
join cities as name_to
on flights.to = name_to.label;