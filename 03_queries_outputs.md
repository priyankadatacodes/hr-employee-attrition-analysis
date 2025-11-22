-----------------------------------------------
1. OVERALL ATTRITION METRICS
-----------------------------------------------
1.1 Total Attrition & Rate
SELECT 
    COUNT(*) AS total_employees,
    SUM(attrition='Yes') AS total_exits,
    ROUND(SUM(attrition='Yes')*100.0/COUNT(*),2) AS attrition_rate_pct
FROM employee_attrition;
### **Output**

| total_employees | total_exits | attrition_rate_pct |
|-----------------|-------------|---------------------|
| 1470            | 237         | 16.12%             |


Insight:
Company-wide attrition is 16.1%, which is moderate but signals potential risk areas.

-----------------------------------------------
2. DEMOGRAPHIC ATTRITION ANALYSIS
-----------------------------------------------
2.1 Attrition by Age Group
SELECT 
    CASE 
        WHEN age < 25 THEN '18-24'
        WHEN age BETWEEN 25 AND 30 THEN '25-30'
        WHEN age BETWEEN 31 AND 40 THEN '31-40'
        WHEN age BETWEEN 41 AND 50 THEN '41-50'
        ELSE '51+' 
    END AS age_group,
    COUNT(*) AS total,
    SUM(attrition='Yes') AS exits,
    ROUND(SUM(attrition='Yes')*100.0/COUNT(*),2) AS exit_rate_pct
FROM employee_attrition
GROUP BY age_group
ORDER BY exit_rate_pct DESC;

### **Output**

| age_group | total | exits | exit_rate_pct |
|-----------|--------|--------|----------------|
| 18-24     | 90     | 28     | 31.11%         |
| 25-30     | 259    | 61     | 23.55%         |
| 31-40     | 527    | 79     | 14.99%         |
| 41-50     | 329    | 36     | 10.94%         |
| 51+       | 265    | 11     | 4.15%          |



Insight:
Attrition is highest among young employees (18–30) — indicating instability or better opportunities elsewhere.

-----------------------------------------------
3. ATTRITION KPIs BY BUSINESS SEGMENT
-----------------------------------------------
3.1 Department-wise Attrition
SELECT department, COUNT(*) AS total, 
    SUM(attrition='Yes') AS exits,
    ROUND(SUM(attrition='Yes')*100.0/COUNT(*),2) AS exit_rate_pct
FROM employee_attrition
GROUP BY department
ORDER BY exit_rate_pct DESC;


### **Output**

| department             | total | exits | exit_rate_pct |
|------------------------|-------|--------|----------------|
| Sales                  | 446   | 92     | 20.63%         |
| Human Resources        | 63    | 12     | 19.05%         |
| Research & Development | 961   | 133    | 13.84%         |


Insight:
Sales has the highest attrition — expected due to pressure, travel, and KPIs.

3.2 Top 5 High-Risk Job Roles
SELECT jobrole, COUNT(*) AS total, 
       SUM(attrition='Yes') AS exits,
       ROUND(SUM(attrition='Yes')*100.0/COUNT(*),2) AS exit_rate_pct
FROM employee_attrition
GROUP BY jobrole
ORDER BY exit_rate_pct DESC
LIMIT 5;

### **Output**

| jobrole               | total | exits | exit_rate_pct |
|-----------------------|-------|--------|----------------|
| Sales Representative  | 83    | 33     | 39.76%         |
| Laboratory Technician | 259   | 62     | 23.94%         |
| Human Resources       | 52    | 12     | 23.08%         |
| Sales Executive       | 326   | 57     | 17.48%         |
| Research Scientist    | 292   | 47     | 16.10%         |


Insight:
Sales Representatives attrition ~40% → needs urgent intervention.

3.3 Attrition by Marital Status
SELECT maritalstatus, COUNT(*) AS total, 
    SUM(attrition='Yes') AS exits,
    ROUND(SUM(attrition='Yes')*100.0/COUNT(*),2) AS exit_rate_pct
FROM employee_attrition
GROUP BY maritalstatus
ORDER BY exit_rate_pct DESC;

### **Output**

