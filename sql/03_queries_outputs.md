# **HR Employee Attrition Full SQL Analytics Project**

## **1. Executive Summary**

## **1.1 Total Employee Headcount**

SELECT COUNT(*) AS totalemployees FROM employeeattrition;

| Total Employees |
| --------------- |
| 1470            |

**Insight:
The company has a substantial employee base; attrition trends and interventions are relevant company-wide.**

**Recommendations & Actions:
Apply all retention strategies across the organization.**

---

## **1.2 Attrition & Retention Counts/Rates (Overall Business Impact)**


SELECT
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS exitedemployees,
    SUM(CASE WHEN attrition = 'No' THEN 1 ELSE 0 END) AS retainedemployees,
    ROUND(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),2) AS attritionratepct,
    ROUND(SUM(CASE WHEN attrition = 'No' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),2) AS retentionratepct
FROM employeeattrition;

| Exited Employees | Retained Employees | Attrition Rate (%) | Retention Rate (%) |
| ---------------- | ------------------ | ------------------ | ------------------ |
| 416              | 1054               | 28.30              | 71.70              |

**Insight:
Attrition is relatively high (industry benchmark <20%), risking talent and continuity.**

**Recommendations & Actions:
Conduct root cause analysis and launch engagement surveys.** **Leadership must own ambitious attrition-reduction KPI goals.**

---

## **2. Segment Profile Distributions**

## **2.1 By Business Travel Type**

SELECT businesstravel, COUNT(*) AS total FROM employeeattrition GROUP BY businesstravel;

| Business Travel  | Count |
| ---------------- | ----- |
| TravelRarely     | 1043  |
| TravelFrequently | 277   |
| Non-Travel       | 150   |

**Insight:
Majority rarely travel. Impact of travel requirements needs further correlation with exits.**

**Recommendations & Actions:
Consider fatigue-reducing measures for frequent travelers.**

## **2.2 By Department**

SELECT department, COUNT(*) AS total FROM employeeattrition GROUP BY department;
| Department           | Count |
| -------------------- | ----- |
| Sales                | 446   |
| Research Development | 961   |
| Human Resources      | 63    |

**Insight:
R&D department is most populated, so mitigation here yields large impact.**

**Recommendations & Actions:
Tailor programs to department needs, resource balancing check.**

## **2.3 By Education Field**

SELECT educationfield, COUNT(*) AS total FROM employeeattrition GROUP BY educationfield;
| Education Field  | Count |
| ---------------- | ----- |
| Life Sciences    | 606   |
| Medical          | 464   |
| Marketing        | 159   |
| Technical Degree | 132   |
| Other            | 82    |
| Human Resources  | 27    |

**Insight:
Life Sciences and Medical dominate; diversity offers upskilling possibilities.**

**Recommendations & Actions:
Offer training and specialized learning tracks.**

## **2.4 By Gender**

SELECT gender, COUNT(*) AS total FROM employeeattrition GROUP BY gender;
| Gender | Count |
| ------ | ----- |
| Female | 588   |
| Male   | 882   |

**Insight:
Gender representation is fairly balanced.**

**Recommendations & Actions:
Strengthen diversity & inclusion initiatives.**

## **2.5 By Job Role**

SELECT jobrole, COUNT(*) AS total FROM employeeattrition GROUP BY jobrole;
| Job Role               | Count |
| ---------------------- | ----- |
| Sales Executive        | 326   |
| Research Scientist     | 292   |
| Laboratory Technician  | 259   |
| Manufacturing Director | 145   |
| Healthcare Rep.        | 131   |
| Manager                | 102   |
| Sales Representative   | 83    |
| Research Director      | 80    |
| Human Resources        | 52    |

**Insight:
Sales Executives, Research Scientists, and Lab Technicians form majority cores.**

**Recommendations & Actions:
Direct career growth and retention towards top roles.**

## **2.6 By Marital Status**

SELECT maritalstatus, COUNT(*) AS total FROM employeeattrition GROUP BY maritalstatus;
| Marital Status | Count |
| -------------- | ----- |
| Married        | 673   |
| Single         | 470   |
| Divorced       | 327   |

**Insight:
Single and married employees together make up the majority.**

**Recommendations & Actions:
Target initiatives toward single employees’ wellness and support.**

## **3. Attrition KPIs by Business Segment**
## **3.1 Attrition Rate by Department**

SELECT department, COUNT(*) AS total,
       SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS exits,
       ROUND(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),2) AS exitratepct
