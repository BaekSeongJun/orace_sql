-- select문 기능

--1.departments 클래스에 몇개의 객체가 있는지 조사
SELECT * FROM departments;

--<문제> employees 테이블의 모든 레코드를 출력
SELECT * FROM employees;

--2. departments 테이블에서 department_id, department_name 항목만 보고싶다.
SELECT department_id, department_name FROM departments;

-- <문제> 사원의 이름과 급여와 입사일자만을 출력하는 SQL 문을 작성해보자. (employees)
-- 힌트 : 테이블 employees, 사원이름 칼럼은 first_name, last_name과 급여 salary, 입사일자 hire_date
SELECT first_name, last_name, salary, hire_date from employees;

--3. 컬럼이름 별칭 붙이기 
SELECT first_name as a, last_name as b, salary as c, hire_date from employees;
SELECT first_name 이름, last_name 성, salary 월급, hire_date from employees;

-- 연결 연산자(concatenation) : 자바에서 문자열 + 숫자
SELECT * FROM employees;

-- 사원번호는 100번이고 사원의 이름은 steven king 이고 이메일 주소는 sking 입니다.
SELECT '사원번호는 ' || EMPLOYEE_ID || ' 사원이름은 ' || FIRST_NAME || LAST_NAME || ' 입니다.' as info FROM employees;


--중복된 데이터를 한번씩만 출력하는 기능
SELECT DISTINCT job_id FROM employees;

--<문제>직원들이 어떤 부서에 소속되어 있는지 소속 부서번호(department-id)를 출려하되 종복되지 않고
--한번씩만 출력하는 쿼리문을 작성하자
SELECT DISTINCT department_id FROM employees;

--6.조건문
-- employee에서 급여를 3000이상 받는 직원을 대상
SELECT * FROM employees
WHERE salary >= 3000;

--<문제> EMPLOYEES 테이블에서 부서번호가 110번인 직원에 관한 모든 정보만 출력하라.
SELECT * FROM employees
WHERE department_id = 110;

--<문제> EMPLOYEES 테이블에서 급여가 5000미만이 되는 직원의 정보중에서 사번과 이름, 급여를 출려하라.
SELECT employee_id , first_name, salary FROM employees
WHERE salary < 5000;

--7. 이름(FIRST_NAME)이 'Lex'인 직원 출력
SELECT * FROM EMPLOYEES 
WHERE FIRST_NAME ='Lex';

-- <문제> 이름이 John인 사람의 직원번호와 직원명과 직급을 출력하라
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID FROM employees 
WHERE FIRST_NAME = 'John';

--8. 날짜 데이터 조회 (> <)
-- <예> 2008년 이후에 입사한 직원
SELECT * FROM employees
WHERE hire_date > '2008/01/01';

--9. AND => BETWEEN AND 연산자, OR => IN, NOT조건
-- <예> 부서번호가 100번이고 직급이 FI_MGR인 직원
SELECT * FROM employees
WHERE department_id = 100 AND job_id = 'FI_MGR';

--<문제> 급여가 5000에서 10000 이하 직원 정보 출력
SELECT * FROM employees
WHERE 5000 <= salary AND 10000 >= salary;

SELECT * FROM employees
WHERE salary BETWEEN 5000 AND 10000;

SELECT * FROM employees
WHERE salary BETWEEN 5000 AND 10000;

-- <예> 부서번호가 100번이거나 직급이 FI_MGR인 직원
SELECT * FROM employees
WHERE department_id = 100 OR job_id = 'FI_MGR';

-- <문제> 직원번호가 134이거나 201이거나 107인 직원정보 출력
SELECT * FROM employees
WHERE employee_id = 134 OR employee_id = 201 OR employee_id = 107;

SELECT * FROM employees
WHERE employee_id IN (134, 201, 107);


-- <예> 부서번호가 100번이 아닌 직원
SELECT * FROM employees
WHERE department_id <> 100;
SELECT * FROM employees
WHERE department_id != 100; --> 보통 얘를 씀
SELECT * FROM employees
WHERE department_id ^= 100;
SELECT * FROM employees
WHERE NOT department_id = 100;

-- <문제> 직급이 FI_MGR이 아닌 직원
SELECT * FROM employees
WHERE job_id != 'FI_MGR';

-- <문제> 급여가 2500에서 4500까지의 범위에 속한 직원의 직원번호, 이름, 급여를 출력하라.
-- (AND 연산자와 BETWEEN AND 연산자 사용 두개 모두 사용해서 보여줄것.)
SELECT employee_id, first_name, salary FROM employees
WHERE salary >= 2500 AND salary < 4500;

SELECT employee_id, first_name, salary FROM employees
WHERE salary BETWEEN 2500 AND 4500;

--<ANSWP 커미션비율이 0.3 이거나 0.05이거니 0.1 중의 하나인 직원의 직원번호 이름 급여 커미션 비율을 출력하라
--OR 연산자와 IN 연산자 사용 모두 해볼것
SELECT employee_id, first_name, salary, commission_pct FROM employees
WHERE commisSion_pct = 0.3 OR commission_pcT = 0.05 OR commission_pct = 0.1;

SELECT employee_id, first_name, salary, commission_pct FROM employees
WHERE commission_pct IN(0.3, 0.05, 0.1);

-- 10.LIKE 연산자(_ : 1글자이고 (여기에 어떤게 와도 상관이 없다), %: 1글자 이상 (무엇이와도 상관이 없다.))
-- <예> k로 시작하는 사원
SELECT * FROM employees
WHERE first_name LIKE 'K%';

--<예> 이름중에 k를 포함하는 사원
SELECT * FROM employees
WHERE first_name LIKE '%k%';

--<예> 이름이 k로 끝나는 사원
SELECT * FROM employees
WHERE first_name LIKE '%k';

--<예> 이름의 두 번째 글자가 d인 사원
SELECT * FROM employees
WHERE first_name LIKE '_d%';

--<문제> 이름에 a를 포함하지 않은 직원의 직원번호, 이름을 출력하라
SELECT employee_id, first_name FROM employees
WHERE LOWER(first_name) NOT LIKE '%a%';

SELECT employee_id, first_name FROM employees
WHERE UPPER(first_name) NOT LIKE '%A%';

--11 NULL(연산, 할당, 비교가 불가능하다)
--<예> 커미션을 받지 않는 사원에 대한 검색(비교안됨 commission_pct = NULL => commission_pct IS NULL)
--SELECT * FROM employees
--WHERE commission_pct = NULL; 잘못된 방법.

SELECT * FROM employees
WHERE commission_pct IS NULL;

SELECT * FROM employees
WHERE commission_pct IS NOT NULL;

--<문제> 자신의 직속상관이 없는 직원의 전체 이름과 직급과 직원번호를 출력하라
SELECT first_name, last_name, job_id, employee_id FROM employees
WHERE manager_id IS NULL;

--12 ORDER BY ASC(오름차순), ORDER BY DESC(내림차순)
--<예> 사번을 기준으로 오름차순으로 정렬
SELECT * FROM employees
ORDER BY employee_id ASC;

--<예> 사번을 기준으로 오름차순으로 정렬 부서번호가 100이 아닌 부서에서
SELECT * FROM employees
WHERE department_id != 100
ORDER BY employee_id ASC;

--<문제>직원번호, 이름, 급여를 급여가 높은 순으로 출력하라
SELECT employee_id, first_name, salary FROM employees
ORDER BY salary DESC;

--<문제> 입사일이 가장 최근인 직원 순으로 직원번호, 이름, 입사일을 출력하라.
SELECT employee_id, first_name, hire_date FROM employees
ORDER BY hire_date DESC;

