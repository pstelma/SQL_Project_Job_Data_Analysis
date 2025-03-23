
WITH top_jobs_and_skills AS (

    WITH top_paying_jobs AS (
        SELECT
            job_id,
            job_title,
            job_title_short,
            salary_year_avg,
            job_posted_date,
            job_country,
            name AS company_name
        FROM
            job_postings_fact
        LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
        WHERE 
            job_title_short = 'Data Analyst' AND
            job_location = 'Anywhere' AND
            salary_year_avg IS NOT NULL
        ORDER BY 
            salary_year_avg DESC
    )
    SELECT 
        top_paying_jobs.*,
        skills
    FROM
        top_paying_jobs
    INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
)
SELECT 
    COUNT(skills) AS no_mentions,
    skills
FROM top_jobs_and_skills
WHERE 
    job_title_short = 'Data Analyst' AND
    job_country = 'United States'
GROUP BY skills
ORDER BY no_mentions DESC
LIMIT 10;