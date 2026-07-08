-- 무결성 제약조건(NOT NULL, UNIQUE, PRIMARY KEY, CHECK, FOEIGN KEY)

--1. NOT NULL 
--2. UNIQUE 제약 조건 == PRIMARY KEY 제약조건과 똑같다. (다른것 : NULL 허용)

-- EMP02테이블을 생성한다.(employees 복사)
CREATE TABLE EMP02
AS
SELECT * FROM employees;

--제약조건 설정 (employee_id에 PRIMARY KEY 제약조건을 설정한다.)
--제약조건 설정 (phone_nubmer에 UNIQUE 제약조건을 설정한다.)
ALTER TABLE EMP02
ADD CONSTRAINT pk_emp_id PRIMARY KEY(employee_id);

ALTER TABLE EMP02
ADD CONSTRAINT uk_emp_phone UNIQUE(phone_number);

--phone_number NOT NULL 제약조건을 설정한다.
ALTER TABLE EMP02
MODIFY phone_number NOT NULL;

--phone_number not null 제약조건을 삭제한다.
ALTER TABLE EMP02
MODIFY phone_number NULL;

--데이터 딕셔너리 (dba_xxx, all_xxx, user_xxx : tables, constraints, cons_columns)
SELECT * FROM user_constraints
WHERE table_name = 'EMP02';
SELECT * FROM user_cons_columns
WHERE TABLE_NAME = 'EMP02';
SELECT * FROM user_tables;

CREATE TABLE EMP03(
    empno NUMBER(4),
    ename VARCHAR2(20) NOT NULL,
    job VARCHAR2(20),
    CONSTRAINT uk_emp03_no UNIQUE(empno)
);

INSERT INTO EMP03 VALUES(NULL, 'kdj','programmer');
INSERT INTO EMP03 VALUES(1234, 'kdj','programmer');
INSERT INTO EMP03 VALUES(NULL, 'kdj2','db developer');

DELETE FROM EMP03
WHERE job = 'db developer';

UPDATE EMP03
SET empno = 0
WHERE empno IS NULL;

SELECT * FROM EMP03;

ALTER TABLE EMP03
MODIFY empno NOT NULL;

DROP TABLE EMP03;

DESC EMP02;

--3.PRIMARY KEY(NOT NULL, UNIQUE) -> 자동으로 INDEX 설정

--4. FOREIGN KEY (참조 무결성 제약조건)

CREATE TABLE DEPT(
    dept_num NUMBER(4),
    dept_name VARCHAR2(10),
    dept_location VARCHAR2(20) CONSTRAINT nn_dept_loc NOT NULL,
    CONSTRAINT pk_dept_num PRIMARY KEY(dept_num),
    CONSTRAINT uk_dept_name UNIQUE(dept_name)
);
INSERT INTO DEPT VALUES (10, '관리과' ,'서울');
INSERT INTO DEPT VALUES (20, '관리과2' ,'서울2');
INSERT INTO DEPT VALUES (30, '관리과3' ,'서울3');
INSERT INTO DEPT VALUES (40, '관리과4' ,'서울4');
SELECT * FROM DEPT;
DELETE FROM dept 
WHERE dept_num = 10;


CREATE TABLE EMP(
    emp_num NUMBER(4),
    emp_name VARCHAR2(10) NOT NULL,
    job_id VARCHAR2(10),
    salary NUMBER(10),
    dept_num NUMBER(4),
    CONSTRAINT pk_emp_num PRIMARY KEY(emp_num),
    CONSTRAINT fk_emp_dept_num FOREIGN KEY(dept_num) REFERENCES DEPT(dept_num) ON DELETE CASCADE
);

INSERT INTO EMP VALUES (1, 'kdj', '부장', 10000000, NULL);
INSERT INTO EMP VALUES (2, 'kdj2', NULL, NULL, 10);
DELETE FROM EMP
WHERE emp_num = 2;

UPDATE EMP
SET dept_num = 50
WHERE emp_num = 1;
SELECT * FROM EMP;


SELECT * FROM user_cons_columns
WHERE table_name = 'DEPT' OR table_name = 'EMP';

