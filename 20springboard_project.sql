CREATE TABLE board(
    board_No NUMBER, 
    title VARCHAR2(200) NOT NULL, 
    content VARCHAR2(1000), 
    writer VARCHAR2(100) NOT NULL, 
    reg_Date DATE DEFAULT SYSDATE NOT NULL , 
    CONSTRAINT pk_board_no PRIMARY KEY(boardNo)
);

CREATE SEQUENCE board_seq
START WITH 1
INCREMENT BY 1
NOCYCLE
CACHE 2;

INSERT INTO board(boardNo, title, content, writer) VALUES (board_seq.nextval, 'title', 'content', 'writer');

ROLLBACK;

SELECT * FROM board;
SELECT * FROM user_tables;
SELECT * FROM user_sequences;
SELECT * FROM user_constraints;

SELECT * FROM board
ORDER BY regdate desc;

--jpa
--jpaboard

CREATE TABLE jpaboard(
    board_No NUMBER, 
    title VARCHAR2(200) NOT NULL, 
    content VARCHAR2(1000), 
    writer VARCHAR2(100) NOT NULL, 
    reg_Date DATE DEFAULT SYSDATE NOT NULL , 
    CONSTRAINT pk_jpaboard_no PRIMARY KEY(board_No)
);

CREATE SEQUENCE jpa_board_seq
START WITH 1
INCREMENT BY 1
NOCYCLE
CACHE 2;

select * from jpaboard;

drop table jpaboard;

DROP SEQUENCE jpa_board_seq;


CREATE TABLE mybatisboard(
    board_No NUMBER, 
    title VARCHAR2(100) NOT NULL, 
    content VARCHAR2(500), 
    writer VARCHAR2(50) NOT NULL, 
    reg_Date DATE DEFAULT SYSDATE, 
    CONSTRAINT pk_mybatisboard_no PRIMARY KEY(board_No)
);

CREATE SEQUENCE mybatisboard_seq
START WITH 1
INCREMENT BY 1;



CREATE TABLE mybatismember(
user_no NUMBER, 
user_id VARCHAR2(50) NOT NULL, 
user_pw VARCHAR2(50) NOT NULL, 
user_name VARCHAR2(100) NOT NULL, 
coin NUMBER(10) DEFAULT 0, 
reg_date DATE DEFAULT SYSDATE, 
upd_date DATE DEFAULT SYSDATE, 
enabled CHAR(1) DEFAULT '1', 
CONSTRAINT pk_member_no PRIMARY KEY (user_no) 
); 
 
CREATE TABLE mybatismember_auth(
user_no NUMBER NOT NULL,
auth VARCHAR2(50) NOT NULL 
);

ALTER TABLE mybatismember_auth
ADD CONSTRAINT fk_member_auth_no FOREIGN KEY(user_no)
REFERENCES mybatismember(user_no) ON DELETE CASCADE;

ALTER TABLE mybatismember_auth
DROP CONSTRAINT fk_member_auth_no;


CREATE SEQUENCE mybatismember_seq
START WITH 1
INCREMENT BY 1;

DROP SEQUENCE mybatismember_seq;

SELECT mybatismember_seq.nextval from dual;

SELECT m.user_no, m.user_id, m.user_pw, m.user_name, a.auth FROM mybatismember m
INNER JOIN mybatismember_auth a 
ON m.user_no = a.user_no;

Drop Table mybatismember;
Drop table mybatismember_auth;
