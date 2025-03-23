-- What are the most in-demand skills for my role?

SELECT
    skills,
    COUNT(skills) AS no_mentions
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
    job_title_short = 'Data Analyst' /*AND
    job_title LIKE '%unior%' */
GROUP BY 
    skills
ORDER BY 
    no_mentions DESC
LIMIT 5


    
    

