--인덱스 설정

--장점:
-- 검색 속도가 빨라진다. 
-- 시스템에 걸리는 부하를 줄여서 시스템 전체 성능을 향상시킨다. 

--단점 :
-- 추가적인 공간이 필요하다.
-- 인덱스를 생성하는데 시간이 걸린다. 
-- 데이터의 변경 작업(INSERT/UPDATE/DELETE)이 자주 일어날 경우에는 오히려 성능이 저하된다. 

--emp01 테이블 생성(employees)
DROP TABLE EMP01;

CREATE TABLE emp01
AS
SELECT * FROM employees;

-- 인덱스 테이블 내용을 조사 (데이터 딕셔너리 확인 체크)
SELECT * FROM user_indexes
WHERE table_name ='EMP01';

--인덱스 성능을 체크해보자
SELECT * FROM emp01;

SELECT * FROM emp01 WHERE employee_id = 100;

--emp01 employee_id pk 설정
ALTER TABLE emp01
ADD CONSTRAINT pk_emp01_id PRIMARY KEY(employee_id);

--first_name 성능체크
SELECT * FROM emp01 WHERE email like '%A%';

--first_name 인덱스 설정
--CREATE UNIQUE INDEX INDEX_EMPNO_EMP 
--ON EMP01 (EMPLOYEE_ID);
CREATE UNIQUE INDEX ix_emp01_email
ON emp01(email);

-- 익덱스 삭제기능
DROP INDEX ix_emp01_email;