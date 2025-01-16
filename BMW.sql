drop table car_centers;
drop table vehicles;
drop table parts;
drop table maintenance_history;

-- 대리점 정보 테이블 (car_centers)
CREATE TABLE car_centers (
    car_center_id int auto_increment PRIMARY KEY ,
    name VARCHAR(50) NOT NULL,
    tel VARCHAR(15) NOT NULL,
    passwd VARCHAR(30) NOT NULL          
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
    price int
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


