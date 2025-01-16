# auto_project

<br>

## 목차
1. [📊기획](#%EA%B8%B0%ED%9A%8D)
2. [🧰설계](#%EC%84%A4%EA%B3%84)
3. [💻쿼리연습문제](#쿼리-연습-문제)
4. [🧪테스트](#테스트)
5. [🤔고찰](#고찰)
6. [🛠️트러블슈팅](#트러블-슈팅)




---
<br><br>

## 팀원
|<img src="https://avatars.githubusercontent.com/u/98368034?v=4" width="150" height="150"/>|-|<img src="https://avatars.githubusercontent.com/u/121565744?v=4" width="150" height="150"/>|-|
|:-:|:-:|:-:|:-:|
|장수현<br/>[@Aunsxm](https://github.com/adf123124)|ㅇㅇ|@eundeom<br/>[@eundeom](https://github.com/eundeom)|ㅇㅇ|


<br><br>

## 기획
저희 auto_project는 자동차 정비의 관한 DB를 활용하여 특수환 상황에서 정규표현식을 연습하고, 학습하기 위한 교안입니다. 총 7문제로 이루어져 있으며 

<br><br>

## 설계
### ⚙ ERD
![image (2)](https://github.com/user-attachments/assets/6120534a-765c-4f37-a347-15d25300f65e)

<br><br>

---

### Table Info

**1. 대리점 정보 테이블 (car_centers)**
 
| 컬럼 이름 | 데이터 타입 | 설명 |
| --- | --- | --- |
| `car_center_id` | INT (AUTO_INCREMENT, PRIMARY KEY) | 대리점의 고유 식별자 (자동 증가 값). |
| `name` | VARCHAR(50) | 대리점 이름. |
| `tel` | VARCHAR(15) | 대리점 전화번호. |
| `passwd` | VARCHAR(30) | 대리점 로그인용 비밀번호. |


 **2. 차량 정보 테이블 (vehicles)**
 
| 컬럼 이름 | 데이터 타입 | 설명 |
| --- | --- | --- |
| `vehicle_id` | INT (AUTO_INCREMENT, PRIMARY KEY) | 차량의 고유 식별자 (자동 증가 값). |
| `car_center_id` | INT | 차량을 관리하는 대리점의 고유 식별자. |
| `car_number` | VARCHAR(10) | 차량 번호판 정보. |
| `model` | VARCHAR(50) | 차량 모델명. |

**참조 관계**

- `car_center_id`는 **car_centers** 테이블의 `car_center_id`를 참조하여 대리점과 차량 간의 관계를 정의합니다.



### **3. 부품 정보 테이블 (parts)**

| 컬럼 이름 | 데이터 타입 | 설명 |
| --- | --- | --- |
| `part_id` | INT (AUTO_INCREMENT, PRIMARY KEY) | 부품의 고유 식별자 (자동 증가 값). |
| `part_name` | VARCHAR(100) | 부품 이름. |
| `part_code` | VARCHAR(50) (UNIQUE) | 부품의 고유 코드 (중복 불가). |
| `price` | VARCHAR(100) | 부품 가격. |



### **4. 정비 이력 테이블 (maintenance_history)**

| 컬럼 이름 | 데이터 타입 | 설명 |
| --- | --- | --- |
| `history_id` | INT (AUTO_INCREMENT, PRIMARY KEY) | 정비 이력의 고유 식별자 (자동 증가 값). |
| `vehicle_id` | INT | 정비를 받은 차량의 고유 식별자. |
| `service_date` | DATE | 정비 날짜. |
| `cost` | VARCHAR(20) | 정비 비용. |
| `part_id` | VARCHAR(50) | 사용된 부품의 고유 코드. |


---


<br><br>

## 쿼리 연습 문제

[📃Notion](https://www.notion.so/f44120c1fe394664a2f44846a53a1195?pvs=21)

<br><br>

---

## 테스트

- 추후 공개

## 고찰

## 트러블 슈팅
