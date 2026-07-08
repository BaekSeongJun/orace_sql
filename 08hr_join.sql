-- join

-- 1.cross join(2개의 테이블을 크로스한다.)
SELECT COUNT(*) FROM employees; -- 107
SELECT COUNT(*) FROM departments; -- 27

SELECT * FROM employees, departments
WHERE first_name LIKE '%l%';
SELECT COUNT(*) FROM employees, departments;

--ANSI 협회에서 정한 CROSS JOIN
SELECT * FROM employees, departments; -- 107 * 27
SELECT * FROM employees CROSS JOIN departments;

SELECT * FROM user_cons_columns
WHERE table_name = 'EMPLOYEES';

-- 2. inner join (employees 테이블과 departments 테이블을 조인해서 보여주시오_
-- pk : depratments.departments_id fk : employees.department_id
SELECT first_name, department_name FROM employees e , departments d
WHERE e.department_id = d.department_id;

-- first_name, email, job, 연봉, 부서명, 부서위치를 출력하는 조인문을 작성하시오.
-- 판매처(SHIPPING만 보여주시오. 연봉이 5000달러 이상인 사원을 보여주시오.
SELECT first_name, email, job_id, salary, department_name, city FROM employees e, departments d, locations l
WHERE e.department_id = d.department_id AND d.location_id = l.location_id AND UPPER(department_name) = 'SHIPPING' AND salary >= 5000;

--ANSI 협회에서 정한 INNER JOIN
SELECT first_name, email, job_id, salary, department_name, city FROM employees e 
INNER JOIN departments d ON e.department_id = d.department_id
INNER JOIN locations l ON d.location_id = l.location_id
WHERE LOWER(department_name) = 'shipping' and salary >= 5000;

--USING을 이용한 조인 조건 지정
SELECT *
FROM employees e INNER JOIN departments d
USING(department_id);

DESC EMPLOYEES;
DESC DEPARTMENTS;
DESC LOCATIONS;

-- 3. outer join
SELECT e.first_name, d.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id(+)
ORDER BY d.department_id;

--ANSI 협회에서 정한 LEFET OUTER JOIN
SELECT e.first_name, d.department_id, d.department_name
FROM employees e LEFT OUTER JOIN departments d
ON e.department_id = d.department_id
ORDER BY d.department_id;

SELECT e.first_name, d.department_id, d.department_name
FROM employees e RIGHT OUTER JOIN departments d
ON e.department_id = d.department_id
ORDER BY d.department_id;

SELECT * FROM departments ORDER BY department_id;

-- 4. self join(한개의 테이블을 2개로 분리시킨다. 한개 테이블에서 pk 다른 한개 fk
-- epmloyees를 self join을 통해 사원의 정보와 서원 사수의 정보를 출력하는 쿼리문
desc employees;

SELECT e1.first_name 사원, e2.first_name 사수, e1.salary 사원연봉, e2.salary 사수연봉 FROM employees e1 , employees e2
WHERE e1.manager_id  = e2.employee_id;

-- 5.non equal join 2개의 테이블이 아무 관계가 없다. fk 가지고 있지 않다.
-- 등급을 나타내는 테이블을생성 gradetbl (등급, 최소연봉, 최대연봉)
CREATE TABLE gradetbl(
    grade NUMBER(1) NOT NULL,
    min_salary NUMBER NOT NULL,
    max_salary NUMBER NOT NULL,
    CONSTRAINT pk_gradetbl_id PRIMARY KEY(grade)
);

INSERT INTO gradetbl VALUES(1, 2000, 5000);
INSERT INTO gradetbl VALUES(2, 5001, 10000);
INSERT INTO gradetbl VALUES(3, 10001, 20000);
INSERT INTO gradetbl VALUES(4, 20001, 30000);
INSERT INTO gradetbl VALUES(5, 30001, 50000);

SELECT * FROM gradetbl;

-- 공통 컬럼이 없는 employees 테이블과 gradedbl을 조인을 해서 사원의 이름과 사원의 월급과 사원의 월급 등급을 설정해라
SELECT first_name, salary, grade FROM employees, gradetbl
WHERE salary >= min_salary AND salary <= max_salary;

SELECT first_name, salary, grade FROM employees, gradetbl
WHERE salary BETWEEN min_salary AND max_salary;