| maritalstatus | total | exits | exit_rate_pct |
|---------------|-------|--------|----------------|
| Single        | 470   | 120    | 25.53%         |
| Married       | 673   | 84     | 12.48%         |
| Divorced      | 327   | 33     | 10.09%         |



Insight:
Singles are more likely to leave — younger, mobile, early-career profiles.

3.4 Attrition by Overtime
SELECT overtime, COUNT(*) AS total,
    SUM(attrition='Yes') AS exits,
    ROUND(SUM(attrition='Yes')*100.0/COUNT(*),2) AS exit_rate_pct
FROM employee_attrition
GROUP BY overtime;

### **Output**

| overtime | total | exits | exit_rate_pct |
|----------|-------|--------|----------------|
| Yes      | 416   | 127    | 30.53%         |
| No       | 1054  | 110    | 10.44%         |


Insight:
Overtime employees have 3× higher exit rate → confirms workload stress.

3.5 Attrition by Gender
SELECT gender, COUNT(*) AS total, 
    SUM(attrition='Yes') AS exits,
    ROUND(SUM(attrition='Yes')*100.0/COUNT(*),2) AS exit_rate_pct
FROM employee_attrition
GROUP BY gender;

### **Output**

| gender | total | exits | exit_rate_pct |
|--------|-------|--------|----------------|
| Male   | 882   | 150    | 17.01%         |
| Female | 588   | 87     | 14.80%         |



Insight:
Gender is not a major attrition driver.

------------------------------------------------
4. MULTI-DIMENSIONAL MATRIX ANALYSIS
------------------------------------------------
4.1 Business Travel × Department
SELECT businesstravel, department, COUNT(*) AS total,
    SUM(attrition='Yes') AS exits,
    ROUND(SUM(attrition='Yes')*100.0/COUNT(*),2) AS exit_rate_pct
FROM employee_attrition
GROUP BY businesstravel, department
ORDER BY exit_rate_pct DESC;


### **Output**

| businesstravel      | department | total | exits | exit_rate_pct |
|----------------------|-------------|-------|--------|----------------|
| Travel_Frequently    | Sales       | 127   | 38     | 29.92%         |
| Travel_Rarely        | Sales       | 274   | 50     | 18.25%         |
| Travel_Frequently    | R&D         | 131   | 22     | 16.79%         |
| Non-Travel           | Sales       | 45    | 4      | 8.89%          |

Insight:
Sales + Frequent Travel = highest-risk segment.

4.2 Department × Gender
SELECT department, gender, COUNT(*) AS total,
    SUM(attrition='Yes') AS exits,
    ROUND(SUM(attrition='Yes')*100.0/COUNT(*),2) AS exit_rate_pct
FROM employee_attrition
GROUP BY department, gender
ORDER BY department, gender;

### **Output**

| department       | gender | total | exits | exit_rate_pct |
|------------------|--------|-------|--------|----------------|
| Sales            | Male   | 269   | 58     | 21.56%         |
| Sales            | Female | 177   | 34     | 19.21%         |
| Human Resources  | Female | 36    | 8      | 22.22%         |
| Human Resources  | Male   | 27    | 4      | 14.81%         |
| R&D              | Male   | 586   | 88     | 15.02%         |
| R&D              | Female | 375   | 45     | 12.00%         |



Insight:
HR females show higher attrition → workplace factors or fit.

------------------------------------------------
5. EDA / UNIQUE VALUE CHECKS
------------------------------------------------
5.1 Unique Counts
SELECT COUNT(DISTINCT jobrole) AS n_jobroles,
       COUNT(DISTINCT department) AS n_departments,
       COUNT(DISTINCT businesstravel) AS n_travelmodes,
       COUNT(DISTINCT educationfield) AS n_educfields
FROM employee_attrition;

### **Output**

| n_jobroles | n_departments | n_travelmodes | n_educfields |
|------------|----------------|----------------|---------------|
| 9          | 3              | 3              | 6             |


