-- 1.Используем БД uni (скрипт создания представлен на уроке)
-- Вывести имя студента и имена  старост, которые есть на курсах, которые он проходит

use uni;
SELECT 
t.name as student,
t1.name as headman
FROM students t
JOIN Students2Courses t2 ON t.id = t2.student_id
JOIN courses t3 ON t2.course_id = t3.id
LEFT JOIN students t1 ON t3.headman_id = t1.id;
-- 2.Используем БД shop :
-- Выведите имена покупателей, которые сделали заказ.
-- Предусмотрите в выборке также имена продавцов.
-- Примечание: покупатели и продавцы должны быть из разных городов.
-- В выборке должно присутствовать два атрибута — cname, sname.
use shop;
SELECT
 t1.cname AS customer_name,
 t2.sname AS seller_name
FROM customers t1
JOIN orders t3 ON t1.cust_id = t3.cust_id
JOIN sellers t2 ON t2.sell_id = t3.sell_id
WHERE t1.city <> t2.city;

-- 3.Вывести имена покупателей которые ничего никогда не покупали.
-- Решить задачу двумя способами : через join и через подзапрос
-- a)join left
use shop;
SELECT 
t1.customer_name
FROM customers t1
LEFT JOIN orders t2 ON t1.cust_id = t2.cust_id
WHERE t2.cust_id IS NULL;

-- b) podzapros
SELECT 
customer_name
FROM customers
WHERE cust_id NOT IN (SELECT cust_id FROM orders);


