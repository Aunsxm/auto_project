drop table car_centers;
drop table vehicles;
drop table parts;
drop table maintenance_history;

-- 대리점 정보 테이블 (car_centers)
CREATE TABLE car_centers (
    car_center_id int auto_increment PRIMARY KEY ,
    name VARCHAR(50) NOT NULL,
    tel VARCHAR(15) NOT NULL ,
    passwd VARCHAR(30) NOT NULL,
    check (tel REGEXP "[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}$")
);

-- 차량 정보 테이블 (vehicles)
CREATE TABLE vehicles (
    vehicle_id int auto_increment PRIMARY KEY,
    car_center_id int,
    car_number VARCHAR(10) NOT NULL,  													    
    model VARCHAR(50) NOT NULL, 
    FOREIGN KEY (car_center_id) REFERENCES car_centers(car_center_id)
);

-- 부품 정보 테이블 (parts)
CREATE TABLE parts (
    part_id int auto_increment PRIMARY KEY,
    part_name VARCHAR(100) NOT NULL, 
    part_code VARCHAR(50) NOT NULL UNIQUE, 
    price VARCHAR(100) NOT NULL
);

-- 정비 이력 테이블 (maintenance_history)
CREATE TABLE maintenance_history (
    history_id int auto_increment PRIMARY KEY,
    vehicle_id int,
    service_date DATE,
    cost VARCHAR(20),	
    part_id VARCHAR(50),
    FOREIGN KEY (vehicle_id) REFERENCES vehicles(vehicle_id),
    FOREIGN KEY (part_id) REFERENCES parts(part_code)
);

-- ------------* Data Dictionary *-----------------
select * from information_schema.TABLE_CONSTRAINTS tc 
where TABLE_NAME = 'maintenance_history';
-- ------------------------------------------------
desc car_centers;
select * from car_centers ;
insert into car_centers(name, tel, passwd) values ('서울 중구 대리점', '02-345-6789', 'Bmw0391!');
insert into car_centers(name, tel, passwd) values('대구 동구 대리점', '053-356-1235', 'Bm4567s!');
insert into car_centers(name, tel, passwd) values('대구 북구 대리점', '053-234-1235', 'Bm4567s!');
insert into car_centers(name, tel, passwd) values('대구 수성구 대리점', '053-125-9866', 'Bm4567sd');
insert into car_centers(name, tel, passwd) values('서울 마포구 대리점', '02-238-1838', 'bm4567s!');
insert into car_centers(name, tel, passwd) values('세종시 대리점', '044-298-0038', 'Bm4567s!');

DELETE FROM car_centers WHERE car_center_id=3;
-- -------------------------------------------------
desc vehicles;
select * from vehicles;
insert into vehicles(car_center_id, car_number, model) values(1, '123허 5678', '730d xDrive');
insert into vehicles(car_center_id, car_number, model) values(1, '123가 5678', '730e xDrive');
-- -------------------------------------------------
desc parts;
select * from parts;
DELETE FROM parts WHERE part_id=1;
insert into parts(part_name, part_code, price) values('타이어', 'BMti1010', '50,000');
insert into parts(part_name, part_code, price) values('배터리', 'BMba1011', '30,000');
insert into parts(part_name, part_code, price) values('에어컨', 'BMai1011', '100,000');
insert into parts(part_name, part_code, price) values('라디에이터', 'BMra1012', '80,000');
-- -------------------------------------------------
desc maintenance_history;
select * from maintenance_history;
-- (parts)part_id = (maintenance history)part_code
insert into maintenance_history(vehicle_id, service_date, cost, part_id) values(1, "2025-01-16", '50,000', 'BMti1010');
insert into maintenance_history(vehicle_id, service_date, cost, part_id) values(1, "2024-08-17", '50,000', 'BMti1010');

DELETE FROM BMW.maintenance_history
WHERE history_id=1;

-- -------------------------------------------------
select part_id from maintenance_history where cost REGEXP '^[4-6][0-9]{1}(,[0-9]{3})*$';
select * from maintenance_history;
select * from parts;
select part_name from parts where part_code IN (select part_id from maintenance_history where (cost REGEXP '^[4-6][0-9]{1}(,[0-9]{3})*$'));
