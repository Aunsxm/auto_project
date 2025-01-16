# auto_project

<br>

## 목차
1. [📊기획](#%EA%B8%B0%ED%9A%8D)
2. [🧰설계](#%EC%84%A4%EA%B3%84)
3. [💻쿼리연습문제](#쿼리-연습-문제)
4. [🧪테스트](#테스트)
5. [🤔고찰](#고찰)
6. [🛠️트러블슈팅](#트러블-슈팅)
7. [🌐개발 환경](#-%EA%B0%9C%EB%B0%9C-%ED%99%98%EA%B2%BD)




---
<br>

## 팀원
|<img src="https://avatars.githubusercontent.com/u/98368034?v=4" width="150" height="150"/>|<img src="https://avatars.githubusercontent.com/u/193404366?v=4" width="150" height="150"/>|<img src="https://avatars.githubusercontent.com/u/121565744?v=4" width="150" height="150"/>|<img src="https://avatars.githubusercontent.com/u/129049084?v=4" width="150" height="150"/>|
|:-:|:-:|:-:|:-:|
|장수현<br/>[@Aunsxm](https://github.com/adf123124)|지수근<br/>[@SuGeunJee](https://github.com/SuGeunJee)|이은정<br/>[@eundeom](https://github.com/eundeom)|민정인<br/>[@min-jp](https://github.com/min-jp)|


<br>

## 📝 기획
"가상의 BMW 정비 데이터베이스를 활용한 SQL 정규표현식 실습 교안"

본 교안은 자동차 정비 서비스를 제공하는 가상의 BMW 대리점의 데이터베이스를 기반으로 <br>
<b>SQL 정규표현식(Regular Expression)의 실전 활용법을 학습</b>하기 위해 설계되었습니다.

데이터베이스는 <ins>대리점 정보, 차량 정보, 부품 정보, 정비 이력 정보</ins> 등 실제 업무 환경과 유사한 구조로 구성되어 있으며, <br>
각 테이블의 특정 컬럼들은 정규표현식을 활용한 데이터 검증과 조회가 필요한 상황을 포함하고 있습니다.

### ✏️ 학습 내용


![Screenshot 2025-01-16 at 11 59 05 PM](https://github.com/user-attachments/assets/8a7630f9-24e3-43b3-b342-d7cd090a9617)


**1. 회원 데이터 관리**
- 전화번호 패턴 검증
- 비밀번호 복잡도 규칙 적용
<br>

**2. 차량 정보 처리**
- 차량번호 형식 검증
- BMW 모델명 패턴 확인
<br>

**3. 부품 코드 시스템**
- 부품 종류별 코드 패턴 검색
<br>

**4. 정비 이력 관리**
- 날짜 형식 검증
- 비용 데이터 형식 확인
<br>

총 7개의 실습 문제를 통해 실무에서 자주 사용되는 정규표현식 패턴을 학습하고, 데이터 품질 관리와 검색 기능 구현에 필요한 SQL 활용 능력을 향상시킬 수 있습니다.

<br>

## 🛠 설계
### ⚙ ERD
![image (2)](https://github.com/user-attachments/assets/6120534a-765c-4f37-a347-15d25300f65e)

<br>


### 📋 Table Info

---

**1. 대리점 정보 테이블 (car_centers)**
 
| 컬럼 이름 | 데이터 타입 | 설명 |
| --- | --- | --- |
| `car_center_id` | INT (AUTO_INCREMENT, PRIMARY KEY) | 대리점의 고유 식별자 (자동 증가 값). |
| `name` | VARCHAR(50) | 대리점 이름. |
| `tel` | VARCHAR(15) | 대리점 전화번호. |
| `passwd` | VARCHAR(30) | 대리점 로그인용 비밀번호. |

<br>

 **2. 차량 정보 테이블 (vehicles)**
 
| 컬럼 이름 | 데이터 타입 | 설명 |
| --- | --- | --- |
| `vehicle_id` | INT (AUTO_INCREMENT, PRIMARY KEY) | 차량의 고유 식별자 (자동 증가 값). |
| `car_center_id` | INT | 차량을 관리하는 대리점의 고유 식별자. |
| `car_number` | VARCHAR(10) | 차량 번호판 정보. |
| `model` | VARCHAR(50) | 차량 모델명. |

**참조 관계**

- `car_center_id`는 **car_centers** 테이블의 `car_center_id`를 참조하여 대리점과 차량 간의 관계를 정의합니다.

<br>

**3. 부품 정보 테이블 (parts)**

| 컬럼 이름 | 데이터 타입 | 설명 |
| --- | --- | --- |
| `part_id` | INT (AUTO_INCREMENT, PRIMARY KEY) | 부품의 고유 식별자 (자동 증가 값). |
| `part_name` | VARCHAR(100) | 부품 이름. |
| `part_code` | VARCHAR(50) (UNIQUE) | 부품의 고유 코드 (중복 불가). |
| `price` | VARCHAR(100) | 부품 가격. |

<br>

**4. 정비 이력 테이블 (maintenance_history)**

| 컬럼 이름 | 데이터 타입 | 설명 |
| --- | --- | --- |
| `history_id` | INT (AUTO_INCREMENT, PRIMARY KEY) | 정비 이력의 고유 식별자 (자동 증가 값). |
| `vehicle_id` | INT | 정비를 받은 차량의 고유 식별자. |
| `service_date` | DATE | 정비 날짜. |
| `cost` | VARCHAR(20) | 정비 비용. |
| `part_id` | VARCHAR(50) | 사용된 부품의 고유 코드. |

<br>

---

<br>

## 쿼리 연습 문제 - 정답 추후 공개

[📃Notion](https://www.notion.so/f44120c1fe394664a2f44846a53a1195?pvs=21)

<br>

---

## 고찰

### 🖥️ VirtualBox 가상 네트워크 설정: NAT 네트워크와 어댑터 브릿지 비교

가상 머신(VirtualBox) 내에 설치된 MySQL 데이터베이스를 팀원들이 외부에서 접근하여 사용할 수 있도록 설정하는 과정을 진행했습니다.

초기에는 **NAT**의 포트포워딩 방식을 사용했으나, NAT 환경에서는 외부 PC에서 VirtualBox 가상머신에 직접 접속이 불가능하다는 한계를 발견했습니다.

이에 따라 **NAT 네트워크**와 **어댑터 브릿지** 두 가지 방식을 시도하며 문제를 해결하고자 했습니다. 아래는 각 방식의 설정 과정과 장단점을 정리한 내용입니다.

---

### 🌐 NAT 네트워크

**NAT 네트워크**는 기존 NAT 설정과 달리 여러 가상머신이 동일한 가상 네트워크를 공유하도록 지원하는 방식입니다. 이는 가상머신 간 통신이 필요한 환경에서 유용하지만, 외부 네트워크와의 연결에는 추가적인 설정이 필요합니다.

**주요 특징**

- **포트포워딩 필요**: 외부에서 가상머신에 접근하기 위해 특정 포트를 가상머신으로 연결해야 함.
- **가상 네트워크 환경**: 호스트(PC) 내부에서 가상 네트워크를 구성하여 외부 접근 시 방화벽 규칙 및 인바운드 설정 필요.

**문제점 및 해결 과정**

1. **외부 접속 불가**: NAT 네트워크 사용 시, 우분투 가상머신 내부 IP 주소가 변경되므로, 기존 포트포워딩 설정이 유효하지 않았음.
2. **해결 방안**: 새로운 내부 IP 주소를 확인한 후, 포트포워딩 설정을 다시 적용해야 했으나, 이 과정을 처음에 간과하여 외부 접속에 실패.

**결론**

NAT 네트워크는 가상머신 간 통신에 적합하지만, 외부 네트워크 연결이 목적이라면 부적합한 방식으로 판단되었습니다.

---

### 🔗 어댑터 브릿지

**어댑터 브릿지**는 가상머신이 호스트(PC)의 실제 네트워크 어댑터를 공유하여 물리 네트워크에 직접 연결되도록 설정하는 방식입니다.

**주요 특징**

- **실제 네트워크 연결**: 가상머신이 호스트와 동일한 네트워크 범위를 공유하며, 외부망(공유기)으로부터 IP를 직접 할당받음.
- **포트포워딩 불필요**: 외부 네트워크에서 가상머신 IP를 통해 직접 접근 가능.

**결과 및 단점**

- **외부 접속 성공**: 어댑터 브릿지 설정 후, 가상머신에 할당된 IP를 통해 정상적으로 접근 가능했음.
- **보안성 문제**: 가상머신이 물리 네트워크에 직접 연결되므로, NAT에 비해 보안성이 낮아질 수 있음.

---

### 📊 NAT 네트워크 vs 어댑터 브릿지

| 구분 | **NAT 네트워크** | **어댑터 브릿지** |
| --- | --- | --- |
| **설정 목적** | 가상머신 간 통신 | 외부 네트워크 연결 |
| **IP 주소 할당** | 가상 네트워크 내부에서 자동 할당 | 물리 네트워크에서 직접 할당 |
| **포트포워딩** | 필수 | 불필요 |
| **외부 접속 가능성** | 포트포워딩 설정 필요 | 가상머신 IP를 통해 바로 접속 가능 |
| **보안성** | 상대적으로 높음 | 낮음 |
| **장점** | 가상머신 간 네트워크 공유 가능, 내부 네트워크 보호 | 설정 간편, 외부에서 직접 접속 가능 |
| **단점** | 외부 접속 설정 복잡, 포트포워딩 오류 가능성 | 낮은 보안성 |

---

### ✅ 결론

이번 과정을 통해 VirtualBox의 두 가지 네트워크 연결 방식을 비교하며 각 방식의 특징과 설정 방법을 학습할 수 있었습니다. 특히, 어댑터 브릿지가 외부 네트워크와의 연결에 적합한 방식임을 확인했으며, NAT 네트워크는 가상머신 간 통신에 적합한 환경이라는 점을 이해할 수 있었습니다.

# 📌 트러블 슈팅
## 💥 이슈
MySQL에서 정규표현식 사용 시 \d와 같은 Perl 스타일 패턴이 오류를 발생시켜서 정규 표현식이 제대로 적용되지 않았다.

-- 사진

## 원인 분석
MySQL은 두 가지 정규표현식 스타일을 지원한다.

**1. POSIX 스타일**
- MySQL의 기본 지원 문법
- [[:digit:]], [[:alpha:]] 등의 문자 클래스 사용
- 안정적이고 일관된 동작 보장
- 예: [[:digit:]], [0-9], [[:alpha:]]


**2. Perl 스타일**

- MySQL 8.0.4 버전부터 지원
- \d, \w, \s 등의 간단한 문법 사용
- 버전이나 환경에 따라 동작이 불안정할 수 있음
- 예: \d, \w, \s

하지만 현재 MySQL 버전은 8.0.4 임에도 불구하고, 쿼리 실행이 정상적으로 되지 않았다.
-- 사진

## 해결 방안
안정적인 쿼리 실행을 위해 MySQL 8.0.4 버전임에도 POSIX 스타일로 수정해보았다.

### 권장하는 방식 (POSIX)

```sql
SELECT name 
FROM car_centers 
WHERE tel REGEXP '^044-[0-9]{3,4}-[0-9]{4}$';
```

또는

```sql
SELECT name 
FROM car_centers 
WHERE tel REGEXP '^044-[[:digit:]]{3,4}-[[:digit:]]{4}$';
```

위와 같이 쿼리를 수정하니, SQL 쿼리가 정상 실행하는 것을 확인할 수 있었다.
-- 사진

따라서, MySQL에서는 코드의 이식성과 안정성을 위해 POSIX 스타일 정규표현식인  [0-9] 또는 [[:digit:]] 사용을 권장한다.


## 참고 문서

[MySQL 공식 문서 : Regular Expressions](https://dev.mysql.com/doc/refman/8.0/en/regexp.html) <br>
[MySQL 전방탐색 지원](https://www.popit.kr/경-mysql-전방탐색-지원-축)

---
## 🌐 개발 환경

| **역할**            | **종류**                                                                                                              |
|----------------------|-----------------------------------------------------------------------------------------------------------------------|
| 🤝 협업 도구         | ![Git](https://img.shields.io/badge/git-%23F05033.svg?style=for-the-badge&logo=git&logoColor=white) <br> ![GitHub](https://img.shields.io/badge/github-%23121011.svg?style=for-the-badge&logo=github&logoColor=white) |
| 🗄️ 데이터베이스      | ![MySQL](https://img.shields.io/badge/mysql-4479A1.svg?style=for-the-badge&logo=mysql&logoColor=white) <br> ![DBeaver](https://img.shields.io/badge/dbeaver-372923.svg?style=for-the-badge&logo=dbeaver&logoColor=white) |
| 💬 커뮤니케이션 도구 | ![Notion](https://img.shields.io/badge/Notion-%23000000.svg?style=for-the-badge&logo=notion&logoColor=white) <br> ![Slack](https://img.shields.io/badge/Slack-4A154B?style=for-the-badge&logo=slack&logoColor=white) |
| 🛠️ 개발 및 관리 도구 | ![MobaXterm](https://img.shields.io/badge/mobaxterm-2C2E34.svg?style=for-the-badge&logo=mobaxterm&logoColor=white) |
