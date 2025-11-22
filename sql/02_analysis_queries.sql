-- ===================================================
-- HR EMPLOYEE ATTRITION: FULL SQL ANALYTICS PROJECT
-- ===================================================

-- ============================== 1. EXECUTIVE SUMMARY ==============================

-- 1.1 Total employee headcount
SELECT COUNT(*) AS total_employees FROM employee_attrition;

-- 1.2 Attrition and retention counts/rates (overall business impact summary)
SELECT 
    SUM(attrition='Yes') AS exited_employees,
    SUM(attrition='No')  AS retained_employees,
    ROUND(SUM(attrition='Yes')*100.0/COUNT(*),2) AS attrition_rate_pct,
    ROUND(SUM(attrition='No')*100.0/COUNT(*),2)  AS retention_rate_pct
FROM employee_attrition;

-- ============================== 2. SEGMENT PROFILE DISTRIBUTIONS ==============================

-- 2.1 Employee count by business travel type (travel assignment risk)
SELECT businesstravel, COUNT(*) AS total FROM employee_attrition GROUP BY businesstravel;

-- 2.2 By department (org structure risk)
SELECT department, COUNT(*) AS total FROM employee_attrition GROUP BY department;

-- 2.3 By education field (educational diversity, upskilling planning)
SELECT educationfield, COUNT(*) AS total FROM employee_attrition GROUP BY educationfield;

-- 2.4 By gender, job role, marital status, overtime (baseline breakdowns)
SELECT gender, COUNT(*) AS total FROM employee_attrition GROUP BY gender;
SELECT jobrole, COUNT(*) AS total FROM employee_attrition GROUP BY jobrole;
SELECT maritalstatus, COUNT(*) AS total FROM employee_attrition GROUP BY maritalstatus;
SELECT overtime, COUNT(*) AS total FROM employee_attrition GROUP BY overtime;

-- ============================== 3. ATTRITION KPIs BY BUSINESS SEGMENT ==============================

-- 3.1 Attrition rate by department (HR risk targeting)
SELECT department, COUNT(*) AS total, SUM(attrition='Yes') AS exits,
    ROUND(SUM(attrition='Yes')*100.0/COUNT(*),2) AS exit_rate_pct
FROM employee_attrition
GROUP BY department
ORDER BY exit_rate_pct DESC;

-- 3.2 Top 5 high-risk job roles (targeted intervention priority)
SELECT jobrole, COUNT(*) AS total, SUM(attrition='Yes') AS exits,
    ROUND(SUM(attrition='Yes')*100.0/COUNT(*),2) AS exit_rate_pct
FROM employee_attrition
GROUP BY jobrole
ORDER BY exit_rate_pct DESC
LIMIT 5;

-- 3.3 Attrition by marital status (risk and wellness targeting)
SELECT maritalstatus, COUNT(*) AS total, SUM(attrition='Yes') AS exits,
    ROUND(SUM(attrition='Yes')*100.0/COUNT(*),2) AS exit_rate_pct
FROM employee_attrition
GROUP BY maritalstatus
ORDER BY exit_rate_pct DESC;

-- 3.4 Attrition by overtime and gender (workload, D&I risk)
SELECT overtime, COUNT(*) AS total, SUM(attrition='Yes') AS exits,
    ROUND(SUM(attrition='Yes')*100.0/COUNT(*),2) AS exit_rate_pct
FROM employee_attrition
GROUP BY overtime;

SELECT gender, COUNT(*) AS total, SUM(attrition='Yes') AS exits,
    ROUND(SUM(attrition='Yes')*100.0/COUNT(*),2) AS exit_rate_pct
FROM employee_attrition
GROUP BY gender;

-- ============================== 4. KPI MEANS (NUMERIC, SATISFACTION, TENURE) ==============================

-- 4.1 Means for age, income, tenure, satisfaction by attrition (data for dashboards)
SELECT attrition,
    AVG(age) AS avg_age,
    AVG(monthlyincome) AS avg_income,
    AVG(yearsatcompany) AS avg_tenure,
    AVG(jobsatisfaction) AS avg_jobsatisfaction,
    AVG(environmentsatisfaction) AS avg_environmentsatisfaction,
    AVG(relationshipsatisfaction) AS avg_relationshipsatisfaction,
    AVG(worklifebalance) AS avg_worklifebalance
FROM employee_attrition
GROUP BY attrition;

-- ============================== 5. RISK BANDS & SEGMENTS ==============================

-- 5.1 Attrition for low-income band (<3000)
SELECT COUNT(*) AS total_low_income, SUM(attrition='Yes') AS exits,
    ROUND(SUM(attrition='Yes')*100.0/COUNT(*),2) AS exit_rate_pct
FROM employee_attrition WHERE monthlyincome < 3000;

-- 5.2 Overtime + department (matrix risk analysis)
SELECT department, overtime, COUNT(*) AS total, SUM(attrition='Yes') AS exits,
    ROUND(SUM(attrition='Yes')*100.0/COUNT(*),2) AS exit_rate_pct
FROM employee_attrition
GROUP BY department, overtime
ORDER BY exit_rate_pct DESC;

-- 5.3 Job Role + Overtime (matrix view)
SELECT jobrole, overtime, COUNT(*) AS total, SUM(attrition='Yes') AS exits,
    ROUND(SUM(attrition='Yes')*100.0/COUNT(*),2) AS exit_rate_pct
