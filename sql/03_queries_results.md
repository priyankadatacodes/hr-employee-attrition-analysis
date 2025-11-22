HR EMPLOYEE ATTRITION: FULL SQL ANALYTICS PROJECT
1. Executive Summary
1.1 Total Employee Headcount
Query:

sql
SELECT COUNT(*) AS total_employees FROM employee_attrition;
Output:
Total employees: 1470​

1.2 Attrition & Retention Counts/Rates
Query:

sql
SELECT 
    SUM(attrition='Yes') AS exited_employees,
    SUM(attrition='No')  AS retained_employees,
    ROUND(SUM(attrition='Yes')*100.0/COUNT(*),2) AS attrition_rate_pct,
    ROUND(SUM(attrition='No')*100.0/COUNT(*),2)  AS retention_rate_pct
FROM employee_attrition;
Output:

Exited employees: 237

Retained employees: 1233

Attrition rate: 16.13%

Retention rate: 83.88%​

Insight:
~1 in 6 employees exited; retention remains strong, but attrition signals HR risks.

Recommendation:
Implement targeted HR intervention for high-risk segments before impacts worsen.

2. Segment Profile Distributions
2.1 By Business Travel
Query:

sql
SELECT businesstravel, COUNT(*) AS total FROM employee_attrition GROUP BY businesstravel;
Output:

Travel_Rarely: 1043

Travel_Frequently: 277

Non-Travel: 150​

Insight:
Majority assigned rare travel.

Recommendation:
Review travel policy for “Travel_Frequently” risk group.

2.2 By Department
Query:

sql
SELECT department, COUNT(*) AS total FROM employee_attrition GROUP BY department;
Output:

Sales: 446

Research Development: 961

Human Resources: 63​

2.3 By Education Field
Query:

sql
SELECT educationfield, COUNT(*) AS total FROM employee_attrition GROUP BY educationfield;
Output:

Life Sciences: 606

Medical: 464

Marketing: 159

Technical Degree: 132

Human Resources: 27

Other: 82​

2.4 By Gender, Job Role, Marital Status, Overtime
Query (Gender):

sql
SELECT gender, COUNT(*) AS total FROM employee_attrition GROUP BY gender;
Female: 588

Male: 882​

Query (Job Role):
Largest roles

Sales Executive: 326

Research Scientist: 292

Laboratory Technician: 259​

Query (Marital Status):

Single: 470

Married: 673

Divorced: 327​

Query (Overtime):
Check segment detail if table exists.

3. Attrition KPIs by Business Segment
3.1 Attrition Rate by Department
Query/Output:

Department	Total	Exits	Exit Rate (%)
Sales	446	92	20.63
Human Resources	63	12	19.05
Research Development	961	133	13.84
Insight:
Sales & HR face highest attrition risks.

Recommendation:
Run retention programs in Sales and HR with focused surveys.

3.2 Top 5 High-Risk Job Roles
Query/Output:

Job Role	Total	Exits	Exit Rate (%)
Sales Representative	83	33	39.76
Laboratory Technician	259	62	23.94
Human Resources	52	12	23.08
Sales Executive	326	57	17.48
Research Scientist	292	47	16.10
Insight:
Sales roles most prone to attrition.

Recommendation:
Target onboarding/training improvement for sales representatives.

3.3 Attrition by Marital Status
Marital Status	Total	Exits	Exit Rate (%)
Single	470	120	25.53
Married	673	84	12.48
Divorced	327	33	10.09
Insight:
Single employees exit most frequently.

Recommendation:
Develop wellness support and social engagement for singles.

3.4 Attrition by Overtime & Gender
Gender	Total	Exits	Exit Rate (%)
Female	588	87	14.80
Male	882	150	17.01
4. KPI Means: Age, Income, Tenure, Satisfaction
Query:
Avg by Attrition

Attrition	Age	Monthly Income	Tenure	Job Sat	Env Sat	Relationship Sat	Work-life Balance
Yes	33.60	4787.09	2.85	2.47	2.46	2.60	2.66
No	37.56	6832.73	4.77	2.78	2.77	2.73	2.78
Insight:
Employees who exit are younger, lower income, less tenured, with lower satisfaction.

Recommendation:
Target early-career, lower-compensated groups with mentoring and pay benchmarking.

5. Risk Bands & Segments
5.1 Low Income Band (<3000)
To be filled if table found.

5.4 Promotion Bands
Promotion Band	Total	Exits	Exit Rate (%)
Promoted this year	58	11	18.93
5+ years	215	35	16.28
0-2 years	516	76	14.73
3-5 years	158	16	10.13
Insight:
Non-promoted employees (especially 5+ years) high risk.

Recommendation:
Cross-check promotion cycle and engage long-tenure employees for career talks.

5.5 Age Bands
Age Band	Total	Exits	Exit Rate (%)
Young	326	91	27.91
Mid	871	112	12.86
Senior	273	34	12.45
Insight:
Young employees (<30) have the highest attrition rates.

Recommendation:
Implement targeted onboarding and first-year retention programs.

6. Multi-dimensional Analysis (Matrix/Pivot)
6.2 Department x Gender
Department	Gender	Total	Exits	Exit Rate (%)
Human Resources	Female	20	6	30.00
Human Resources	Male	43	6	13.95
Research Development	Female	379	43	11.35
Research Development	Male	582	90	15.46
Sales	Female	189	38	20.11
Sales	Male	257	54	21.01
Insight:
Female HR faces highest attrition rate.
Male sales highest count.

Recommendation:
Engage HR female staff; examine sales roles for men with stress/burnout interventions.

7. EDA/Validation & Unique Counts
Unique Categorical Values
Job Roles: 9

Departments: 3

Travel Modes: 3

Education Fields: 6​

Min/Max/Avg for Numeric Columns
Metric	Min	Max	Avg
Income	1009	19999	6502.93
Age	18	60	36.92
Tenure	0	40	7.00
8. Performance & Satisfaction Segments
Satisfaction by Attrition
Attrition	Job Sat	Env Sat	Relationship Sat	Work-life Balance
Yes	2.47	2.46	2.60	2.66
No	2.78	2.77	2.73	2.78
Insight:
Lower satisfaction correlates with attrition.

Recommendation:
Develop satisfaction assessment and pulse surveys.
