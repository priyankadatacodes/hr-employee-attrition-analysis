-- ===================================================
-- HR EMPLOYEE ATTRITION: FULL SQL ANALYTICS PROJECT
-- ===================================================

-- ============================== 1. EXECUTIVE SUMMARY ==============================

-- 1.1 Total employee headcount
SELECT COUNT(*) AS total_employees FROM employee_attrition;
**Output:**
| total_employees |
|-----------------|
| 1470            |
    
-- 1.2 Attrition and retention counts/rates (overall business impact summary)
SELECT 
    SUM(attrition='Yes') AS exited_employees,
    SUM(attrition='No')  AS retained_employees,
    ROUND(SUM(attrition='Yes')*100.0/COUNT(*),2) AS attrition_rate_pct,
    ROUND(SUM(attrition='No')*100.0/COUNT(*),2)  AS retention_rate_pct
FROM employee_attrition;
**Output:**
| exited_employees | retained_employees | attrition_rate_pct | retention_rate_pct |
|------------------|--------------------|--------------------|---------------------|
| 237              | 1233               | 16.12              | 83.88               |

**Business Insight:**  
16.12% attrition rate is moderate but indicates room for targeted retention strategies, especially in high-risk segments.
-- ============================== 2. SEGMENT PROFILE DISTRIBUTIONS ==============================

-- 2.1 Employee count by business travel type (travel assignment risk)
SELECT businesstravel, COUNT(*) AS total FROM employee_attrition GROUP BY businesstravel;
**Output:**
| businesstravel      | total |
|---------------------|-------|
| Travel_Rarely       | 1043  |
| Travel_Frequently   | 277   |
| Non-Travel          | 150   |

-- 2.2 By department (org structure risk)
SELECT department, COUNT(*) AS total FROM employee_attrition GROUP BY department;
**Output:**
| department                  | total |
|-----------------------------|-------|
| Research & Development      | 961   |
| Sales                       | 446   |
| Human Resources             | 63    |

**Business Insight:**  
R&D is the largest department (65.4% of workforce) and should be prioritized for retention efforts given its size and business criticality.

-- 2.3 By education field (educational diversity, upskilling planning)
SELECT educationfield, COUNT(*) AS total FROM employee_attrition GROUP BY educationfield;
**Output:**
| educationfield      | total |
|---------------------|-------|
| Life Sciences       | 606   |
| Medical             | 464   |
| Marketing           | 159   |
| Technical Degree    | 132   |
| Other               | 82    |
| Human Resources     | 27    |
    
-- 2.4 By gender, job role, marital status, overtime (baseline breakdowns)
SELECT gender, COUNT(*) AS total FROM employee_attrition GROUP BY gender;
**Output:**
| gender | total |
|--------|-------|
| Male   | 882   |
| Female | 588   |

**Business Insight:**  
Male employees represent 60% of the workforce, while female employees represent 40%.
    
SELECT jobrole, COUNT(*) AS total FROM employee_attrition GROUP BY jobrole;
**Output:**
| jobrole                    | total |
|----------------------------|-------|
| Sales Executive            | 326   |
| Research Scientist         | 292   |
| Laboratory Technician      | 259   |
| Manufacturing Director     | 145   |
| Healthcare Representative  | 131   |
| Manager                    | 102   |
| Sales Representative       | 83    |
| Research Director          | 80    |
| Human Resources            | 52    |

**Business Insight:**  
Sales Executives, Research Scientists, and Laboratory Technicians comprise the top 3 roles, accounting for nearly 60% of total headcount.

SELECT maritalstatus, COUNT(*) AS total FROM employee_attrition GROUP BY maritalstatus;
**Output:**
| maritalstatus | total |
|---------------|-------|
| Married       | 673   |
| Single        | 470   |
| Divorced      | 327   |
    
SELECT overtime, COUNT(*) AS total FROM employee_attrition GROUP BY overtime;
**Output:**
| overtime | total |
|----------|-------|
| No       | 1054  |
| Yes      | 416   |

