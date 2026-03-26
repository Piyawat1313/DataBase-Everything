insert into restaurants(res_name, location, rating)
values('Krapao Express', 'Bangkok', 4.5),
('Noodle Station', 'Nakorn Pathom', 3.8),
('Sushi Zen', 'Nonthaburi', 4.9);


insert into menus(res_id, menu_name, price, category)
values(1, 'Pad Kapao Beef', 65.00, 'Main'),
(1, 'Pad kapao Pork', 50.00, 'Main'),
(1, 'Fried Egg', 10.00, 'Side'),
(2, 'Boat Noodle', 45.00, 'Main'),
(3, 'Salmon Sashimi', 250.00, 'Special');



insert into orders(total_amount) values(125.00),(45.00),(250.00);



insert into order_details(order_id, menu_id, quantity)
values(1,1,1),(1,3,1),(2,4,1),(3,5,1);



-- จงหาร้านอาหารที่มี ค่าเฉลี่ยราคาเมนูอาหาร (AVG) สูงกว่า 100 บาท
select avg(price) 
from menus
group by price
having avg(price) > 100;


-- แสดงจำนวนเมนูทั้งหมดในแต่ละหมวดหมู่ (category) โดยเรียงลำดับจากหมวดที่มีเมนูมากที่สุดไปน้อยที่สุด
select menu_name, category
from menus
order by res_id desc;


-- จงแสดงรายชื่อ "ร้านอาหาร" และ "ชื่อเมนู" ทั้งหมดที่มีการสั่งซื้อใน order_id ที่ 1 
-- (ต้อง Join 3 ตาราง: restaurants -> menus -> order_details)
select restaurants.res_name, menus.menu_name
from restaurants 
join menus
on restaurants.res_id = menus.res_id
join order_details
on order_details.menu_id = menus.menu_id
where order_details.order_id = 1;




-- แสดงรายชื่อร้านอาหารทั้งหมด และจำนวนเมนูที่แต่ละร้านมี โดยถ้าบางร้านยังไม่มีเมนู ให้แสดงเป็น 0 (ใช้ LEFT JOIN)
select restaurants.res_name, count(menus.menu_id) as 'Result'
from restaurants
left join menus
on menus.res_id = restaurants.res_id
group by restaurants.res_name;


-- เนื่องจากร้านอาหารมีการทำโปรโมชั่น จงใช้คำสั่ง UPDATE เพื่อลดราคาเมนูในหมวด 'Main' ลง 10% สำหรับทุกเมนู
 -- ปิดโหมดความปลอดภัย
set SQL_SAFE_UPDATES = 0;

update menus 
set price = price * 0.90
where category = 'Main';

-- เปิดโหมดความปลอดภัย 
set SQL_SAFE_UPDATES = 1;



-- จงเพิ่มคอลัมน์ is_available (Boolean) ลงในตาราง menus เพื่อเช็คว่าเมนูนั้นหมดหรือไม่ โดยกำหนดค่าเริ่มต้นเป็น True
alter table menus add is_available boolean default true; 


-- ลองเขียนคำสั่งลบเมนูที่มีราคาต่ำกว่า 20 บาทออกให้หมด
delete from order_details
where menu_id in(select menu_id from menus where price < 20);

set SQL_SAFE_UPDATES = 0;
delete from menus where price < 20;
set SQL_SAFE_UPDATES = 1;


select * from menus;