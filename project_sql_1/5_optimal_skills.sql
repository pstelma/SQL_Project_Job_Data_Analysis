/*
 What are the most optimal skills to focus on aspiring for a Data Analyst role?
*/

WITH top_paying_skills AS (
    SELECT
        skills,
        skills_dim.skill_id,
        ROUND(AVG(salary_year_avg), 0) AS avg_salary
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE 
        job_title_short = 'Data Analyst' 
        AND salary_year_avg IS NOT NULL 
        AND job_work_from_home = TRUE
    GROUP BY skills_dim.skill_id
),
top_demanded_skills AS (
    SELECT
        skills,
        skills_dim.skill_id,
        COUNT(skills) AS no_mentions
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE 
        job_title_short = 'Data Analyst' 
        AND job_work_from_home = TRUE
    GROUP BY skills_dim.skill_id
)
SELECT
    top_demanded_skills.skill_id,
    top_demanded_skills.skills,
    avg_salary,
    no_mentions
FROM top_paying_skills
INNER JOIN top_demanded_skills ON top_paying_skills.skill_id = top_demanded_skills.skill_id
ORDER BY no_mentions DESC, avg_salary DESC
LIMIT 25;
