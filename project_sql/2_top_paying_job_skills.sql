

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
    salary_year_avg DESC



/*


Key insights:
1. Data querying & analysis (SQL, Python, R) is still the core of top-paying analyst jobs.
2. Data visualization skills (Tableau, Power BI) are almost as critical.
3. Cloud platforms & big data tools (Azure, AWS, Hadoop, Spark, Databricks) are valuable differentiators.
4. There's a long tail of niche skills (Kafka, GitLab, Jupyter, Cassandra, Crystal Reports) 
   that may be role-specific rather than universal.


[
  {
    "job_id": 552322,
    "company_name": "AT&T",
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "skills": "sql"
  },
  {
    "job_id": 552322,
    "company_name": "AT&T",
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "skills": "python"
  },
  {
    "job_id": 552322,
    "company_name": "AT&T",
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "skills": "r"
  },
  {
    "job_id": 552322,
    "company_name": "AT&T",
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "skills": "azure"
  },
  {
    "job_id": 552322,
    "company_name": "AT&T",
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "skills": "databricks"
  },
  {
    "job_id": 552322,
    "company_name": "AT&T",
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "skills": "aws"
  },
  {
    "job_id": 552322,
    "company_name": "AT&T",
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "skills": "pandas"
  },
  {
    "job_id": 552322,
    "company_name": "AT&T",
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "skills": "pyspark"
  },
  {
    "job_id": 552322,
    "company_name": "AT&T",
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "skills": "jupyter"
  },
  {
    "job_id": 552322,
    "company_name": "AT&T",
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "skills": "excel"
  },
  {
    "job_id": 552322,
    "company_name": "AT&T",
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "skills": "tableau"
  },
  {
    "job_id": 552322,
    "company_name": "AT&T",
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "skills": "power bi"
  },
  {
    "job_id": 552322,
    "company_name": "AT&T",
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "skills": "powerpoint"
  },
  {
    "job_id": 99305,
    "company_name": "Pinterest Job Advertisements",
    "job_title": "Data Analyst, Marketing",
    "salary_year_avg": "232423.0",
    "skills": "sql"
  },
  {
    "job_id": 99305,
    "company_name": "Pinterest Job Advertisements",
    "job_title": "Data Analyst, Marketing",
    "salary_year_avg": "232423.0",
    "skills": "python"
  },
  {
    "job_id": 99305,
    "company_name": "Pinterest Job Advertisements",
    "job_title": "Data Analyst, Marketing",
    "salary_year_avg": "232423.0",
    "skills": "r"
  },
  {
    "job_id": 99305,
    "company_name": "Pinterest Job Advertisements",
    "job_title": "Data Analyst, Marketing",
    "salary_year_avg": "232423.0",
    "skills": "hadoop"
  },
  {
    "job_id": 99305,
    "company_name": "Pinterest Job Advertisements",
    "job_title": "Data Analyst, Marketing",
    "salary_year_avg": "232423.0",
    "skills": "tableau"
  },
  {
    "job_id": 544491,
    "company_name": "TikTok",
    "job_title": "Data Analyst Manager, TikTok-US-Data Security",
    "salary_year_avg": "222500.0",
    "skills": "sql"
  },
  {
    "job_id": 544491,
    "company_name": "TikTok",
    "job_title": "Data Analyst Manager, TikTok-US-Data Security",
    "salary_year_avg": "222500.0",
    "skills": "python"
  },
  {
    "job_id": 544491,
    "company_name": "TikTok",
    "job_title": "Data Analyst Manager, TikTok-US-Data Security",
    "salary_year_avg": "222500.0",
    "skills": "r"
  },
  {
    "job_id": 314402,
    "company_name": "TikTok",
    "job_title": "Lead Data Analyst LIVE - USDS",
    "salary_year_avg": "217550.0",
    "skills": "sql"
  },
  {
    "job_id": 314402,
    "company_name": "TikTok",
    "job_title": "Lead Data Analyst LIVE - USDS",
    "salary_year_avg": "217550.0",
    "skills": "python"
  },
  {
    "job_id": 314402,
    "company_name": "TikTok",
    "job_title": "Lead Data Analyst LIVE - USDS",
    "salary_year_avg": "217550.0",
    "skills": "express"
  },
  {
    "job_id": 1021647,
    "company_name": "Uclahealthcareers",
    "job_title": "Data Analyst (Hybrid/Remote)",
    "salary_year_avg": "217000.0",
    "skills": "sql"
  },
  {
    "job_id": 1021647,
    "company_name": "Uclahealthcareers",
    "job_title": "Data Analyst (Hybrid/Remote)",
    "salary_year_avg": "217000.0",
    "skills": "crystal"
  },
  {
    "job_id": 1021647,
    "company_name": "Uclahealthcareers",
    "job_title": "Data Analyst (Hybrid/Remote)",
    "salary_year_avg": "217000.0",
    "skills": "oracle"
  },
  {
    "job_id": 1021647,
    "company_name": "Uclahealthcareers",
    "job_title": "Data Analyst (Hybrid/Remote)",
    "salary_year_avg": "217000.0",
    "skills": "tableau"
  },
  {
    "job_id": 1021647,
    "company_name": "Uclahealthcareers",
    "job_title": "Data Analyst (Hybrid/Remote)",
    "salary_year_avg": "217000.0",
    "skills": "flow"
  },
  {
    "job_id": 168310,
    "company_name": "SmartAsset",
    "job_title": "Principal Data Analyst (Remote)",
    "salary_year_avg": "205000.0",
    "skills": "sql"
  },
  {
    "job_id": 168310,
    "company_name": "SmartAsset",
    "job_title": "Principal Data Analyst (Remote)",
    "salary_year_avg": "205000.0",
    "skills": "python"
  },
  {
    "job_id": 168310,
    "company_name": "SmartAsset",
    "job_title": "Principal Data Analyst (Remote)",
    "salary_year_avg": "205000.0",
    "skills": "go"
  },
  {
    "job_id": 168310,
    "company_name": "SmartAsset",
    "job_title": "Principal Data Analyst (Remote)",
    "salary_year_avg": "205000.0",
    "skills": "snowflake"
  },
  {
    "job_id": 168310,
    "company_name": "SmartAsset",
    "job_title": "Principal Data Analyst (Remote)",
    "salary_year_avg": "205000.0",
    "skills": "pandas"
  },
  {
    "job_id": 168310,
    "company_name": "SmartAsset",
    "job_title": "Principal Data Analyst (Remote)",
    "salary_year_avg": "205000.0",
    "skills": "numpy"
  },
  {
    "job_id": 168310,
    "company_name": "SmartAsset",
    "job_title": "Principal Data Analyst (Remote)",
    "salary_year_avg": "205000.0",
    "skills": "excel"
  },
  {
    "job_id": 168310,
    "company_name": "SmartAsset",
    "job_title": "Principal Data Analyst (Remote)",
    "salary_year_avg": "205000.0",
    "skills": "tableau"
  },
  {
    "job_id": 168310,
    "company_name": "SmartAsset",
    "job_title": "Principal Data Analyst (Remote)",
    "salary_year_avg": "205000.0",
    "skills": "gitlab"
  },
  {
    "job_id": 36333,
    "company_name": "TikTok",
    "job_title": "Data Analytics- USDS",
    "salary_year_avg": "204584.5",
    "skills": "sql"
  },
  {
    "job_id": 36333,
    "company_name": "TikTok",
    "job_title": "Data Analytics- USDS",
    "salary_year_avg": "204584.5",
    "skills": "python"
  },
  {
    "job_id": 36333,
    "company_name": "TikTok",
    "job_title": "Data Analytics- USDS",
    "salary_year_avg": "204584.5",
    "skills": "nosql"
  },
  {
    "job_id": 36333,
    "company_name": "TikTok",
    "job_title": "Data Analytics- USDS",
    "salary_year_avg": "204584.5",
    "skills": "mongodb"
  },
  {
    "job_id": 36333,
    "company_name": "TikTok",
    "job_title": "Data Analytics- USDS",
    "salary_year_avg": "204584.5",
    "skills": "mysql"
  },
  {
    "job_id": 36333,
    "company_name": "TikTok",
    "job_title": "Data Analytics- USDS",
    "salary_year_avg": "204584.5",
    "skills": "postgresql"
  },
  {
    "job_id": 36333,
    "company_name": "TikTok",
    "job_title": "Data Analytics- USDS",
    "salary_year_avg": "204584.5",
    "skills": "mongodb"
  },
  {
    "job_id": 36333,
    "company_name": "TikTok",
    "job_title": "Data Analytics- USDS",
    "salary_year_avg": "204584.5",
    "skills": "cassandra"
  },
  {
    "job_id": 36333,
    "company_name": "TikTok",
    "job_title": "Data Analytics- USDS",
    "salary_year_avg": "204584.5",
    "skills": "spark"
  },
  {
    "job_id": 36333,
    "company_name": "TikTok",
    "job_title": "Data Analytics- USDS",
    "salary_year_avg": "204584.5",
    "skills": "pandas"
  },
  {
    "job_id": 36333,
    "company_name": "TikTok",
    "job_title": "Data Analytics- USDS",
    "salary_year_avg": "204584.5",
    "skills": "hadoop"
  },
  {
    "job_id": 36333,
    "company_name": "TikTok",
    "job_title": "Data Analytics- USDS",
    "salary_year_avg": "204584.5",
    "skills": "kafka"
  },
  {
    "job_id": 36333,
    "company_name": "TikTok",
    "job_title": "Data Analytics- USDS",
    "salary_year_avg": "204584.5",
    "skills": "express"
  },
  {
    "job_id": 36333,
    "company_name": "TikTok",
    "job_title": "Data Analytics- USDS",
    "salary_year_avg": "204584.5",
    "skills": "tableau"
  },
  {
    "job_id": 36333,
    "company_name": "TikTok",
    "job_title": "Data Analytics- USDS",
    "salary_year_avg": "204584.5",
    "skills": "power bi"
  },
  {
    "job_id": 36333,
    "company_name": "TikTok",
    "job_title": "Data Analytics- USDS",
    "salary_year_avg": "204584.5",
    "skills": "flow"
  },
  {
    "job_id": 731368,
    "company_name": "Inclusively",
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "skills": "sql"
  },
  {
    "job_id": 731368,
    "company_name": "Inclusively",
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "skills": "python"
  },
  {
    "job_id": 731368,
    "company_name": "Inclusively",
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "skills": "azure"
  },
  {
    "job_id": 731368,
    "company_name": "Inclusively",
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "skills": "aws"
  },
  {
    "job_id": 731368,
    "company_name": "Inclusively",
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "skills": "oracle"
  },
  {
    "job_id": 731368,
    "company_name": "Inclusively",
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "skills": "snowflake"
  },
  {
    "job_id": 731368,
    "company_name": "Inclusively",
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "skills": "tableau"
  },
  {
    "job_id": 731368,
    "company_name": "Inclusively",
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "skills": "power bi"
  },
  {
    "job_id": 731368,
    "company_name": "Inclusively",
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "skills": "sap"
  },
  {
    "job_id": 731368,
    "company_name": "Inclusively",
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "skills": "jenkins"
  },
  {
    "job_id": 731368,
    "company_name": "Inclusively",
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "skills": "bitbucket"
  },
  {
    "job_id": 731368,
    "company_name": "Inclusively",
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "skills": "atlassian"
  },
  {
    "job_id": 731368,
    "company_name": "Inclusively",
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "skills": "jira"
  },
  {
    "job_id": 731368,
    "company_name": "Inclusively",
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "skills": "confluence"
  }
]

*/
