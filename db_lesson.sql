
-- Q1
create table departments(
department_id INT unsigned auto_increment primary key,
name VARCHAR(20),
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Q2
alter table people
add column department_id int unsigned after email;

-- Q3
insert into departments (name)
values
('営業'),
('開発'),
('経理'),
('人事'),
('情報システム');

insert into people (department_id, name)
values
(1, '営業1'),
(1, '営業2'),
(1, '営業3'),
(2, '開発1'),
(2, '開発2'),
(2, '開発3'),
(2, '開発4'),
(3, '経理1'),
(4, '人事1'),
(5,'情報システム1');

insert into reports (person_id, content)
values
(1, 'ああああああああああああ'),
(2, 'いいいいいいいいいいいい'),
(3, 'うううううううううううう'),
(4, 'ええええええええええええ'),
(5, 'おおおおおおおおおおおお'),
(6, 'カカかかかカカカカカカか'),
(7, '聞き聞ききききききききき'),
(8, 'クククククくくくくくくく'),
(9, 'けけけけけけけけけけけけ'),
(10, 'ここここここここここここ');

-- Q4
update people
set department_id = 1
where name = '鈴木たかし';

update people
set department_id = 2
where name = '田中ゆうこ';

update people
set department_id = 3
where name = '福田だいすけ';

update people
set department_id = 4
where name = '豊島はなこ';

update people
set department_id = 5
where name = '不思議沢みちこ';

-- Q5
select name, age
from people
where gender = 1
order by age desc;


-- Q6
SELECT
  `name`, `email`, `age`
FROM
  `people`
WHERE
  `department_id` = 1
ORDER BY
  `created_at`;

peopleテーブルの中から
営業部のレコードのみ選択し
名前、メールアドレス、年齢のカラムを表示し
降順順に並べる。

-- Q7
select name
from people
where gender = 2 && age between 20 and 29;
or gender = 1 && age between 40 and 49;

-- Q8
select *
from people 
where department_id = 1
order by age asc;

-- Q9
select avg(age)
as average_age
from people 
where department_id = 2 && gender = 2;

-- Q10
select people.name, departments.name, reports.content
from people
inner join departments
on people.department_id = departments.department_id
inner join reports
on people.person_id = reports.person_id;

-- Q11
select people.name
from people
left outer join reports
on people.person_id = reports.person_id
where reports.person_id is null;