**Business Insight:**  
28.3% of employees work overtime, a segment that requires close monitoring for burnout and attrition risk.
    


    
-- ============================== 3. ATTRITION KPIs BY BUSINESS SEGMENT ==============================

-- 3.1 Attrition rate by department (HR risk targeting)
SELECT department, COUNT(*) AS total, SUM(attrition='Yes') AS exits,
    ROUND(SUM(attrition='Yes')*100.0/COUNT(*),2) AS exit_rate_pct
FROM employee_attrition
GROUP BY department
ORDER BY exit_rate_pct DESC;
**Output:**
| department                  | total | exits | exit_rate_pct |
|-----------------------------|-------|-------|---------------|
| Sales                       | 446   | 92    | 20.63         |
| Human Resources             | 63    | 12    | 19.05         |
| Research & Development      | 961   | 133   | 13.84         |

**Business Insight:**  
Sales department shows highest attrition (20.63%), requiring immediate attention to compensation, workload, and career progression policies. HR also shows elevated risk at 19.05%.
    
-- 3.2 Top 5 high-risk job roles (targeted intervention priority)
SELECT jobrole, COUNT(*) AS total, SUM(attrition='Yes') AS exits,
    ROUND(SUM(attrition='Yes')*100.0/COUNT(*),2) AS exit_rate_pct
FROM employee_attrition
GROUP BY jobrole
ORDER BY exit_rate_pct DESC
LIMIT 5;
**Output:**
| jobrole                    | total | exits | exit_rate_pct |
|----------------------------|-------|-------|---------------|
| Sales Representative       | 83    | 33    | 39.76         |
| Laboratory Technician      | 259   | 62    | 23.94         |
| Human Resources            | 52    | 12    | 23.08         |
| Sales Executive            | 326   | 57    | 17.48         |
| Research Scientist         | 292   | 47    | 16.10         |

**Business Insight:**  
Sales Representatives face extreme attrition (39.76% - nearly 2.5x the company average), followed by Laboratory Technicians (23.94%). These roles need urgent review of compensation, growth opportunities, and job satisfaction drivers.
    
-- 3.3 Attrition by marital status (risk and wellness targeting)
SELECT maritalstatus, COUNT(*) AS total, SUM(attrition='Yes') AS exits,
    ROUND(SUM(attrition='Yes')*100.0/COUNT(*),2) AS exit_rate_pct
FROM employee_attrition
GROUP BY maritalstatus
ORDER BY exit_rate_pct DESC;
**Output:**
| maritalstatus | total | exits | exit_rate_pct |
|---------------|-------|-------|---------------|
| Single        | 470   | 120   | 25.53         |
| Married       | 673   | 84    | 12.48         |
| Divorced      | 327   | 33    | 10.09         |

**Business Insight:**  
Single employees show significantly higher attrition (25.53% - more than double married employees), indicating younger, more mobile workforce with fewer long-term commitments.
    
-- 3.4 Attrition by overtime and gender (workload, D&I risk)
SELECT overtime, COUNT(*) AS total, SUM(attrition='Yes') AS exits,
    ROUND(SUM(attrition='Yes')*100.0/COUNT(*),2) AS exit_rate_pct
FROM employee_attrition
GROUP BY overtime;
**Output:**
| overtime | total | exits | exit_rate_pct |
|----------|-------|-------|---------------|
| Yes      | 416   | 127   | 30.53         |
| No       | 1054  | 110   | 10.44         |

**Business Insight:**  
Employees working overtime show nearly 3x higher attrition (30.53% vs 10.44%), suggesting workload stress, burnout, and poor work-life balance rather than engagement.
    
SELECT gender, COUNT(*) AS total, SUM(attrition='Yes') AS exits,
    ROUND(SUM(attrition='Yes')*100.0/COUNT(*),2) AS exit_rate_pct
