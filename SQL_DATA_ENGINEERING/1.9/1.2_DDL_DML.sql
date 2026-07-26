CREATE DATABASE jobs_mart;

select *
from information_schema.tables
where table_catalog = 'jobs_mart';


use jobs_mart;
create schema staging;

create table staging.preffered_roles(
    role_id INTEGER,
    role_name VARCHAR
);

drop table preffered_roles;

INSERT INTO preffered_roles(role_id,role_name)
VALUES
     (1,'Data Engineer'),
     (2,'Data Scientist');

SELECT *
FROM staging.preffered_roles;