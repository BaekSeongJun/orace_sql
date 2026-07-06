--1.사용자가 정의한 테이블 생성하기 (emp01) 속성(사원번호, 이름, 연봉)
CREATE TABLE EMP01(
    EMPNO NUMBER(4),
    NAME VARCHAR2(20),
    SALARY NUMBER(7,2)
);

SELECT * FROM EMP01;

--2.기존 테이블 복사(EMPLOYEES -> EMPLOYEES2)
CREATE TABLE employees2
AS 
SELECT * FROM employees;

--3. 테이블에 대한 정보가 기록된 테이블(TAB)
SELECT * FROM TAB;

--4. 테이블 컬럼 수정 (추가 ALTER ADD 컬럼, 수정 ALTER MODIFY 컬럼, 삭제 ALTER DROP 컬럼)

--ALTER TABLE table_name ADD(column_name data_type,expr...);
--<예> employees2 테이블에 문자 타입의 직급(JOB) 칼럼을 추가
DESC employees2;
ALTER TABLE employees2 ADD(job VARCHAR2(10));

--<문제> 이미 존재하는 employees2 입사일칼럼(CREDATE)를 날짜형 (DATE)로 추가하라.
ALTER TABLE employees2 ADD(credate DATE);

--ALTER TABLE로 기존 칼럼 수정
--ALTER TABLE명령어에 MODIFY절을 사용하여 컬럼을 수정한다. 데이터 타입, 크기를 변경할 수 있다.

--ALTER TABLE table_name MODIFY(column_name data_type,expr...);
--<예> 직급(JOB)을 최대 30자까지 입력할 수 있도록 크기 수정
ALTER TABLE employees2 MODIFY(job VARCHAR2(30));

--<예> 직급(JOB)의 타입을 NUMBER 수정
ALTER TABLE employees2 MODIFY(job NUMBER(10));

--ALTER TABLE로 기존 칼럼명 변경
--ALTER TABLE table_name
--RENAME COLUMN old_name TO new_name;
--<예> 직급(JOB)컬럼명을 JOB_COPY로 변경하시오.
ALTER TABLE employees2 RENAME COLUMN job TO job_copy;

--ALTER TABLE 기존 칼럼 삭제
--ALTER TABLE table_name DROP COLUMN column_name;
ALTER TABLE employees2 DROP COLUMN job_copy;

--5.테이블 삭제
-- DROP TABLE 테이블명;
DROP TABLE employees2;

--6. 테이블명을 변경한다.
--RENAME 현재테이블명 TO 바꿀테이블명
--<예> employees2 테이블이름을 employees3로 변경하시오.
RENAME employees2 TO employees3;

--7.테이블의 모든 로우를 제거하는 TRUNCATE문
-- DROP TABLE employees3;
-- TRUNCATE TABLE employees3;

SELECT * FROM employees3;
TRUNCATE TABLE employees3;
DROP TABLE employees3;


--<문제> 논리적 테이블 구조를 보고 물리적 테이블을 설계하시오.
CREATE TABLE TB_CUSTOMER(
    customer_cd CHAR(7) NOT NULL PRIMARY KEY,
    customer_nm VARCHAR2(20) NOT NULL,
    mw_flg CHAR(1) NOT NULL,
    birth_day CHAR(8) NOT NULL,
    phone_number VARCHAR2(16),
    email VARCHAR2(30),
    total_point NUMBER(10),
    red_dttm CHAR(14)
);

--학생 성적 테이블을 만들어 봅시다.
--1.학번의 (숫자)데이터는 중복되거나 null값을 허용하면 안 되고
--2.이름은 문자데이터며 null값을 허용하지 않고
--3.국어, 영어, 수학 컬럼을 number 타입으로 가지고 모두 다 null값을 허용하지 않습니다.
--4.단, 국어,영어,수학 컬럼에 데이터를 넣지 않으면 기본값으로 0을 갖습니다.
--총점과 평균 컬럼은 기본값을 0을 갖습니다.

CREATE TABLE STUDENT(
    student_num NUMBER(20) PRIMARY KEY,
    student_name VARCHAR2(4) NOT NULL,
    kor_score NUMBER(3) DEFAULT 0 NOT NULL,
    eng_score NUMBER(3) DEFAULT 0 NOT NULL,
    math_score NUMBER(3) DEFAULT 0 NOT NULL,
    score_sum NUMBER(3) DEFAULT 0,
    score_avg NUMBER(3) DEFAULT 0    
);

DESC STUDENT;