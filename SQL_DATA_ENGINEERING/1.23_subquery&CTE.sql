



--Scenario 1 - Subquery in 'SELECT'
-- Show each job's salary next to the overall market median:
SELECT
job_title_short,
salary_year_avg,
(
    SELECT
    median(salary_year_avg),
    FROM data_jobs.job_postings_fact
) AS market_salary_median
FROM 
data_jobs.job_postings_fact
WHERE
salary_year_avg IS NOT NULL
limit 10;



--Scenario 2 - Subquery in FROM
-- Stage only jobs that are remote before aggregating to determine the remote median salary per job

SELECT
job_title_short,
median(salary_year_avg) AS median_salary,
(
    SELECT
    median(salary_year_avg)
    FROM data_jobs.job_postings_fact
    WHERE job_work_from_home = TRUE 
) AS market_remote_median_salary
FROM 
(
    SELECT 
    job_title_short,
    salary_year_avg
    FROM
    data_jobs.job_postings_fact
    WHERE job_work_from_home = TRUE
) AS clean_jobs
GROUP BY job_title_short
limit 10;


-- Scenario 3 - Subquery in HAVING
-- Keep only job titles whose median salary is above the overall median:

SELECT
job_title_short,
median(salary_year_avg) AS median_salary,
(
    SELECT
    median(salary_year_avg)
    FROM data_jobs.job_postings_fact
    WHERE job_work_from_home = TRUE 
) AS market_remote_median_salary
FROM 
(
    SELECT 
    job_title_short,
    salary_year_avg
    FROM
    data_jobs.job_postings_fact
    WHERE job_work_from_home = TRUE
) AS clean_jobs
GROUP BY job_title_short
HAVING 
MEDIAN(salary_year_avg)>(
    SELECT
    median(salary_year_avg)
    FROM data_jobs.job_postings_fact
    WHERE job_work_from_home = TRUE 
)
ORDER BY 
median_salary DESC
limit 10;



-- CTE EXAMPLE
-- Compare how much more (or less) remote roles pay compared to onsite roles for each job title.
-- Use a CTE to calculate the median salary by title and work arrangement, then compare those medians.

use data_jobs;


WITH title_median AS (
    SELECT 
    job_title_short,
    job_work_from_home,
    median(salary_year_avg):: INTEGER AS median_salary

    FROM 
    job_postings_fact
    WHERE job_country = 'United States'
    GROUP BY 
    job_title_short,
    job_work_from_home
)

SELECT 
r.job_title_short,
r.median_salary AS remote_median_salary,
o.median_salary As onsite_median_salary,
remote_median_salary-onsite_median_salary AS remote_job_premium
FROM 
title_median AS r
JOIN title_median AS o 
ON r.job_title_short = o.job_title_short
WHERE 
r.job_work_from_home = TRUE
AND o.job_work_from_home = FALSE
ORDER BY remote_job_premium DESC;



-- Final Example
-- Identify job postings that have no associated skills before loading them into a data



SELECT *
FROM job_postings_fact AS tgt
WHERE NOT EXISTS(
    SELECT 1 --there's no useof this 1 here & we can put whatever we want here
    FROM skills_job_dim AS src 
    WHERE src.job_id = tgt.job_id
)
ORDER BY job_id;






