--시퀀스 생성
--CREATE SEQUENCE sequence_name  -- 시퀀스 이름
--[START WITH n] ①              -- 시작값
--[INCREMENT BY n] ②            -- 증가값
--[{MAXVALUE n | NOMAXVALUE}] ③ -- 최대값
--[{MINVALUE n | NOMINVALUE}] ④ -- 최소값
--[{CYCLE | NOCYCLE}] ⑤         -- 최대값을 넘은 후 상황 cycle이면 처음부터
--[{CACHE n | NOCACHE}] ⑥       -- 캐쉬메모리(속도향상)


-- 테이블 설계 + 시퀀스설계 + 인데스설계 + (트리거, 프로시져, 함수 => 프로그램: 조건문, 반복문, 예외처리 ...)

--시퀀스설계(empseq, 초기값 1, 증가치 1, 최대값 1000, 최소값 1, 사이클 NO, cache 2

CREATE SEQUENCE empseq
START WITH 1
INCREMENT BY 1
MINVALUE 1
MAXVALUE 1000
NOCYCLE
CACHE 2;

--emp01을 삭제하고 employees 에서 employee_id, first_name, hire_date 구조만 복사해오기
DROP TABLE emp01;

CREATE TABLE EMP01
AS
SELECT employee_id, first_name, hire_date
FROM employees
WHERE 1 = 0;

-- 시퀀스를 이용해서 데이터를 입력
INSERT INTO emp01 VALUES(empseq.nextval, 'kdj', SYSDATE);

DESC emp01;
SELECT * FROM emp01;


SELECT * FROM user_tables;
SELECT * FROM user_constraints;
SELECT * FROM user_cons_columns;
SELECT * FROM user_sequences;

-- 현재 empseq가 얼마까지 설정되어있는지 확인 
-- 가상테이블을 통해서 확인하는 방법
-- CURRVAL : 현재 값을 반환 
-- NEXTVAL : 현재 시퀀스 값의 다음 값을 반환
SELECT empseq.currval FROM dual;

--dept_deq
CREATE SEQUENCE dept_seq
START WITH 10
INCREMENT BY 10
MINVALUE 0
MAXVALUE 30
NOCYCLE
CACHE 2;

-- DEPT01 테이블을 삭제하고, 새로 생성한다. 구조만 복사
-- department_id, department_name, location_id
DROP TABLE dept01;

CREATE TABLE dept01
AS
SELECT department_id, department_name, location_id
FROM departments
WHERE 1= 0;

DESC dept01;
SElECT * FROM dept01;

--dept01에 데이터를 삽입하시오
INSERT INTO dept01 VALUES (dept_seq.nextval, '관리과', 1);
INSERT INTO dept01 VALUES (dept_seq.nextval, '총무과', 2);
INSERT INTO dept01 VALUES (dept_seq.nextval, '서무과', 3);
INSERT INTO dept01 VALUES (dept_seq.nextval, '인사과', 4);

--dept_seq값이 MAXVALUE를 초과하였으므로 MAXVALUE를 1000으로 수정하시오
--ALTER SEQUENCE sequence_name 
--[INCREMENT BY n] 
--[{MAXVALUE n | NOMAXVALUE}] 
--[{MINVALUE n | NOMINVALUE}] 
--[{CYCLE | NOCYCLE}] 
--[{CACHE n | NOCACHE}]
ALTER SEQUENCE dept_seq
MAXVALUE 1000;

SELECT * FROM user_sequences;

-- 시퀀스 삭제 
--DROP SEQUENCE sequence_name;

--dept_seq 삭제
DROP SEQUENCE dept_seq;