FROM employee_attrition
GROUP BY gender;
**Output:**
| gender | total | exits | exit_rate_pct |
|--------|-------|-------|---------------|
| Male   | 882   | 150   | 17.01         |
| Female | 588   | 87    | 14.80         |

**Business Insight:**  
Male employees show slightly higher attrition (17.01% vs 14.80%), but the gap is relatively small. Gender is not a primary attrition driver.

    
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

**Output:**
| attrition | avg_age | avg_income | avg_tenure | avg_jobsatisfaction | avg_environmentsatisfaction | avg_relationshipsatisfaction | avg_worklifebalance |
|-----------|---------|------------|------------|---------------------|----------------------------|------------------------------|---------------------|
| Yes       | 33.61   | 4787.09    | 5.13       | 2.47                | 2.46                       | 2.60                         | 2.66                |
| No        | 37.56   | 6832.74    | 7.37       | 2.78                | 2.77                       | 2.73                         | 2.78                |

**Business Insight:**  
Clear gaps exist between attrition and retained groups:
- Employees who left are **younger** (33.61 vs 37.56 years)
- Earn **significantly less** (₹4787 vs ₹6832 - a 43% gap)
- Have **lower tenure** (5.13 vs 7.37 years)
- Report **lower satisfaction** across all metrics (job, environment, relationships, work-life balance)
    
-- ============================== 5. RISK BANDS & SEGMENTS ==============================

-- 5.1 Attrition for low-income band (<3000)
SELECT COUNT(*) AS total_low_income, SUM(attrition='Yes') AS exits,
    ROUND(SUM(attrition='Yes')*100.0/COUNT(*),2) AS exit_rate_pct
FROM employee_attrition WHERE monthlyincome < 3000;

**Output:**
| total_low_income | exits | exit_rate_pct |
|------------------|-------|---------------|
| 412              | 112   | 27.18         |

**Business Insight:**  
27.18% attrition in low-income segment (nearly double the overall rate) confirms income as a critical retention factor. This segment requires targeted compensation review.
    
-- 5.2 Overtime + department (matrix risk analysis)
SELECT department, overtime, COUNT(*) AS total, SUM(attrition='Yes') AS exits,
    ROUND(SUM(attrition='Yes')*100.0/COUNT(*),2) AS exit_rate_pct
FROM employee_attrition
GROUP BY department, overtime
ORDER BY exit_rate_pct DESC;

**Output:**
| department                  | overtime | total | exits | exit_rate_pct |
|-----------------------------|----------|-------|-------|---------------|
| Sales                       | Yes      | 128   | 48    | 37.50         |
| Human Resources             | Yes      | 17    | 5     | 29.41         |
| Research & Development      | Yes      | 271   | 74    | 27.31         |
| Human Resources             | No       | 46    | 7     | 15.22         |
| Sales                       | No       | 318   | 44    | 13.84         |
| Research & Development      | No       | 690   | 59    | 8.55          |

**Business Insight:**  
Overtime dramatically increases attrition across all departments:
- Sales with OT: 37.50% vs 13.84% without
- R&D with OT: 27.31% vs 8.55% without
- HR with OT: 29.41% vs 15.22% without

This indicates overtime is a stress indicator rather than engagement signal.
    

-- 5.3 Job Role + Overtime (matrix view)
SELECT jobrole, overtime, COUNT(*) AS total, SUM(attrition='Yes') AS exits,
    ROUND(SUM(attrition='Yes')*100.0/COUNT(*),2) AS exit_rate_pct
FROM employee_attrition
GROUP BY jobrole, overtime
ORDER BY exit_rate_pct DESC;

**Output:**
| jobrole                    | overtime | total | exits | exit_rate_pct |
|----------------------------|----------|-------|-------|---------------|
| Sales Representative       | Yes      | 40    | 23    | 57.50         |
| Laboratory Technician      | Yes      | 100   | 40    | 40.00         |
| Human Resources            | Yes      | 17    | 5     | 29.41         |
| Sales Executive            | Yes      | 71    | 20    | 28.17         |
| Research Scientist         | Yes      | 87    | 24    | 27.59         |

