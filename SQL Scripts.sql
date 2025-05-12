CREATE DATABASE marketing;
USE marketing; 

SELECT *
FROM bank_;

DESCRIBE bank_;

SELECT COUNT(*) AS total_records FROM bank_;
SELECT * FROM bank_ LIMIT 5;

SELECT 
    SUM(age IS NULL) AS null_age,
    SUM(job IS NULL) AS null_job,
    SUM(marital IS NULL) AS null_marital,
    SUM(education IS NULL) AS null_education,
    SUM(balance IS NULL) AS null_balance,
    SUM(duration IS NULL) AS null_duration
FROM bank_;

SELECT 
    MIN(age) AS min_age, MAX(age) AS max_age, AVG(age) AS avg_age, STD(age) AS std_age,
    MIN(balance) AS min_balance, MAX(balance) AS max_balance, AVG(balance) AS avg_balance,
    MIN(duration) AS min_duration, MAX(duration) AS max_duration, AVG(duration) AS avg_duration
FROM bank_;

SELECT job, COUNT(*) AS count FROM bank_ GROUP BY job ORDER BY count DESC;
SELECT marital, COUNT(*) FROM bank_ GROUP BY marital;
SELECT education, COUNT(*) FROM bank_ GROUP BY education;
SELECT contact, COUNT(*) FROM bank_ GROUP BY contact;


SELECT y, COUNT(*) AS count FROM bank_ GROUP BY y;

SELECT y, AVG(duration) AS avg_duration FROM bank_ GROUP BY y;

SELECT y, AVG(balance) AS avg_balance FROM bank_ GROUP BY y;

SELECT y, AVG(campaign) AS avg_contacts FROM bank_ GROUP BY y;

SELECT pdays, COUNT(*) FROM bank_ GROUP BY pdays ORDER BY COUNT(*) DESC;

SELECT month, COUNT(*) AS contacts, 
       SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END) AS success
FROM bank_
GROUP BY month
ORDER BY FIELD(month, 'jan','feb','mar','apr','may','jun','jul','aug','sep','oct','nov','dec');

SELECT 
    CASE 
        WHEN age < 25 THEN 'Under 25'
        WHEN age BETWEEN 25 AND 34 THEN '25-34'
        WHEN age BETWEEN 35 AND 44 THEN '35-44'
        WHEN age BETWEEN 45 AND 54 THEN '45-54'
        WHEN age >= 55 THEN '55+'
    END AS age_group,
    COUNT(*) AS total,
    SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END) AS subscribed
FROM bank_
GROUP BY age_group;




