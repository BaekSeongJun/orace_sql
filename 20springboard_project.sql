CREATE TABLE board(
    boardNo NUMBER, 
    title VARCHAR2(200) NOT NULL, 
    content VARCHAR2(1000), 
    writer VARCHAR2(100) NOT NULL, 
    regDate DATE DEFAULT SYSDATE NOT NULL , 
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