**Business Insight:**  
Sales Representatives working overtime face **extreme attrition risk (57.5%)**. This is the highest-risk employee segment in the entire organization and requires immediate intervention.
    
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

**Output:**
| promotion_band       | total | exits | exit_rate_pct |
|----------------------|-------|-------|---------------|
| 5+_years             | 134   | 35    | 26.12         |
| 3-5_years            | 240   | 47    | 19.58         |
| 0-2_years            | 619   | 103   | 16.64         |
| Promoted_this_year   | 477   | 52    | 10.90         |

**Business Insight:**  
Employees not promoted in 5+ years show **2.4x higher attrition** (26.12%) compared to those promoted recently (10.90%). Clear promotion paths and career progression are critical for retention.
    

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

**Output:**
| age_band | total | exits | exit_rate_pct |
|----------|-------|-------|---------------|
| Young    | 541   | 112   | 20.70         |
| Mid      | 816   | 122   | 14.95         |
| Senior   | 113   | 3     | 2.65          |

**Business Insight:**  
Young employees (<30) show highest attrition (20.70%), while senior employees (45+) are most stable (2.65%). Focus retention efforts on early-career support, mentorship, and growth opportunities.

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

**Output:**
| years_band | total | exits | exit_rate_pct |
|------------|-------|-------|---------------|
| 0-2        | 513   | 124   | 24.17         |
| 3-6        | 399   | 68    | 17.04         |
| 7-10       | 273   | 29    | 10.62         |
| 10+        | 285   | 16    | 5.61          |

**Business Insight:**  
First 2 years are **critical** (24.17% attrition). Attrition drops significantly with tenure, suggesting need for stronger onboarding, mentorship, and early engagement programs. Employees who stay beyond 10 years are highly loyal (5.61% attrition).

-- ============================== 6. MULTI-DIMENSIONAL ANALYSIS (MATRIX/PIVOT) ==============================

-- 6.1 Business Travel x Department
SELECT businesstravel, department, COUNT(*) AS total,
    SUM(attrition='Yes') AS exits,
    ROUND(SUM(attrition='Yes')*100.0/COUNT(*),2) AS exit_rate_pct
FROM employee_attrition
GROUP BY businesstravel, department
ORDER BY exit_rate_pct DESC;

**Output:**
| businesstravel    | department         | total | exits | exit_rate_pct |
|-------------------|--------------------|-------|-------|---------------|
| Travel_Frequently | Sales              | 127   | 38    | 29.92         |
| Travel_Rarely     | Sales              | 274   | 50    | 18.25         |
| Travel_Frequently | R&D                | 131   | 22    | 16.79         |
| Non-Travel        | Sales              | 45    | 4     | 8.89          |

**Business Insight:**  
Sales employees who travel frequently show highest attrition (29.92%). Travel fatigue combined with sales pressure creates high-risk combination requiring support systems.

-- 6.2 Department x Gender
SELECT department, gender, COUNT(*) AS total, SUM(attrition='Yes') AS exits,
    ROUND(SUM(attrition='Yes')*100.0/COUNT(*),2) AS exit_rate_pct
FROM employee_attrition
GROUP BY department, gender
ORDER BY department, gender;
**Output:**
| department                  | gender | total | exits | exit_rate_pct |
|-----------------------------|--------|-------|-------|---------------|
| Sales                       | Male   | 269   | 58    | 21.56         |
| Sales                       | Female | 177   | 34    | 19.21         |
| Human Resources             | Female | 36    | 8     | 22.22         |
| Human Resources             | Male   | 27    | 4     | 14.81         |
| Research & Development      | Male   | 586   | 88    | 15.02         |
| Research & Development      | Female | 375   | 45    | 12.00         |

