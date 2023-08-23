USE hw_4;

SELECT * 
  FROM auto;

/* Задание № 1. Вывести на экран сколько машин каждого цвета для машин марок BMW и LADA */
SELECT COLOR, count(*)
  FROM auto
WHERE MARK = 'BMW' OR MARK = 'LADA'
GROUP BY COLOR;


/* Задание № 2. Вывести на экран марку авто и количество AUTO не этой марки */
SELECT a.MARK,
   (SELECT COUNT(MARK) 
    FROM AUTO b 
    WHERE a.MARK <> b.MARK) AS count_other
 FROM AUTO a
GROUP BY MARK;


/* Задание № 3.Напишите запрос, который вернет строки из таблицы test_a, id которых нет в таблице test_b, НЕ используя ключевого слова NOT. */

create table test_a (
    id INT, 
    data varchar(1)
);

create table test_b (
    id INT
);

insert into test_a(id, data) values
(10, 'A'),
(20, 'A'),
(30, 'F'),
(40, 'D'),
(50, 'C');

insert into test_b(id) values
(10),
(30),
(50);

SELECT * FROM test_a;
SELECT * FROM test_b;

SELECT * 
  FROM test_a 
LEFT JOIN test_b ON test_a.id = test_b.id
WHERE test_b.id IS NULL;
 