5.2 Range Summary (Min/Avg/Max)
SELECT 
    MIN(monthlyincome) AS min_income, MAX(monthlyincome) AS max_income, AVG(monthlyincome) AS avg_income,
    MIN(age) AS min_age, MAX(age) AS max_age, AVG(age) AS avg_age,
    MIN(yearsatcompany) AS min_tenure, MAX(yearsatcompany) AS max_tenure, AVG(yearsatcompany) AS avg_tenure
FROM employee_attrition;

### **Output**

| min_income | max_income | avg_income | min_age | max_age | avg_age | min_tenure | max_tenure | avg_tenure |
|------------|------------|------------|---------|---------|---------|------------|------------|------------|
| 1009       | 19999      | 6503       | 18      | 60      | 37      | 0          | 40         | 7          |


5.3 High-Tenure Attrition (>10 years)
SELECT COUNT(*) AS total_high_tenure, 
       SUM(attrition='Yes') AS exited_high_tenure,
       ROUND(SUM(attrition='Yes')*100.0/COUNT(*),2) AS exit_rate_pct
FROM employee_attrition
WHERE yearsatcompany > 10;


### **Output**

| total_high_tenure | exited_high_tenure | exit_rate_pct |
|-------------------|---------------------|----------------|
| 285               | 16                  | 5.61%          |


Insight:
Long-tenure employees are loyal (5.6% attrition).

------------------------------------------------
6. PERFORMANCE & SATISFACTION ANALYSIS
------------------------------------------------
6.1 Performance Rating × Attrition
SELECT performancerating, attrition, COUNT(*) AS emp_count
FROM employee_attrition
GROUP BY performancerating, attrition
ORDER BY performancerating, attrition;

### **Output**

| rating | attrition | emp_count |
|--------|-----------|-----------|
| 3      | No        | 1044      |
| 3      | Yes       | 200       |
| 4      | No        | 189       |
| 4      | Yes       | 37        |


Insight:
Even high performers are leaving → lack of recognition or growth.

6.2 Environmental Satisfaction
SELECT attrition, AVG(environmentsatisfaction) AS avg_envsat
FROM employee_attrition GROUP BY attrition;

### **Output**

| attrition | avg_envsat |
|-----------|------------|
| Yes       | 2.46       |
| No        | 2.77       |


Insight:
Departing employees report poorer environment satisfaction.

6.3 Relationship Satisfaction
SELECT attrition, AVG(relationshipsatisfaction) AS avg_relsat
FROM employee_attrition GROUP BY attrition;

### **Output**

| attrition | avg_relsat |
|-----------|------------|
| Yes       | 2.60       |
| No        | 2.73       |


6.4 Work–Life Balance
SELECT attrition, AVG(worklifebalance) AS avg_worklifebalance
FROM employee_attrition GROUP BY attrition;


### **Output**

| attrition | avg_worklifebalance |
|-----------|----------------------|
| Yes       | 2.66                 |
| No        | 2.78                 |


Insight:
Low work-life balance strongly tied to attrition.

------------------------------------------------
7. DAILYRATE / MONTHLYRATE / TRAINING EDA
------------------------------------------------
SELECT attrition,
    AVG(dailyrate) AS avg_dailyrate, MIN(dailyrate) AS min_dailyrate, MAX(dailyrate) AS max_dailyrate,
    AVG(monthlyrate) AS avg_monthlyrate, MIN(monthlyrate) AS min_monthlyrate, MAX(monthlyrate) AS max_monthlyrate,
    AVG(trainingtimeslastyear) AS avg_training, MIN(trainingtimeslastyear) AS min_training, MAX(trainingtimeslastyear) AS max_training
FROM employee_attrition
GROUP BY attrition;

### **Output**

| attrition | avg_dailyrate | min_dailyrate | max_dailyrate | avg_monthlyrate | min_monthlyrate | max_monthlyrate | avg_training |
|-----------|---------------|----------------|----------------|------------------|------------------|------------------|--------------|
| Yes       | 750           | 103            | 1491           | 14559            | 2323             | 26999            | 2.62         |
| No        | 812           | 102            | 1499           | 14265            | 2094             | 26997            | 2.83         |


Insight:
Training is slightly higher for retained employees → development matters.

-----------------------------------------------
END OF THE PROJECT-----------------------------------------------
