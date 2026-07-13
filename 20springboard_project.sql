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
