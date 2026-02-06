WITH top_paying_jobs AS (
    SELECT 
        job_id,
        job_title,
        salary_year_avg,
        name AS company_name

    FROM
        job_postings_fact

    LEFT JOIN company_dim AS company ON job_postings_fact.company_id = company.company_id

    WHERE
        job_title = 'Data Scientist' AND
        job_location = 'Anywhere' AND
        salary_year_avg IS NOT NULL

    ORDER BY
        salary_year_avg

    LIMIT 10
)

SELECT
    top_paying_jobs.*,
    skill.skills AS required_skill

FROM 
    top_paying_jobs

INNER JOIN skills_job_dim AS skills ON top_paying_jobs.job_id = skills.job_id
INNER JOIN skills_dim AS skill ON skills.skill_id = skill.skill_id

ORDER BY
    top_paying_jobs.salary_year_avg DESC;


/* Here are the key insights derived from the required_skill column across the top data analyst–related roles in your 2023 job postings:

Overall Skill Demand

SQL and Python are the most consistently required skills, clearly forming the core technical foundation for data roles.

A second tier of skills appears frequently but less universally, including:
- R
- Hadoop
- Spark
- C++

Frameworks and platforms such as AWS, React, Django, and Java show up but are more role---or company-specific rather than universal requirements.

[
  {
    "job_id": 1360327,
    "job_title": "Data Scientist",
    "salary_year_avg": "63000.0",
    "company_name": "GreenChoice",
    "required_skill": "mysql"
  },
  {
    "job_id": 1360327,
    "job_title": "Data Scientist",
    "salary_year_avg": "63000.0",
    "company_name": "GreenChoice",
    "required_skill": "python"
  },
  {
    "job_id": 1360327,
    "job_title": "Data Scientist",
    "salary_year_avg": "63000.0",
    "company_name": "GreenChoice",
    "required_skill": "sql"
  },
  {
    "job_id": 1267665,
    "job_title": "Data Scientist",
    "salary_year_avg": "57600.0",
    "company_name": "University of Phoenix",
    "required_skill": "phoenix"
  },
  {
    "job_id": 1267665,
    "job_title": "Data Scientist",
    "salary_year_avg": "57600.0",
    "company_name": "University of Phoenix",
    "required_skill": "excel"
  },
  {
    "job_id": 1267665,
    "job_title": "Data Scientist",
    "salary_year_avg": "57600.0",
    "company_name": "University of Phoenix",
    "required_skill": "sql"
  },
  {
    "job_id": 1267665,
    "job_title": "Data Scientist",
    "salary_year_avg": "57600.0",
    "company_name": "University of Phoenix",
    "required_skill": "python"
  },
  {
    "job_id": 1267665,
    "job_title": "Data Scientist",
    "salary_year_avg": "57600.0",
    "company_name": "University of Phoenix",
    "required_skill": "r"
  },
  {
    "job_id": 1267665,
    "job_title": "Data Scientist",
    "salary_year_avg": "57600.0",
    "company_name": "University of Phoenix",
    "required_skill": "aws"
  },
  {
    "job_id": 1267665,
    "job_title": "Data Scientist",
    "salary_year_avg": "57600.0",
    "company_name": "University of Phoenix",
    "required_skill": "redshift"
  },
  {
    "job_id": 1267665,
    "job_title": "Data Scientist",
    "salary_year_avg": "57600.0",
    "company_name": "University of Phoenix",
    "required_skill": "spark"
  },
  {
    "job_id": 1267665,
    "job_title": "Data Scientist",
    "salary_year_avg": "57600.0",
    "company_name": "University of Phoenix",
    "required_skill": "hadoop"
  },
  {
    "job_id": 968116,
    "job_title": "Data Scientist",
    "salary_year_avg": "57000.0",
    "company_name": "Turingminds.ai",
    "required_skill": "hadoop"
  },
  {
    "job_id": 968116,
    "job_title": "Data Scientist",
    "salary_year_avg": "57000.0",
    "company_name": "Turingminds.ai",
    "required_skill": "tableau"
  },
  {
    "job_id": 968116,
    "job_title": "Data Scientist",
    "salary_year_avg": "57000.0",
    "company_name": "Turingminds.ai",
    "required_skill": "python"
  },
  {
    "job_id": 968116,
    "job_title": "Data Scientist",
    "salary_year_avg": "57000.0",
    "company_name": "Turingminds.ai",
    "required_skill": "java"
  },
  {
    "job_id": 968116,
    "job_title": "Data Scientist",
    "salary_year_avg": "57000.0",
    "company_name": "Turingminds.ai",
    "required_skill": "r"
  },
  {
    "job_id": 968116,
    "job_title": "Data Scientist",
    "salary_year_avg": "57000.0",
    "company_name": "Turingminds.ai",
    "required_skill": "c++"
  },
  {
    "job_id": 968116,
    "job_title": "Data Scientist",
    "salary_year_avg": "57000.0",
    "company_name": "Turingminds.ai",
    "required_skill": "c"
  },
  {
    "job_id": 968116,
    "job_title": "Data Scientist",
    "salary_year_avg": "57000.0",
    "company_name": "Turingminds.ai",
    "required_skill": "cassandra"
  },
  {
    "job_id": 968116,
    "job_title": "Data Scientist",
    "salary_year_avg": "57000.0",
    "company_name": "Turingminds.ai",
    "required_skill": "spark"
  },
  {
    "job_id": 1090854,
    "job_title": "Data Scientist",
    "salary_year_avg": "56814.0",
    "company_name": "PTS Consulting Services",
    "required_skill": "sql"
  },
  {
    "job_id": 1090854,
    "job_title": "Data Scientist",
    "salary_year_avg": "56814.0",
    "company_name": "PTS Consulting Services",
    "required_skill": "python"
  },
  {
    "job_id": 588378,
    "job_title": "Data Scientist",
    "salary_year_avg": "55500.0",
    "company_name": "Recro LLC",
    "required_skill": "sheets"
  },
  {
    "job_id": 276621,
    "job_title": "Data Scientist",
    "salary_year_avg": "55000.0",
    "company_name": "Health Advocate",
    "required_skill": "go"
  },
  {
    "job_id": 570292,
    "job_title": "Data Scientist",
    "salary_year_avg": "55000.0",
    "company_name": "Hyfe",
    "required_skill": "python"
  },
  {
    "job_id": 570292,
    "job_title": "Data Scientist",
    "salary_year_avg": "55000.0",
    "company_name": "Hyfe",
    "required_skill": "r"
  },
  {
    "job_id": 570292,
    "job_title": "Data Scientist",
    "salary_year_avg": "55000.0",
    "company_name": "Hyfe",
    "required_skill": "javascript"
  },
  {
    "job_id": 570292,
    "job_title": "Data Scientist",
    "salary_year_avg": "55000.0",
    "company_name": "Hyfe",
    "required_skill": "c++"
  },
  {
    "job_id": 570292,
    "job_title": "Data Scientist",
    "salary_year_avg": "55000.0",
    "company_name": "Hyfe",
    "required_skill": "aws"
  },
  {
    "job_id": 570292,
    "job_title": "Data Scientist",
    "salary_year_avg": "55000.0",
    "company_name": "Hyfe",
    "required_skill": "tensorflow"
  },
  {
    "job_id": 570292,
    "job_title": "Data Scientist",
    "salary_year_avg": "55000.0",
    "company_name": "Hyfe",
    "required_skill": "pytorch"
  },
  {
    "job_id": 570292,
    "job_title": "Data Scientist",
    "salary_year_avg": "55000.0",
    "company_name": "Hyfe",
    "required_skill": "react"
  },
  {
    "job_id": 570292,
    "job_title": "Data Scientist",
    "salary_year_avg": "55000.0",
    "company_name": "Hyfe",
    "required_skill": "django"
  },
  {
    "job_id": 570292,
    "job_title": "Data Scientist",
    "salary_year_avg": "55000.0",
    "company_name": "Hyfe",
    "required_skill": "flask"
  },
  {
    "job_id": 1781424,
    "job_title": "Data Scientist",
    "salary_year_avg": "55000.0",
    "company_name": "T-Stone Technologies Inc",
    "required_skill": "sql"
  },
  {
    "job_id": 1781424,
    "job_title": "Data Scientist",
    "salary_year_avg": "55000.0",
    "company_name": "T-Stone Technologies Inc",
    "required_skill": "python"
  },
  {
    "job_id": 1781424,
    "job_title": "Data Scientist",
    "salary_year_avg": "55000.0",
    "company_name": "T-Stone Technologies Inc",
    "required_skill": "java"
  },
  {
    "job_id": 1781424,
    "job_title": "Data Scientist",
    "salary_year_avg": "55000.0",
    "company_name": "T-Stone Technologies Inc",
    "required_skill": "c++"
  },
  {
    "job_id": 1781424,
    "job_title": "Data Scientist",
    "salary_year_avg": "55000.0",
    "company_name": "T-Stone Technologies Inc",
    "required_skill": "spark"
  },
  {
    "job_id": 1781424,
    "job_title": "Data Scientist",
    "salary_year_avg": "55000.0",
    "company_name": "T-Stone Technologies Inc",
    "required_skill": "hadoop"
  },
  {
    "job_id": 1781424,
    "job_title": "Data Scientist",
    "salary_year_avg": "55000.0",
    "company_name": "T-Stone Technologies Inc",
    "required_skill": "kafka"
  },
  {
    "job_id": 1781424,
    "job_title": "Data Scientist",
    "salary_year_avg": "55000.0",
    "company_name": "T-Stone Technologies Inc",
    "required_skill": "react"
  },
  {
    "job_id": 1781424,
    "job_title": "Data Scientist",
    "salary_year_avg": "55000.0",
    "company_name": "T-Stone Technologies Inc",
    "required_skill": "angular"
  },
  {
    "job_id": 1781424,
    "job_title": "Data Scientist",
    "salary_year_avg": "55000.0",
    "company_name": "T-Stone Technologies Inc",
    "required_skill": "django"
  },
  {
    "job_id": 1781424,
    "job_title": "Data Scientist",
    "salary_year_avg": "55000.0",
    "company_name": "T-Stone Technologies Inc",
    "required_skill": "jenkins"
  },
  {
    "job_id": 1781424,
    "job_title": "Data Scientist",
    "salary_year_avg": "55000.0",
    "company_name": "T-Stone Technologies Inc",
    "required_skill": "kubernetes"
  },
  {
    "job_id": 1781424,
    "job_title": "Data Scientist",
    "salary_year_avg": "55000.0",
    "company_name": "T-Stone Technologies Inc",
    "required_skill": "docker"
  },
  {
    "job_id": 137409,
    "job_title": "Data Scientist",
    "salary_year_avg": "30750.0",
    "company_name": "Snaphyre",
    "required_skill": "sql"
  },
  {
    "job_id": 668679,
    "job_title": "Data Scientist",
    "salary_year_avg": "30750.0",
    "company_name": "Snaphyre",
    "required_skill": "sql"
  }
]

*/