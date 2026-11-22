
--duckdb md:jobs_mart

--.databases
CREATE DATABASE IF NOT EXISTS data_mart;

SELECT *
FROM INFORMATION_SCHEMA.schemata;

CREATE SCHEMA IF NOT EXISTS data_mart.staging;
USE data_mart;
--DROP SCHEMA IF EXISTS staging;

CREATE TABLE IF NOT EXISTS staging.preferred_roles(
    role_id INTEGER PRIMARY KEY,
    role_name VARCHAR

);

SELECT *
FROM INFORMATION_SCHEMA.tables
WHERE table_catalog = 'data_mart';


INSERT INTO staging.preferred_roles (role_id,role_name)
VALUES
    (1,'Data Engineer'),
    (2,'Senior Data Engineer'),
    (3,'Cloud Engineer'),
    (4,'Software Engineer');

---DROP Table staging.preferred_roles;

ALTER TABLE staging.preferred_roles
ADD COLUMN priority_role BOOLEAN;


UPDATE staging.preferred_roles
SET priority_role = TRUE
WHERE role_id = 1 or role_id = 2;

UPDATE staging.preferred_roles
SET priority_role = FALSE
WHERE role_id = 3 or role_id = 4;

ALTER TABLE staging.preferred_roles
RENAME TO priority_roles;

SELECT *
FROM staging.priority_roles;

ALTER TABLE staging.priority_roles
RENAME COLUMN priority_role TO priority_lvl;

ALTER TABLE staging.priority_roles
ALTER COLUMN priority_lvl TYPE INTEGER;

UPDATE staging.priority_roles
SET priority_lvl = 3
WHERE role_id = 4;

UPDATE staging.priority_roles
SET priority_lvl = 2
WHERE role_id = 3;
