-- 1. 테이블 스페이스(테이블 저장할 공간)생성하기 (시스템관리자)
-- 저장공간이름 first01.dbf 사이즈 10M 공간확보
CREATE TABLESPACE firstData
datafile 'C:\oraclexe\oradata\XE\first01.dbf' size 10M;

--저장공간추가(수정)
ALTER TABLESPACE firstData
ADD DATAFILE 'C:\oraclexe\oradata\XE\first02.dbf' size 1M;

--저장공간사이즈 수정
ALTER DATABASE
DATAFILE 'C:\oraclexe\oradata\XE\first02.dbf' RESIZE 20M;

-- 저장공간 삭제
DROP TABLESPACE firstData INCLUDING CONTENTS AND datafiles;

--저장공간 자동 설정(first01.dbf)
--기존용량이 부족하면 1M증가시키고, 최대 20M 가능함
ALTER DATABASE
datafile 'C:\oraclexe\oradata\XE\first01.dbf'
AUTOEXTEND ON
NEXT 1M
MAXSIZE 20M;

--사용자 설정 (id : javauser, password: javauser, tablespace : firstData)
ALTER SESSION SET "_ORACLE_SCRIPT"=true;  

CREATE USER springboard IDENTIFIED BY springboard
DEFAULT TABLESPACE users
TEMPORARY TABLESPACE temp;

-- 사용자 권한 설정 (javauser에게 접속권한과 테이블 CURD권한 부여)
GRANT CONNECT, RESOURCE, dba to springboard;

-- 접속 요청을 진행하면 된다.

-- 시퀀스 설정
CREATE SEQUENCE empseq
START WITH 0
INCREMENT BY 1
MINVALUE 0
MAXVALUE 1000
NOCYCLE
CACHE 2;