**Business Insight:**  
Within Sales and R&D, male employees show slightly higher attrition. In HR, female employees show higher attrition (22.22% vs 14.81%), suggesting potential role-specific or work environment factors.

-- ============================== 7. EDA/VALIDATION & UNIQUE COUNTS ==============================

-- Unique values for categorical columns (for feature engineering checks)
SELECT COUNT(DISTINCT jobrole) AS n_jobroles, COUNT(DISTINCT department) AS n_departments,
       COUNT(DISTINCT businesstravel) AS n_travelmodes, COUNT(DISTINCT educationfield) AS n_educfields
FROM employee_attrition;
**Output:**
| n_jobroles | n_departments | n_travelmodes | n_educfields |
|------------|---------------|---------------|--------------|
| 9          | 3             | 3             | 6            |

-- Min/Max/Avg for numerics (for EDA/visualizations)
SELECT MIN(monthlyincome) AS min_income, MAX(monthlyincome) AS max_income, AVG(monthlyincome) AS avg_income,
    MIN(age) AS min_age, MAX(age) AS max_age, AVG(age) AS avg_age,
    MIN(yearsatcompany) AS min_tenure, MAX(yearsatcompany) AS max_tenure, AVG(yearsatcompany) AS avg_tenure
FROM employee_attrition;
| metric      | min_income | max_income | avg_income | min_age | max_age | avg_age | min_tenure | max_tenure | avg_tenure |
|-------------|------------|------------|------------|---------|---------|---------|------------|------------|------------|
| value       | 1009       | 19999      | 6503       | 18      | 60      | 37      | 0          | 40         | 7          |



-- High-tenure attrition (tenure > 10 years)
SELECT COUNT(*) AS total_high_tenure, SUM(attrition='Yes') AS exited_high_tenure,
    ROUND(SUM(attrition='Yes')*100.0/COUNT(*),2) AS exit_rate_pct
FROM employee_attrition
WHERE yearsatcompany > 10;

**Output:**
| total_high_tenure | exited_high_tenure | exit_rate_pct |
|-------------------|-------------------|---------------|
| 285               | 16                | 5.61          |

**Business Insight:**  
Long-tenured employees (10+ years) show very low attrition (5.61%), confirming tenure as a strong retention predictor. These employees are highly loyal and engaged.

-- ============================== 8. PERFORMANCE & SATISFACTION SEGMENTS ==============================

-- Performance rating by attrition
SELECT performancerating, attrition, COUNT(*) AS emp_count
FROM employee_attrition
GROUP BY performancerating, attrition
ORDER BY performancerating, attrition;
**Output:**
| performancerating | attrition | emp_count |
|-------------------|-----------|-----------|
| 3                 | No        | 1044      |
| 3                 | Yes       | 200       |
| 4                 | No        | 189       |
| 4                 | Yes       | 37        |

**Business Insight:**  
Even high performers (rating 4) are leaving (37 employees, representing 16.4% of high performers). 
-- Environmental and relationship satisfaction by attrition
SELECT attrition, AVG(environmentsatisfaction) AS avg_envsat
FROM employee_attrition GROUP BY attrition;
**Output:**
| attrition | avg_envsat |
|-----------|------------|
| Yes       | 2.46       |
| No        | 2.77       |

**Business Insight:**  
Employees who left report **significantly lower environmental satisfaction** (2.46 vs 2.77 on a 4-point scale). Workplace environment, culture, and organizational climate are key attrition drivers. This suggests issues with physical workspace, team dynamics, or organizational culture.

SELECT attrition, AVG(relationshipsatisfaction) AS avg_relsat
FROM employee_attrition GROUP BY attrition;
**Output:**
| attrition | avg_relsat |
|-----------|------------|
| Yes       | 2.60       |
| No        | 2.73       |

**Business Insight:**  
Employees who left have **lower relationship satisfaction** (2.60 vs 2.73). While the gap is smaller than environmental satisfaction, it still indicates weaker interpersonal connections, manager relationships, or team cohesion among departing employees.