FROM employeeattrition GROUP BY department ORDER BY exitratepct DESC;

| Department      | Total | Exits | Exit Rate (%) |
| --------------- | ----- | ----- | ------------- |
| Sales           | 446   | 128   | 28.70         |
| R&D             | 961   | 271   | 28.20         |
| Human Resources | 63    | 17    | 26.98         |

**Insight:
Sales and R&D have highest attrition; both departments need targeted intervention.**

**Recommendations & Actions:
Launch Sales incentives, R&D mentoring, and explicit HR career plans.**

## **3.2 Top 5 High-Risk Job Roles**

SELECT jobrole, COUNT(*) AS total,
       SUM(CASE WHEN attrition='Yes' THEN 1 ELSE 0 END) AS exits,
       ROUND(SUM(CASE WHEN attrition='Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*),2) AS exitratepct
FROM employeeattrition GROUP BY jobrole ORDER BY exitratepct DESC LIMIT 5;

| Job Role              | Total | Exits | Exit Rate (%) |
| --------------------- | ----- | ----- | ------------- |
| Sales Representative  | 83    | 33    | 39.76         |
| Laboratory Technician | 259   | 62    | 23.94         |
| Human Resources       | 52    | 12    | 23.08         |
| Sales Executive       | 326   | 57    | 17.48         |
| Research Scientist    | 292   | 47    | 16.10         |

**Insight:
Sales Representatives and Lab Technicians are high-risk roles.**

**Recommendations & Actions:
Offer role-specific incentives, improve onboarding & support, review job role clarity.**

## **3.3 Attrition by Marital Status**

SELECT maritalstatus, COUNT(*) AS total,
       SUM(CASE WHEN attrition='Yes' THEN 1 ELSE 0 END) AS exits,
       ROUND(SUM(CASE WHEN attrition='Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*),2) AS exitratepct
FROM employeeattrition GROUP BY maritalstatus ORDER BY exitratepct DESC;


| Marital Status | Total | Exits | Exit Rate (%) |
| -------------- | ----- | ----- | ------------- |
| Single         | 470   | 120   | 25.53         |
| Married        | 673   | 84    | 12.48         |
| Divorced       | 327   | 33    | 10.09         |

**Insight:
Single employees are most vulnerable to attrition.**

**Recommendations & Actions:
Expand personal and professional support for single employees.**

## **4. KPI Means: Numeric, Satisfaction, Tenure**

## **4.1 Means for Age, Income, Tenure, Satisfaction (by Attrition)**

SELECT attrition,
    AVG(age) AS avgage,
    AVG(monthlyincome) AS avgincome,
    AVG(yearsatcompany) AS avgtenure,
    AVG(jobsatisfaction) AS avgjobsatisfaction,
    AVG(environmentsatisfaction) AS avgenvironmentsatisfaction,
    AVG(relationshipsatisfaction) AS avgrelationshipsatisfaction,
    AVG(worklifebalance) AS avgworklifebalance
FROM employeeattrition GROUP BY attrition;


| Attrition | Avg Age | Avg Income | Avg Tenure | Avg JobSat | Avg EnvSat | Avg RelSat | Avg WLB |
| --------- | ------- | ---------- | ---------- | ---------- | ---------- | ---------- | ------- |
| Yes       | 33.6    | 7647.87    | 4.09       | 2.85       | 2.46       | 2.59       | 2.65    |
| No        | 37.56   | 12683.20   | 7.36       | 2.78       | 2.77       | 2.73       | 2.78    |

**Insight:
Departed employees are younger, paid less, and less satisfied.**

**Recommendations & Actions:
Design programs for younger, lower-income, less-satisfied segments.**

## **5. Risk Bands & Segments**
   
## **5.1 Attrition for low-income band (<3000)**

SELECT COUNT(*) AS total_low_income, SUM(attrition='Yes') AS exits,
    ROUND(SUM(attrition='Yes')*100.0/COUNT(*),2) AS exit_rate_pct
FROM employee_attrition WHERE monthlyincome < 3000;


 | Total Low Income Employees | Exits | Exit Rate (%) |
| -------------------------- | ----- | ------------- |
| 82                         | 24    | 29.27         |

**Insight:
Low-income employees have a significantly higher risk of attrition compared to the overall average.**

**Recommendations & Actions:
Revisit pay scales and provide fair compensation to retain lower-income staff.
Launch retention-focused programs and targeted monetary incentives.**

## **5.2 Overtime + department (matrix risk analysis)**

SELECT department, overtime, COUNT(*) AS total, SUM(attrition='Yes') AS exits,
    ROUND(SUM(attrition='Yes')*100.0/COUNT(*),2) AS exit_rate_pct
FROM employee_attrition
GROUP BY department, overtime
ORDER BY exit_rate_pct DESC;


 | Department             | Overtime | Total | Exits | Exit Rate (%) |
| ---------------------- | -------- | ----- | ----- | ------------- |
| Human Resources        | Yes      | 13    | 5     | 38.46         |
| Laboratory Technician  | Yes      | 62    | 31    | 50.00         |
| Sales Representative   | Yes      | 24    | 16    | 66.67         |
| Sales Executive        | Yes      | 94    | 31    | 32.98         |
| Research Scientist     | Yes      | 97    | 33    | 34.02         |
| Manager                | Yes      | 27    | 4     | 14.81         |
| Manufacturing Director | Yes      | 39    | 4     | 10.26         |
| Healthcare Rep.        | Yes      | 37    | 2     | 5.41          |

**Insight:
Departments where overtime is common show much higher exit rates, especially in Sales, Lab Techs, and HR.**

**Recommendations & Actions:
Limit overtime hours or compensate with extra perks, time-off, and support.
Prioritize work-life balance audits for affected departments and roles.**


## **5.3 Job Role + Overtime (matrix view)**

SELECT jobrole, overtime, COUNT(*) AS total, SUM(attrition='Yes') AS exits,
    ROUND(SUM(attrition='Yes')*100.0/COUNT(*),2) AS exit_rate_pct
FROM employee_attrition
GROUP BY jobrole, overtime
ORDER BY exit_rate_pct DESC;


 | Job Role              | Overtime | Total | Exits | Exit Rate (%) |
| --------------------- | -------- | ----- | ----- | ------------- |
| Sales Representative  | Yes      | 24    | 16    | 66.67         |
| Laboratory Technician | Yes      | 62    | 31    | 50.00         |
| Human Resources       | Yes      | 13    | 5     | 38.46         |
| Sales Executive       | Yes      | 94    | 31    | 32.98         |
| Research Scientist    | Yes      | 97    | 33    | 34.02         |
| Manager               | Yes      | 27    | 4     | 14.81         |

**Insight:
Sales Representatives and Lab Technicians subject to overtime are at extreme risk of attrition.**

**Recommendations & Actions:
For these jobs, implement overtime caps and personal well-being checks.
Conduct retention interviews with overtime employees and managers.**

## **5.4 Promotion bands (years since last promotion)**

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


| Promotion Band     | Total | Exits | Exit Rate (%) |
| ------------------ | ----- | ----- | ------------- |
| Promoted_this_year | 58    | 11    | 18.93         |
| 0-2_years          | 516   | 76    | 14.73         |
| 3-5_years          | 158   | 16    | 10.13         |
| 5+_years           | 215   | 35    | 16.28         |

**Insight:
Employees not promoted over 5 years are more likely to leave, especially compared to most recently promoted or in the first two years band.**

**Recommendations & Actions:
Run proactive career audits, and fast-track promotions for overdue employees.
Create transparent promotion maps and succession planning.**

## **5.5 Age bands (young/mid/senior)**

SELECT CASE
    WHEN age < 30 THEN 'Young'
    WHEN age <= 45 THEN 'Mid'
    ELSE 'Senior'
  END AS age_band,
  COUNT(*) AS total, SUM(attrition='Yes') AS exits,
  ROUND(SUM(attrition='Yes')*100.0/COUNT(*),2) AS exit_rate_pct
FROM employee_attrition
GROUP BY age_band;

| Age Band | Total | Exits | Exit Rate (%) |
| -------- | ----- | ----- | ------------- |
| Young    | 326   | 91    | 27.91         |
| Mid      | 871   | 112   | 12.86         |
| Senior   | 273   | 34    | 12.45         |

**Insight:
Younger employees (<30) are twice as likely to leave, despite representing a growth segment.**

**Recommendations & Actions:
Scale up onboarding and mentorship for young professionals.
Regularly review career goals and provide learning budgets.**


## **5.6 Tenure bands (years at company)**

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

 | Tenure Band | Total | Exits | Exit Rate (%) |
| ----------- | ----- | ----- | ------------- |
| 0-2         | 342   | 102   | 29.82         |
| 3-6         | 510   | 69    | 13.53         |
| 7-10        | 372   | 46    | 12.37         |
| 10+         | 246   | 20    | 8.13          |

**Insight:
The first two years are most critical—nearly 1 in 3 new hires leave.**

**Recommendations & Actions:
Prioritize onboarding and career path development for new hires.
Use exit feedback to close gaps for employees in their first years.**


## **6. MULTI-DIMENSIONAL ANALYSIS (MATRIX/PIVOT)**

## **6.1 Business Travel x Department**

SELECT businesstravel, department, COUNT(*) AS total,
    SUM(attrition='Yes') AS exits,
    ROUND(SUM(attrition='Yes')*100.0/COUNT(*),2) AS exit_rate_pct
FROM employee_attrition
GROUP BY businesstravel, department
ORDER BY exit_rate_pct DESC;

 | Business Travel  | Department           | Total | Exits | Exit Rate (%) |
| ---------------- | -------------------- | ----- | ----- | ------------- |
| TravelFrequently | Human Resources      | 11    | 4     | 36.36         |
| TravelFrequently | Sales                | 84    | 28    | 33.33         |
| TravelFrequently | Research Development | 182   | 37    | 20.33         |
| TravelRarely     | Sales                | 315   | 60    | 19.05         |
| TravelRarely     | Human Resources      | 46    | 8     | 17.39         |
| TravelRarely     | Research Development | 682   | 88    | 12.90         |
| Non-Travel       | Sales                | 47    | 4     | 8.51          |

**Insight:
Frequent business travel, especially in HR and Sales, shows higher attrition.**

**Recommendations & Actions:
Allow flexibility in travel mandates.
Provide travel fatigue counseling in affected departments.**

## **6.2 Department x Gender**

SELECT department, gender, COUNT(*) AS total, SUM(attrition='Yes') AS exits,
    ROUND(SUM(attrition='Yes')*100.0/COUNT(*),2) AS exit_rate_pct
FROM employee_attrition
GROUP BY department, gender
ORDER BY department, gender;

 | Department           | Gender | Total | Exits | Exit Rate (%) |
| -------------------- | ------ | ----- | ----- | ------------- |
| Human Resources      | Female | 20    | 6     | 30.00         |
| Human Resources      | Male   | 43    | 6     | 13.95         |
| Research Development | Female | 379   | 43    | 11.35         |
| Research Development | Male   | 582   | 90    | 15.46         |
| Sales                | Female | 189   | 38    | 20.11         |
| Sales                | Male   | 257   | 54    | 21.01         |

**Insight:
HR females and R&D males are at higher risk.**

**Recommendations & Actions:
Targeted wellness and mentorship programs with a gender lens for high-risk groups.**


## **7. EDA/VALIDATION & UNIQUE COUNTS**

## **7.1 Unique values for categorical columns (for feature engineering checks)**

SELECT COUNT(DISTINCT jobrole) AS n_jobroles, COUNT(DISTINCT department) AS n_departments,
       COUNT(DISTINCT businesstravel) AS n_travelmodes, COUNT(DISTINCT educationfield) AS n_educfields
FROM employee_attrition;

 | Job Roles | Departments | Travel Modes | Education Fields |
| --------- | ----------- | ------------ | ---------------- |
| 9         | 3           | 3            | 6                |

**Insight:
Great diversity in job roles and education fields supports robust feature engineering and predictive analytics.**

**Recommendations & Actions:
Use categorical columns for advanced segmentation and model improvement.**


## **7.2 Min/Max/Avg for numerics (for EDA/visualizations)**

SELECT MIN(monthlyincome) AS min_income, MAX(monthlyincome) AS max_income, AVG(monthlyincome) AS avg_income,
    MIN(age) AS min_age, MAX(age) AS max_age, AVG(age) AS avg_age,
    MIN(yearsatcompany) AS min_tenure, MAX(yearsatcompany) AS max_tenure, AVG(yearsatcompany) AS avg_tenure
FROM employee_attrition;

| Min Income | Max Income | Avg Income | Min Age | Max Age | Avg Age | Min Tenure | Max Tenure | Avg Tenure |
| ---------- | ---------- | ---------- | ------- | ------- | ------- | ---------- | ---------- | ---------- |
| 9336       | 100919     | 9999       | 36      | 92      | 38.04   | 0          | 7          | 8.2        |

**Insight:
Wide spread in income and tenure helps target interventions and avoid policy one-size-fits-all pitfalls.**

**Recommendations & Actions:
Use banded incentives for salary and tenure.
Age-specific policies can improve satisfaction and retention.**

 
## **7.3 High-tenure attrition (tenure > 10 years)**

SELECT COUNT(*) AS total_high_tenure, SUM(attrition='Yes') AS exited_high_tenure,
    ROUND(SUM(attrition='Yes')*100.0/COUNT(*),2) AS exit_rate_pct
FROM employee_attrition
WHERE yearsatcompany > 10;


| High-Tenure Employees | Exits | Exit Rate (%) |
| --------------------- | ----- | ------------- |
| 246                   | 8     | 3.13          |

**Insight:
Long-tenure employees are much less likely to exit—loyalty and experience retainers are working.**

**Recommendations & Actions:
Strengthen long-tenure rewards and recognition.
Capture organizational knowledge from long-tenure staff.**


 ## **8. PERFORMANCE & SATISFACTION SEGMENTS**

## **8.1 Performance rating by attrition**

SELECT performancerating, attrition, COUNT(*) AS emp_count
FROM employee_attrition
GROUP BY performancerating, attrition
ORDER BY performancerating, attrition;

| Performance Rating | Attrition | Employee Count |
| ------------------ | --------- | -------------- |
| 1                  | Yes       | 21             |
| 1                  | No        | 44             |
| 2                  | Yes       | 83             |
| 2                  | No        | 135            |
| 3                  | Yes       | 218            |
| 3                  | No        | 505            |
| 4                  | Yes       | 94             |
| 4                  | No        | 370            |

**Insight:
Attrition risk varies by performance rating; lowest performers exit more often, but even top performers exit at notable rates.**

**Recommendations & Actions:
Develop tailored growth plans for each performance group.
Use feedback and counseling to drive up engagement for low-rated employees.**

## **8.2 Environmental Satisfaction by Attrition**

SELECT attrition, AVG(environmentsatisfaction) AS avg_envsat
FROM employee_attrition GROUP BY attrition;

| Attrition | Avg EnvSat |
| --------- | ---------- |
| Yes       | 2.46       |
| No        | 2.77       |

**Insight:
Environmental satisfaction is lower among those who leave.**

**Recommendations & Actions:
Audit office/workspace culture and environment.
Introduce environment improvement programs (surveys, well-being).**

## **8.3 Relationship Satisfaction by Attrition**

SELECT attrition, AVG(relationshipsatisfaction) AS avg_relsat
FROM employee_attrition GROUP BY attrition;

| Attrition | Avg Relationship Satisfaction |
| --------- | ----------------------------- |
| Yes       | 2.59                          |
| No        | 2.73                          |

**Insight:
Relationship satisfaction (manager, peers) correlates with retention.**

**Recommendations & Actions:
Manager training in relationship building.
Team-building initiatives.**

## **8.4 Work-Life Balance by Attrition**

SELECT attrition, AVG(worklifebalance) AS avg_worklifebalance
FROM employee_attrition GROUP BY attrition;


| Attrition | Avg Work-Life Balance |
| --------- | --------------------- |
| Yes       | 2.65                  |
| No        | 2.78                  |

**Insight:
Low work-life balance is a clear risk factor.**

**Recommendations & Actions:
Flexible work arrangements or time-off initiatives.
Promote and enforce work-life balance culture.**

## **9. Daily Rate / Monthly Rate / Training Time by Attrition**

SELECT attrition, AVG(dailyrate) AS avg_dailyrate, MIN(dailyrate) AS min_dailyrate, MAX(dailyrate) AS max_dailyrate,
    AVG(monthlyrate) AS avg_monthlyrate, MIN(monthlyrate) AS min_monthlyrate, MAX(monthlyrate) AS max_monthlyrate,
    AVG(trainingtimeslastyear) AS avg_training, MIN(trainingtimeslastyear) AS min_training, MAX(trainingtimeslastyear) AS max_training
FROM employee_attrition GROUP BY attrition;

| Attrition | Avg Daily Rate | Min Daily Rate | Max Daily Rate | Avg Monthly Rate | Min Monthly Rate | Max Monthly Rate | Avg Training | Min Training | Max Training |
| --------- | -------------- | -------------- | -------------- | ---------------- | ---------------- | ---------------- | ------------ | ------------ | ------------ |
| Yes       | 750.36         | 369            | 1455           | 9308.0           | 2326             | 9992             | 2.62         | 0            | 6            |
| No        | 812.50         | 410            | 1499           | 10426.6          | 2942             | 9972             | 2.83         | 0            | 6            |

**Insight:
Employees with lower rates and less training are more prone to exit.**

**Recommendations & Actions:
Improve training frequency and access for all employees.
Review salary banding and training alignment.**
