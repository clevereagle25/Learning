-- .read SQL_DATA_ENGINEERING/1.9/part3/priority_roles.sql

CREATE OR REPLACE TABLE staging.priority_roles(
    role_id INTEGER PRIMARY KEY,
    role_name VARCHAR,
    priority_lvl INTEGER
);

INSERT INTO staging.priority_roles(role_id,role_name,priority_lvl)
values
    (1,'Data Engineer',1),
    (2,'Senior Data Engineer',1),
    (3,'Software Engineer',2);

SELECT * FROM staging.priority_roles;