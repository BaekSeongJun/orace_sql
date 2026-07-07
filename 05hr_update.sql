-- 2. UPDATE문
-- UPDATE table_name
-- SET column_name1 = value1, column_name2 = value2, …
-- WHERE conditions;

--EMPLOYEES 테이블을 EMP 복사
CREATE TABLE EMP
AS 
SELECT * FROM EMPLOYEES;

DESC EMP;
SELECT * FROM EMP;

--제약조건을 걸고 해제하는 기능
--EMP EMPLOYEE_ID 에 PRIMAY KEY 제약조건 
ALTER TABLE EMP
ADD CONSTRAINT pk_emp_id PRIMARY KEY(employee_id);

ALTER TABLE EMP
DROP CONSTRAINT pk_emp_id;

--phone_number NOT NULL 제약조건
ALTER TABLE EMP
MODIFY (phone_number CONSTRAINT nn_emp_phone NOT NULL);

ALTER TABLE EMP
DROP CONSTRAINT nn_emp_phone;

--제약조건 확인 방법
SELECT * FROM user_constraints 
WHERE table_name = 'EMP';
  
-- 모든 사원(EMP)의 부서 번호를 30번으로 수정하자
UPDATE EMP
SET department_id = 30;

-- 모든 사원의 급여를 10% 인상한다
UPDATE EMP
SET salary = salary * 1.1;

--salary_copy 컬럼을 생성하고, salary를 복사
ALTER TABLE EMP
ADD salary_copy NUMBER(8,2);

UPDATE EMP
SET salary_copy = salary;

--EMP 에서 입사일을 오늘날짜로 수정한다. (오라클 오늘 날짜: SYSDATE)
UPDATE EMP
SET hire_date = SYSDATE;

--(EMP2) 부서 번호가 10번 사원의 부서번호를 30번으로 수정
UPDATE EMP2
SET department_id = 30
WHERE department_id =10;

SELECT * FROM EMP2
WHERE department_id = 10; 

-- EMP2 테이블에서 RMQDURK 3000달러 이상인 사원만 급여를 10% 인상
UPDATE EMP2
SET salary = salary * 1.1
WHERE salary >= 3000;

SELECT salary FROM EMP2
WHERE salary >= 3000;

--2007년에 입사한 사원의 입사일을 오늘로 수저한다.
--SUBSTR('03/06/17, 1, 2)
UPDATE EMP2
SET hire_date = SYSDATE
WHERE SUBSTR(hire_date,1,2) = '07';

SELECT * FROM EMP2 
WHERE SUBSTR(hire_date,1,2) = '07';

SELECT * FROM EMP2 
WHERE SUBSTR(hire_date,1,2) = '26';

-- EMP2 테이블에서 LAST_NAME이 RUSSELL인 사원의 급여를 17000으로, 커미션 비율을 0.45로 인상한다.
UPDATE EMP2
SET salary = 17000, commission_pct = 0.45
WHERE last_name = 'Russell';

SELECT * FROM EMP2
WHERE last_name = 'Russell';


-- DML (SELECT, DELETE, UPDATE, INSERT) => ROLLBACK과 COMMIT 대상이 된다.
--ROLLBACK TABLE을 이전상태로 되돌림
--COMMIT 확정을 짓고 COMMIT 이후에는 COMMIT전으로 ROLLBACK하지 못함.
ROLLBACK;
COMMIT;






CREATE TABLE EMP2
AS 
SELECT * FROM EMPLOYEES;

SELECT hire_date FROM EMP;
DESC EMP;