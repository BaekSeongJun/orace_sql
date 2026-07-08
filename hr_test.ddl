
CREATE TABLE department2 (
    deptid    INTEGER NOT NULL,
    deptname  VARCHAR2(30 BYTE) NOT NULL,
    deptloc   VARCHAR2(30 BYTE),
    deptphone CHAR(14 BYTE) NOT NULL
)
;

ALTER TABLE department2 ADD CONSTRAINT department2_pk PRIMARY KEY ( deptid );

CREATE TABLE employee2 (
    empid    INTEGER NOT NULL,
    empname  CHAR(4 CHAR) NOT NULL,
    empemail VARCHAR2(50 BYTE) NOT NULL,
    deptid   INTEGER NOT NULL
)
;

ALTER TABLE employee2 ADD CONSTRAINT employee2_pk PRIMARY KEY ( empid );

ALTER TABLE employee2
    ADD CONSTRAINT employee2_department2_fk
        FOREIGN KEY ( deptid )
            REFERENCES department2 ( deptid )
            NOT DEFERRABLE;

