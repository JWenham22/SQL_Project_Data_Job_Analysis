# Introduction
📊Dive into th data job market! Focusing on data analist roles, this project explores 💰 top-paying jobs, 🔥 in-demand skill, and 📈 where high demand meets high salary in data analytics.

🔍 SQL queries? Check them out here: [project_sql folder](/project_sql/)

# Background
The demand for data analytics talent has been growing steadily as companies across industries recognize the value of data-driven decision-making. In 2023, the tech job market faced rapid shifts — new technologies emerged, some skills surged in demand, and salary trends evolved.

As an aspiring data analyst, I wanted to explore this landscape to identify:

⭐ Which roles offer the highest salaries.

⭐ Which skills are most sought after by employers.

⭐ How certain skills influence earning potential.

I chose SQL for this project because it remains the core language for data extraction and analysis in the industry. By querying a dataset of 2023 data analyst job postings, I could uncover insights that not only reflect the job market but also demonstrate my ability to clean, join, aggregate, and analyze data to answer business questions.
### The questions I wanted to answer through my SQL queries were:

1. What are the top-paying data analyst jobs?

2. What skills are required for these top-paying jobs?

3. What skills are most in demand for data analysts?

4. Which skills are associated with higher salaries?

5. What are the most optimal skills to learn?

# Tools I Used

- **SQL:** The backbone of my analysis, allowing me to query the database and unearth critical insights.

- **Visual Studio Code:** My go-to for database management and executing SQL queries.

- **Git & Github:** Essential for version control and sharing my SQL scripts and analysis, ensuring collaboration and project tracking.

# The Analysis

Each query for this projecct aimed at investigating specific aspects of the data analyst job market. Here's how I approacehd each question: 

### 1. Top Paying Data Analyst Jobs  
Used SQL to identify the top 10 highest-paying Data Analyst roles in select California cities and remote positions by joining job and company data, filtering for salary info, and sorting by pay.  

```sql
SELECT
    job_id,
    company_dim.name AS company_name,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date
FROM
    job_postings_fact
LEFT JOIN
    company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_location IN ('Anywhere', 'San Diego, CA', 'Los Angeles, CA', 'Irvine, CA') AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10;
```
This query returns the top 10 highest-paying Data Analyst job postings from the dataset, filtered to include only positions located in Southern California or remote roles, with available salary data. It joins the job postings table with the company table to include company names, then sorts results by salary in descending order.

### 2. Top Paying Data Analyst Job Skills
Expanded on the first query to also show the skills required for the highest-paying roles by using a CTE to store top jobs, then joining with the skills tables.

```sql
WITH top_paying_jobs AS (
    SELECT
        job_id,
        company_dim.name AS company_name,
        job_title,
        salary_year_avg
    FROM
        job_postings_fact
    LEFT JOIN
        company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE
        job_title_short = 'Data Analyst' AND
        job_location IN ('Anywhere', 'San Diego, CA', 'Los Angeles, CA', 'Irvine, CA') AND
        salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
    LIMIT 10
)

SELECT 
    top_paying_jobs.*,
    skills_dim.skills
FROM    
    top_paying_jobs 
INNER JOIN
    skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN
    skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC;
```

This query identifies the skills associated with the top 10 highest-paying Data Analyst positions. A CTE stores the top jobs, which are then joined to skill-related tables to list the required skills for each role, sorted again by salary.

### 3. Top Demanded Skills For Data Analysts

Counted the frequency of each skill across all Data Analyst job postings to determine the top 5 most in-demand skills.

```sql
SELECT
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM    
    job_postings_fact 
INNER JOIN
    skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN
    skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
GROUP BY
    skills
ORDER BY
    demand_count DESC
LIMIT 5;
```
This query calculates how often each skill appears in Data Analyst job postings. It groups job postings by skill, counts the demand for each, and returns the five most sought-after skills.

### 4. Top Paying Skills For Data Analysts

Calculated the average salary for each skill to see which skills are associated with the highest-paying Data Analyst positions.

```sql
SELECT
    skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM    
    job_postings_fact 
INNER JOIN
    skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN
    skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 25;
```
This query groups job postings by skill and calculates the rounded average annual salary for each. It returns the 25 skills linked to the highest-paying Data Analyst jobs.

### 5. Most Optimal Skills FOr Data Analysts

Identified skills that are not only well-paid but also appear in more than 10 job postings to balance demand and compensation insights.

```sql
SELECT
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS demand_count,
    ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL
GROUP BY
    skills_dim.skill_id
HAVING
    COUNT(skills_job_dim.job_id) > 10
ORDER BY    
    avg_salary DESC,
    demand_count DESC
LIMIT 25;
```

This query filters for skills with an average salary available and more than 10 job postings. It ranks the top 25 skills first by salary, then by demand count, giving a view of skills that are both lucrative and sought after.

# What I learned

Through this project, I strengthened my SQL skills by:

- Writing complex queries using WHERE, GROUP BY, HAVING, and ORDER BY clauses for filtering, grouping, and sorting data.

- Using JOIN operations (INNER JOIN and LEFT JOIN) to combine related tables and enrich datasets with additional context.

- Applying Common Table Expressions (CTEs) to break down complex problems into more manageable steps and improve query readability.

- Performing aggregate calculations like COUNT() and AVG() to summarize and analyze data.

- Leveraging data cleaning filters such as IS NOT NULL and value constraints to ensure accurate results.

- Using aliasing for tables and columns to make queries more readable and maintainable.

- Combining business logic with SQL to answer targeted analytical questions efficiently.

# Conclusions

### Insights

1. The highest-paying Data Analyst positions in the dataset offer salaries well above the average, with many opportunities available both remotely and in Southern California cities like San Diego, Los Angeles, and Irvine.

2. These top-paying roles often require advanced technical skills such as SQL, Python, and Tableau, along with strong analytical capabilities.

3. SQL, Excel, and Python stand out as the most in-demand skills for Data Analysts, appearing frequently across job postings.

4. Skills such as Python, AWS, and Spark command some of the highest average salaries, even though they appear in fewer postings.

5. Tools like SQL and Tableau provide the best balance of high demand and competitive pay, making them strategic skills to focus on for career growth.

### Closing Thoughts

This project not only strengthened my technical skills in SQL but also gave me a deeper appreciation for how data can directly answer real-world questions. Working through the process of joining multiple datasets, filtering for relevant information, and summarizing key insights reinforced the importance of both precision and clarity in data analysis. More importantly, it showed me how thoughtful queries can uncover trends that inform strategic decisions — a skill I’m excited to continue refining in future projects.