CREATE DATABASE jobs_mart;

select *
from information_schema.tables
where table_catalog = 'jobs_mart';


use jobs_mart;
create schema staging;

create table staging.preffered_roles(
    role_id INTEGER PRIMARY KEY,
    role_name VARCHAR
);

drop table preffered_roles;

INSERT INTO staging.preffered_roles(role_id,role_name)
VALUES
     (1,'Data Engineer'),
     (2,'Data Scientist');

SELECT *
FROM staging.preffered_roles;

DROP table staging.preffered_roles;

INSERT INTO staging.preffered_roles(role_id,role_name)
VALUES (4,'Senior Data Engineer'),
       (5,'Software Engineer');

ALTER table staging.preffered_roles
ADD COLUMN is_preffered BOOLEAN;

UPDATE staging.preffered_roles
SET  is_preffered = FALSE
WHERE role_id = 2 OR role_id = 3 OR role_id = 5;

ALTER TABLE staging.preffered_roles
RENAME TO priority_roles;

ALTER TABLE staging.priority_roles
RENAME column is_priority to priority_lvl;

SELECT *
FROM staging.priority_roles;

ALTER TABLE staging.priority_roles
ALTER COLUMN priority_lvl TYPE INTEGER;

UPDATE staging.priority_roles
SET priority_lvl = 3
WHERE role_id = 2;