/*
Trying to ascertain top paying data scientist jobs.
- Identify top 10 jobs available in New York, NY. 
- Remove null (jobs with no salary mentioned)
- Why? Mention notable jobs for Data Scientists
- Skills required to perform the top roles
*/
WITH top_paying_jobs AS
(
    SELECT 
        job_id,
        job_title,
        salary_year_avg,
        name as company_name

    FROM 
        job_postings_fact
    LEFT JOIN company_dim
    ON job_postings_fact.company_id = company_dim.company_id

    WHERE 
        job_title_short = 'Data Scientist' AND 
        job_location = 'New York, NY' AND
        salary_year_avg IS NOT NULL
    ORDER BY    
        salary_year_avg DESC
    LIMIT 10
)
SELECT 
    top_paying_jobs.*,
    skills
FROM
    top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY    salary_year_avg DESC