FROM employee_attrition
GROUP BY jobrole, overtime
ORDER BY exit_rate_pct DESC;

-- 5.4 Promotion bands (years since last promotion)
SELECT CASE
    WHEN yearssincelastpromotion = 0 THEN 'Promoted_this_year'
    WHEN yearssincelastpromotion <= 2 THEN '0-2_years'
    WHEN yearssincelastpromotion <= 5 THEN '3-5_years'
    ELSE '5+_years'
  END AS promotion_band,
  COUNT(*) AS total, SUM(attrition='Yes') AS exits,
  ROUND(SUM(attrition='Yes')*100.0/COUNT(*),2) AS exit_rate_pct
FROM employee_attrition
GROUP BY promotion_band
ORDER BY exit_rate_pct DESC;

-- 5.5 Age bands (young/mid/senior)
SELECT CASE
    WHEN age < 30 THEN 'Young'
    WHEN age <= 45 THEN 'Mid'
    ELSE 'Senior'
  END AS age_band,
  COUNT(*) AS total, SUM(attrition='Yes') AS exits,
  ROUND(SUM(attrition='Yes')*100.0/COUNT(*),2) AS exit_rate_pct
FROM employee_attrition
GROUP BY age_band;

-- 5.6 Tenure bands (years at company)
SELECT CASE
    WHEN yearsatcompany < 3 THEN '0-2'
    WHEN yearsatcompany <= 6 THEN '3-6'
    WHEN yearsatcompany <= 10 THEN '7-10'
    ELSE '10+'
  END AS years_band,
  COUNT(*) AS total, SUM(attrition='Yes') AS exits,
  ROUND(SUM(attrition='Yes')*100.0/COUNT(*),2) AS exit_rate_pct
FROM employee_attrition
GROUP BY years_band;

-- ============================== 6. MULTI-DIMENSIONAL ANALYSIS (MATRIX/PIVOT) ==============================

-- 6.1 Business Travel x Department
SELECT businesstravel, department, COUNT(*) AS total,
    SUM(attrition='Yes') AS exits,
    ROUND(SUM(attrition='Yes')*100.0/COUNT(*),2) AS exit_rate_pct
FROM employee_attrition
GROUP BY businesstravel, department
ORDER BY exit_rate_pct DESC;

-- 6.2 Department x Gender
SELECT department, gender, COUNT(*) AS total, SUM(attrition='Yes') AS exits,
    ROUND(SUM(attrition='Yes')*100.0/COUNT(*),2) AS exit_rate_pct
FROM employee_attrition
GROUP BY department, gender
ORDER BY department, gender;

-- ============================== 7. EDA/VALIDATION & UNIQUE COUNTS ==============================

-- Unique values for categorical columns (for feature engineering checks)
SELECT COUNT(DISTINCT jobrole) AS n_jobroles, COUNT(DISTINCT department) AS n_departments,
       COUNT(DISTINCT businesstravel) AS n_travelmodes, COUNT(DISTINCT educationfield) AS n_educfields
FROM employee_attrition;

-- Min/Max/Avg for numerics (for EDA/visualizations)
SELECT MIN(monthlyincome) AS min_income, MAX(monthlyincome) AS max_income, AVG(monthlyincome) AS avg_income,
    MIN(age) AS min_age, MAX(age) AS max_age, AVG(age) AS avg_age,
    MIN(yearsatcompany) AS min_tenure, MAX(yearsatcompany) AS max_tenure, AVG(yearsatcompany) AS avg_tenure
FROM employee_attrition;

-- High-tenure attrition (tenure > 10 years)
SELECT COUNT(*) AS total_high_tenure, SUM(attrition='Yes') AS exited_high_tenure,
    ROUND(SUM(attrition='Yes')*100.0/COUNT(*),2) AS exit_rate_pct
FROM employee_attrition
WHERE yearsatcompany > 10;

-- ============================== 8. PERFORMANCE & SATISFACTION SEGMENTS ==============================

-- Performance rating by attrition
SELECT performancerating, attrition, COUNT(*) AS emp_count
FROM employee_attrition
GROUP BY performancerating, attrition
ORDER BY performancerating, attrition;

-- Environmental and relationship satisfaction by attrition
SELECT attrition, AVG(environmentsatisfaction) AS avg_envsat
FROM employee_attrition GROUP BY attrition;
SELECT attrition, AVG(relationshipsatisfaction) AS avg_relsat
FROM employee_attrition GROUP BY attrition;
SELECT attrition, AVG(worklifebalance) AS avg_worklifebalance
FROM employee_attrition GROUP BY attrition;

-- ============================== 9. DAILYRATE/MONTHLYRATE/TRAININGTIME EXPLORATORY ==============================

SELECT attrition, AVG(dailyrate) AS avg_dailyrate, MIN(dailyrate) AS min_dailyrate, MAX(dailyrate) AS max_dailyrate,
    AVG(monthlyrate) AS avg_monthlyrate, MIN(monthlyrate) AS min_monthlyrate, MAX(monthlyrate) AS max_monthlyrate,
    AVG(trainingtimeslastyear) AS avg_training, MIN(trainingtimeslastyear) AS min_training, MAX(trainingtimeslastyear) AS max_training
FROM employee_attrition
GROUP BY attrition;

-- =========================================End of Project===========================================

