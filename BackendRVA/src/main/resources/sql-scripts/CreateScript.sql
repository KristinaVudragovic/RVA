DROP TABLE IF EXISTS status CASCADE;
DROP TABLE IF EXISTS fakultet CASCADE;
DROP TABLE IF EXISTS departman CASCADE;
DROP TABLE IF EXISTS student CASCADE;

DROP SEQUENCE IF EXISTS status_seq;
DROP SEQUENCE IF EXISTS fakultet_seq;
DROP SEQUENCE IF EXISTS departman_seq;
DROP SEQUENCE IF EXISTS student_seq;

CREATE TABLE status (
	id integer not null,
	naziv varchar(100) not null,
	oznaka varchar(10)
);

CREATE TABLE fakultet (
	id integer not null,
	naziv varchar(100) not null,
	sediste varchar(50) not null
);

CREATE TABLE departman (
	id integer not null,
	naziv varchar(100) not null,
	oznaka varchar(10) not null,
	fakultet integer not null
);

CREATE TABLE student (
	id integer not null,
	ime varchar(50) not null,
	prezime varchar(50) not null,
	broj_indeksa varchar(20) not null,
	status integer not null,
	departman integer not null
);

ALTER TABLE status ADD CONSTRAINT
PK_Status PRIMARY KEY(id);
ALTER TABLE fakultet ADD CONSTRAINT
PK_Fakultet PRIMARY KEY(id);
ALTER TABLE departman ADD CONSTRAINT
PK_Departman PRIMARY KEY(id);
ALTER TABLE student ADD CONSTRAINT
PK_Student PRIMARY KEY(id);

ALTER TABLE departman ADD CONSTRAINT
FK_Departman_Fakultet FOREIGN KEY(fakultet) REFERENCES fakultet(id);
ALTER TABLE student ADD CONSTRAINT
FK_Student_Status FOREIGN KEY(status) REFERENCES status(id);
ALTER TABLE student ADD CONSTRAINT
FK_Student_Departman FOREIGN KEY(departman) REFERENCES departman(id);

CREATE INDEX INDXFK_Departman_Fakultet
ON departman(fakultet);
CREATE INDEX INDXFK_Student_Status
ON student(status);
CREATE INDEX INDXFK_Student_Departman
ON student(departman);

CREATE SEQUENCE status_seq
INCREMENT 1;
CREATE SEQUENCE fakultet_seq
INCREMENT 1;
CREATE SEQUENCE departman_seq
INCREMENT 1;
CREATE SEQUENCE student_seq
INCREMENT 1;