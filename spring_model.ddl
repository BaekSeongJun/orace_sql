CREATE TABLE department3 (
    deptid VARCHAR2(10 BYTE) NOT NULL,
    name   VARCHAR2(20 BYTE) NOT NULL
);

ALTER TABLE department3 ADD CONSTRAINT department3_pk PRIMARY KEY ( deptid );

CREATE TABLE employee3 (
    id     VARCHAR2(20 BYTE) NOT NULL,
    name   VARCHAR2(20 BYTE) NOT NULL,
    deptid VARCHAR2(10 BYTE) NOT NULL
);

ALTER TABLE employee3 ADD CONSTRAINT employee3_pk PRIMARY KEY ( id );

ALTER TABLE employee3
    ADD CONSTRAINT employee3_department3_fk
        FOREIGN KEY ( deptid )
            REFERENCES department3 ( deptid )
            NOT DEFERRABLE;
