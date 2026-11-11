//
//duckdb md:jobs_mart                                              
//


select 
job_id,
job_title_short AS job_title,
salary_year_avg AS job_salary,
job_location,
job_via
FROM
data_jobs.job_postings_fact
 WHERE 
 ((job_title_short LIKE '%Data%' OR job_title_short LIKE '%Software%')
 AND job_title_short LIKE '%Engineer%' )
 AND (job_title_short NOT like 'Senior%' AND job_title_short NOT like 'Sr%') ;       




 select 
 job_title_short,
 MEDIAN(salary_year_avg),
 min(salary_year_avg),
 max(salary_year_avg)
 FROM 
data_jobs.job_postings_fact
 WHere 
 salary_year_avg is not null
 GROUP BY
 job_title_short,
 having
  MEDIAN(salary_year_avg) > 100_000
 order by 
 AVG(salary_year_avg)  DESC;


SELECT 
jpf.company_id,
cd.name AS company_name,
count(jpf.company_id) AS postings
from 
data_jobs.job_postings_fact AS jpf
LEFT JOIN data_jobs.company_dim AS cd
    ON jpf.company_id = cd.company_id
WHERE
 job_country = 'United States'
GROUP BY 
cd.name,
jpf.company_id

HAVING 
count(jpf.company_id) > 3000 
ORDER BY postings DESC
;


SELECT 
sd.skills,
jpf.job_title_short AS job_title,

FROM 
data_jobs.job_postings_fact AS jpf

JOIN data_jobs.skills_job_dim AS sjd
  ON sjd.job_id = sd.job_id
JOIN data_jobs.skills_dim AS sd
  ON sd.skill_id = sjd.skill_id;


SELECT DISTINCT 
sd.skills,
count(jpf.salary_year_avg) AS Demand,
round(median(jpf.salary_year_avg),0) AS Median
FROM 
data_jobs.job_postings_fact AS jpf
JOIN data_jobs.skills_job_dim AS sjd
  ON sjd.job_id = jpf.job_id
JOIN data_jobs.skills_dim AS sd
  ON sd.skill_id = sjd.skill_id
WHERE 
  job_work_from_home = 'TRUE'
    AND job_title_short = 'Data Engineer'
GROUP BY 
  sd.skills
HAVING Demand > 100
ORDER BY 
  Demand DESC
LIMIT 30;


