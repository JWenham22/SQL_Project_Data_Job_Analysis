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


/*

Main Trends
1. Specialized / Niche Tech Pays More
    Skills like Solidity, Couchbase, and DataRobot are not as common, so they command premium salaries.
    Blockchain-related (Solidity) and niche databases (Couchbase) especially stand out.

2. AI/ML Frameworks Are Strong Earners
    MXNet ($149K), Keras ($127K), PyTorch ($125K), TensorFlow ($120K), and Hugging Face ($124K) show that 
    deep learning expertise remains lucrative.

3. Cloud & DevOps Tools Hold Value
    Terraform ($146K), VMware ($147K), Ansible ($124K), Puppet ($129K), Airflow ($116K) — companies pay well 
    for cloud infrastructure and automation skills.

4. Collaboration & Version Control Tools Are Solid
    GitLab ($134K), Atlassian ($117K), Bitbucket ($116K), Twilio ($138K) — not as high as AI or niche DB, 
    but still strong.

5. Data Engineering & Streaming Tech
    Kafka ($130K), Scala ($115K), Cassandra ($118K) — these are in-demand for real-time big data systems.

*/