# **Employee Attrition Analysis & Prediction**
![Pandas](https://img.shields.io/badge/Library-Pandas-150458)-![SQL](https://img.shields.io/badge/SQL-MySQL-orange)-![EDA](https://img.shields.io/badge/EDA-Insights-informational)-![Machine Learning](https://img.shields.io/badge/ML-Basic%20Models-success)-![Power BI](https://img.shields.io/badge/BI-Power%20BI-yellow)

---

## **1. Executive Summary**
Employee attrition directly impacts organizational cost, productivity, and workforce continuity.  
This project delivers a **comprehensive, end-to-end Employees Attrition Analysis**, designed to support **data-driven Employees decision-making**.

The analysis follows an **industry-standard analytics workflow**, beginning with data quality validation, progressing through exploratory and statistical analysis, incorporating SQL-based KPI verification, and culminating in an interactive Power BI dashboard for leadership reporting.

The objective is not only to report attrition metrics, but to **identify high-risk employee segments and recommend actionable retention strategies**.

---

## **2. Business Objectives**
1. Establish reliable and validated attrition KPIs  
2. Identify attrition patterns across demographics, roles, and departments  
3. Evaluate compensation, experience, and workload drivers of attrition  
4. Enable leadership to proactively manage employee retention risks  
5. Provide a scalable analytics framework for ongoing HR monitoring  

---

## **3. Business Questions Addressed**
1. What is the current employee attrition rate and trend?  
2. Which departments and job roles contribute most to attrition?  
3. How does attrition vary by age, tenure, and job level?  
4. What is the relationship between compensation and employee turnover?  
5. How do work conditions (overtime, travel, commute distance) impact attrition?  
6. Which employee segments present the highest retention risk?  

---

## **4. Dataset Overview**
- Dataset: IBM HR Analytics Employee Attrition Dataset  
- Domain: Human Resources Analytics  
- Granularity: Individual employee-level records  
- Target Variable: Attrition (Yes / No)  

---

## **5. Tools and Technologies**
- Python: Data cleaning, validation, EDA, statistical analysis, modeling  
- SQL (MySQL): Data storage, KPI validation, business analysis queries  
- Power BI: Semantic modeling, DAX measures, executive dashboard  
- Excel: Preliminary data review and validation  

---

## **6. Analytical Methodology**

### **6.1 Data Quality and Preparation (Python)**
1. Raw data ingestion and schema validation  
2. Automated missing value treatment based on data type  
3. Data type standardization and integrity checks  
4. Duplicate detection and resolution  
5. Export of clean, analysis-ready dataset  

Data quality checks were performed prior to any KPI calculation to ensure analytical accuracy.

---

### **6.2 Exploratory Data Analysis**
1. Distribution analysis of numerical attributes (age, income, tenure)  
2. Categorical analysis across departments, roles, and demographics  
3. Attrition pattern identification through comparative analysis  
4. Insight generation to guide KPI selection and dashboard design  

---

### **6.3 Attrition Modeling (Logistic Regression)**
1. Feature preparation for binary classification  
2. Logistic regression model training to identify attrition drivers  
3. Model evaluation and interpretation  
4. Business-level interpretation of significant predictors  

Note: Modeling was used for **analytical insight**, not operational deployment.

---

### **6.4 SQL-Based KPI Validation**
1. Database and table creation  
2. Loading of validated, cleaned dataset  
3. Independent KPI computation using SQL  
4. Cross-validation of metrics against Python and Power BI outputs  

This step ensures **metric consistency and governance**, a key requirement in enterprise analytics.

---

### **6.5 Power BI Dashboard Development**
1. Employee-level data modeling  
2. Creation of KPI-safe DAX measures using DISTINCTCOUNT logic  
3. Interactive dashboard design for leadership consumption  
4. Segmentation by demographics, compensation, and work conditions  

---

## **7. Core KPIs**
1. Total Employees  
2. Active Employees  
3. Attrited Employees  
4. Attrition Rate (%)  
5. Average Monthly Income  
6. Average Employee Tenure (Years)  

---

## **8. Dashboard Overview**

<img src="https://raw.githubusercontent.com/priyankadatacodes/hr-employee-attrition-analysis/main/dashboard/employee_attrition_dashboard_image.png" width="100%">

---

## **9. Key Insights**
1. Total Employees analyzed: 1,470  
2. Attrited Employees: 237  
3. Overall Attrition Rate: 16.12%  
4. Highest attrition observed among entry-level and junior employees  
5. Lower income bands show disproportionately higher attrition  
6. Employees aged below 35 exhibit higher turnover risk  
7. Sales and Research & Development departments contribute the highest attrition volume  
8. Frequent business travel is correlated with increased attrition  
9. Overtime combined with longer commute distance increases attrition likelihood  
10. Attrition risk decreases with higher job level, income, and tenure  

---

## **10. Business Recommendations**
1. Implement structured onboarding and mentorship programs for early-career employees  
2. Review compensation structures for low-income, high-attrition roles  
3. Introduce workload and overtime governance mechanisms  
4. Optimize business travel policies to reduce employee fatigue  
5. Conduct targeted engagement initiatives for Sales and R&D teams  
6. Track employee satisfaction metrics as early attrition indicators  
7. Establish periodic attrition monitoring dashboards for leadership review  

---

## **11. Skills Demonstrated**
1. Enterprise-level data cleaning and validation  
2. Exploratory and statistical data analysis  
3. SQL-based KPI governance and cross-validation  
4. Predictive modeling for business insight  
5. Power BI dashboarding and data storytelling  
6. HR analytics and retention strategy formulation  

---

## **12. Business Impact**
1. Enables proactive identification of high-risk employee segments  
2. Supports data-driven retention planning  
3. Improves workforce stability and cost efficiency  
4. Provides a scalable HR analytics framework

---

## **14. Conclusion**

This project reflects an **data analyst approach**, combining data governance, analytical rigor, and business storytelling.  
It demonstrates the ability to transform raw HR data into **validated KPIs, actionable insights, and strategic recommendations**, suitable for enterprise decision-making.

The project follows a complete **end-to-end analytics lifecycle** using Python, SQL, and Power BI.

---

## **15. About Me**

I am an aspiring **PRIYANKA_LAKRA Data Analyst** with hands-on experience in **Python, SQL, and Power BI**, focused on building **business-driven, end-to-end analytics projects**.
My approach emphasizes **data quality, KPI validation, and clear business communication**, ensuring that insights are both accurate and actionable.

Through this project, I have demonstrated my ability to:
1. Follow an **industry-standard data analyst workflow**
2. Perform **data cleaning, exploratory analysis, and KPI governance**
3. Use **SQL for metric validation and cross-verification**
4. Translate analytical findings into **business-focused recommendations**
5. Design dashboards that support **management decision-making**