SELECT attrition, AVG(worklifebalance) AS avg_worklifebalance
FROM employee_attrition GROUP BY attrition;
**Output:**
| attrition | avg_worklifebalance |
|-----------|---------------------|
| Yes       | 2.66                |
| No        | 2.78                |

**Business Insight:**  
Employees who left report **lower work-life balance** (2.66 vs 2.78). Combined with the 30.53% attrition rate among overtime workers, this confirms work-life balance as a significant retention factor. Organizations should review workload distribution and flexible work policies.
-- ============================== 9. DAILYRATE/MONTHLYRATE/TRAININGTIME EXPLORATORY ==============================

SELECT attrition, AVG(dailyrate) AS avg_dailyrate, MIN(dailyrate) AS min_dailyrate, MAX(dailyrate) AS max_dailyrate,
    AVG(monthlyrate) AS avg_monthlyrate, MIN(monthlyrate) AS min_monthlyrate, MAX(monthlyrate) AS max_monthlyrate,
    AVG(trainingtimeslastyear) AS avg_training, MIN(trainingtimeslastyear) AS min_training, MAX(trainingtimeslastyear) AS max_training
FROM employee_attrition
GROUP BY attrition;
**Output:**
| attrition | avg_dailyrate | min_dailyrate | max_dailyrate | avg_monthlyrate | min_monthlyrate | max_monthlyrate | avg_training | min_training | max_training |
|-----------|---------------|---------------|---------------|-----------------|-----------------|-----------------|--------------|--------------|--------------|
| Yes       | 750.36        | 103           | 1491          | 14559.31        | 2323            | 26999           | 2.62         | 0            | 6            |
| No        | 812.50        | 102           | 1499          | 14265.78        | 2094            | 26997           | 2.83         | 0            | 6            |

**Business Insight:**  
- **Daily Rate:** Employees who left have slightly lower average daily rates (₹750 vs ₹812), though both groups span similar ranges
- **Monthly Rate:** Interestingly, departing employees have slightly higher average monthly rates (₹14,559 vs ₹14,265), suggesting rate structure alone doesn't prevent attrition
- **Training:** Retained employees receive slightly more training (2.83 vs 2.62 times per year). This **7% training gap** suggests investment in employee development correlates with retention. Organizations should ensure equitable training distribution and career development opportunities

The data indicates that while compensation rates show mixed signals, **training and development investment** appears to be a meaningful retention lever.

---

## **KEY RECOMMENDATIONS SUMMARY**

Based on all SQL analytics outputs:

1. **Immediate Priority Segments:**
   - Sales Representatives working overtime (57.5% attrition)
   - Laboratory Technicians (23.94% attrition)
   - Employees in first 2 years of tenure (24.17% attrition)
   - Low-income employees <₹3000 (27.18% attrition)

2. **Compensation Strategy:**
   - Address 43% income gap between retained (₹6,832) and departing (₹4,787) employees
   - Review entry-level and Job Level 1 compensation competitiveness

3. **Career Development:**
   - Create clear promotion paths (employees not promoted in 5+ years show 26.12% attrition)
   - Increase training frequency and ensure equitable distribution
   - Focus on early-career mentorship and growth opportunities

4. **Work-Life Balance:**
   - Review overtime policies (30.53% attrition among OT workers vs 10.44% without)
   - Implement workload management systems, especially for Sales and R&D
   - Offer flexible work arrangements

5. **Engagement & Culture:**
   - Improve environmental satisfaction (2.46 vs 2.77 gap)
   - Strengthen manager-employee relationships
   - Enhance onboarding and early engagement programs for new hires

6. **Targeted Interventions:**
   - Support single employees and younger workforce (<30 years)
   - Monitor and support frequent travelers in Sales roles
   - Retain high performers through non-monetary recognition and growth paths

---
-- =========================================End of Project===========================================
