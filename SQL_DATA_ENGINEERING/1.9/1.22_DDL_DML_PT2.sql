

CREATE OR REPLACE TABLE staging.job_postings_flat AS 
SELECT
    -- Job details
    jpf.job_id,
    jpf.job_title_short,
    jpf.job_title,
    jpf.job_location,
    jpf.job_via,
    jpf.job_schedule_type,
    jpf.job_work_from_home,
    jpf.search_location,
    jpf.job_posted_date,
    jpf.job_no_degree_mention,
    jpf.job_health_insurance,
    jpf.job_country,

    -- Salary details
    jpf.salary_rate,
    jpf.salary_year_avg,
    jpf.salary_hour_avg,

    -- Company details
    cd.name AS company_name,

FROM data_jobs.job_postings_fact AS jpf

LEFT JOIN data_jobs.company_dim AS cd
    ON jpf.company_id = cd.company_id;

SELECT count(*)
FROM 
staging.job_postings_flat;

SELECT *
FROM INFORMATION_SCHEMA.tables
WHERE table_catalog = 'data_mart';

SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'staging' AND table_catalog = 'data_mart';

SELECT *
FROM staging.priority_roles;


CREATE OR REPLACE VIEW staging.job_postings_flat_view AS 
SELECT 
jpfl.* 
FROM 
staging.job_postings_flat AS jpfl 
JOIN 
staging.priority_roles AS pr 
    ON jpfl.job_title_short = pr.role_name
WHERE pr.priority_lvl = 1;

SELECT
job_title_short,
count(*) AS count
FROM staging.job_postings_flat_view
GROUP BY
job_title_short;

CREATE TEMPORARY TABLE job_postings_flat_temp AS
SELECT *
FROM staging.job_postings_flat_view
WHERE job_title_short = 'Senior Data Engineer'
;

SELECT 
job_title_short,
count(*) AS count
FROM job_postings_flat_temp
GROUP BY job_title_short
ORDER BY count DESC;

SELECT COUNT(*) FROM staging.job_postings_flat;
SELECT COUNT(*) FROM staging.job_postings_flat_view;
SELECT COUNT(*) FROM job_postings_flat_temp;

DELETE FROM staging.job_postings_flat
WHERE job_posted_date <'2024-01-01';

SELECT COUNT(*) FROM staging.job_postings_flat;
SELECT COUNT(*) FROM staging.job_postings_flat_view;
SELECT COUNT(*) FROM job_postings_flat_temp;

TRUNCATE TABLE staging.job_postings_flat;


INSERT INTO staging.job_postings_flat
SELECT
    -- Job details
    jpf.job_id,
    jpf.job_title_short,
    jpf.job_title,
    jpf.job_location,
    jpf.job_via,
    jpf.job_schedule_type,
    jpf.job_work_from_home,
    jpf.search_location,
    jpf.job_posted_date,
    jpf.job_no_degree_mention,
    jpf.job_health_insurance,
    jpf.job_country,

    -- Salary details
    jpf.salary_rate,
    jpf.salary_year_avg,
    jpf.salary_hour_avg,

    -- Company details
    cd.name AS company_name

FROM data_jobs.job_postings_fact AS jpf

LEFT JOIN data_jobs.company_dim AS cd
    ON jpf.company_id = cd.company_id
WHERE job_posted_date >= '2024-01-01';

SELECT COUNT(*) FROM staging.job_postings_flat;
SELECT COUNT(*) FROM staging.job_postings_flat_view;
SELECT COUNT(*) FROM job_postings_flat_temp;