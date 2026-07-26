/*
Question: What are the highest-paying skills for data engineers?
- Calculate the median salary for each skill required in data engineer positions
- Focus on remote positions with specified salaries
- Include skill frequency to identify both salary and demand
- Why? Helps identify which skills command the highest compensation while also showing 
    how common those skills are, providing a more complete picture for skill development priorities
*/


SELECT skills,
       ROUND(MEDIAN(jpf.salary_year_avg),2) AS avg_salary,
       COUNT(jpf.*) AS demand_count
FROM job_postings_fact AS jpf
INNER JOIN skills_job_dim AS sjd
       ON jpf.job_id = sjd.job_id
INNER JOIN skills_dim AS sd
       ON sjd.skill_id = sd.skill_id
WHERE jpf.job_title_short LIKE 'Data Engineer' AND jpf.job_work_from_home = TRUE 
GROUP BY sd.skills
HAVING COUNT(jpf.*) > 500
ORDER BY avg_salary DESC
LIMIT 25;