DROP TABLE DEPT;

-- CHECK 제약조건
-- EMP테이블에 gender char(1) default 'M' 추가하시오
ALTER TABLE EMP
ADD gender char(1) DEFAULT 'M';

-- EMP테이블에 gender에 CHECK 제약조건을 넣어주세요('M', 'F', 'O')
ALTER TABLE EMP
ADD CONSTRAINT ck_emp_gender CHECK(gender IN ('M', 'F', 'O'));

SELECT * FROM user_constraints
WHERE table_name = 'EMP';

SELECT * FROM user_cons_columns
WHERE table_name = 'EMP';

--EMP 테이블 GENDER CHECK 제약조건이 작동되는지 확인할것.
SELECT * FROM EMP;
--CHECK 'A' 제약조건에 위배가 됨
INSERT INTO EMP VALUES (3, 'kdj3', '부장3', 10000000, NULL, 'A');

--EMP 테이블에 score number(4) 여기 CHECK 제약조건을 걸어주시오(0~100)

ALTER TABLE EMP
ADD score NUMBER(4) DEFAULT 0;

ALTER TABLE EMP
ADD CONSTRAINT ck_emp_score CHECK( score BETWEEN 0 AND 100);
INSERT INTO EMP VALUES (4, 'kdJ4', '부장4', 10000000, 40, 'F', '100');

SELECT * FROM EMP;
DELETE FROM DEPT
WHERE DEPT_NUM = 40;

ALTER TABLE EMP
DROP CONSTRAINT fk_emp_dept_num ;

ALTER TABLE EMP
ADD CONSTRAINT fk_emp_dept_num FOREIGN KEY(dept_num) REFERENCES DEPT(dept_num) ON DELETE SET NULL;
-- FOREIGN KEY에 옵션 5가지 
--NO ACTION : 참조 테이블에 변화가 있어도 기본 테이블에는 아무 조취를 취하지 않는다.
--CASCADE : 참조 테이블의 튜플이 삭제되면 기본 테이블의 관련 튜플도 삭제되고, 속성이 변경되면 관련 튜플의 속성 값도 모두 변경된다.
--SET NULL : 참조 테이블에 변화가 있으면 기본 테이블의관련 튜플의 속성 값을 NULL로 변경한다.
--SET DEFAULT : 참조 테이블에 변화가 있으면 기본 테이블의 관련 튜플의 속성 값을 기본값으로 변경한다.
--RESTRICT : 참조 테이블에 변화(삭제,수정)가 있으면 , 기본테이블경우 데이터 삭제나 수정 불가

CREATE TABLE V_CUSTOMER(
    customer_num NUMBER(6),
    name VARCHAR2(10) NOT NULL,
    age NUMBER(3) DEFAULT 0 NOT NULL CHECK(age BETWEEN 0 AND 100),
    phone_number CHAR(13),
    address VARCHAR2(30),
    CONSTRAINT pk_customer_num PRIMARY KEY(customer_num),
    CONSTRAINT uk_customer_phone UNIQUE(phone_number)
);

CREATE TABLE VIDEO(
    video_num NUMBER(5),
    title VARCHAR2(50) NOT NULL,
    genre VARCHAR2(30),
    pay NUMBER(7),
    lend_state NUMBER(1),
    make_company VARCHAR2(50),
    make_date DATE,
    view_age NUMBER(1),
    CONSTRAINT pk_video_num PRIMARY KEY(video_num)
);

CREATE TABLE LEND_RETURN(
    lr_code NUMBER(5),
    c_num NUMBER(5),
    v_num NUMBER(5),
    lend_date DATE,
    return_date DATE,
    total_pay NUMBER(7),
    CONSTRAINT pk_lr_code PRIMARY KEY(lr_code),
    CONSTRAINT fk_lr_c_num FOREIGN KEY(c_num) REFERENCES V_CUSTOMER(customer_num) ON DELETE CASCADE,
    CONSTRAINT fk_lr_v_num FOREIGN KEY(v_num) REFERENCES VIDEO(video_num) ON DELETE SET NULL
);