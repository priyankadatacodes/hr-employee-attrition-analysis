# **Employee Attrition Analysis & Prediction**

![Pandas](https://img.shields.io/badge/Library-Pandas-150458)
![SQL](https://img.shields.io/badge/SQL-MySQL-orange)
![EDA](https://img.shields.io/badge/EDA-Insights-informational)
![Machine Learning](https://img.shields.io/badge/ML-Basic%20Models-success)
![Power BI](https://img.shields.io/badge/BI-Power%20BI-yellow)

<img src="https://raw.githubusercontent.com/priyankadatacodes/hr-employee-attrition-analysis/main/dashboard/employee_attrition.png" width="100%">

---

## **Executive Summary**

Employee attrition directly impacts **organizational cost, productivity, and workforce stability**.  
This project delivers an **end-to-end Employee Attrition Analysis**, designed to support **data-driven HR and leadership decisions**.

The analysis follows a structured analytics workflow—starting with **data quality validation**, moving through **exploratory analysis and KPI verification**, and ending with an **interactive Power BI dashboard** for management reporting.

The objective is not just to report attrition numbers, but to **identify high-risk employee segments and recommend practical retention strategies**.

---

## **Why I Built This Project**

Employee turnover is a common challenge across organizations, especially in large enterprises where even small attrition rates can lead to **significant hiring and training costs**.

I built this project to:
- Understand **why employees leave**
- Identify **patterns behind attrition**
- Practice analyzing HR data from a **business and decision-making perspective**

This project reflects a real-world scenario where a data analyst supports **HR and leadership teams**, not just dashboards.

---

## **Business Context**

Organizations invest heavily in:
- Hiring and onboarding
- Employee training
- Performance management

High attrition leads to:
- Increased recruitment costs
- Productivity loss
- Knowledge gaps within teams

The business needs clarity on:
- Which employees are most likely to leave
- What factors drive attrition
- Where retention efforts should be focused

---

## **Problem Statement**

Analyze employee-level HR data to measure **attrition rate**, identify **key drivers of employee turnover**, and highlight **high-risk employee segments**, enabling proactive and data-driven retention strategies.

---

## **Hypotheses**

Before analysis, the following hypotheses were framed:

- **H1:** Attrition is higher among early-career and junior-level employees  
- **H2:** Lower compensation is associated with higher attrition  
- **H3:** Overtime and frequent business travel increase attrition risk  
- **H4:** Attrition decreases with higher job level and longer tenure  

These hypotheses guided the analysis instead of exploring the data randomly.

---

## **Dataset Overview**

- **Dataset:** IBM HR Analytics Employee Attrition Dataset  
- **Domain:** Human Resources Analytics  
- **Granularity:** Individual employee-level records  
- **Target Variable:** **Attrition (Yes / No)**  

---

## **Tools Used**

- **Python**
  - Data cleaning and validation  
  - Exploratory data analysis  
  - Basic predictive modeling  

- **SQL (MySQL)**
  - KPI validation  
  - Cross-verification of attrition metrics  

- **Power BI**
  - DAX measures  
  - Interactive executive dashboards  

- **Excel**
  - Preliminary data review  

---

## **Data Preparation**

Using Python, I:
- Performed schema and data type validation  
- Handled missing values based on data type  
- Checked and resolved duplicate records  
- Ensured data integrity before KPI calculation  

Cleaned and validated data was then prepared for SQL and Power BI analysis.

---

## **Analysis Approach**

The analysis followed a structured, end-to-end workflow:

1. **Data quality checks and cleaning** in Python  
2. **Exploratory Data Analysis (EDA)** to identify patterns  
3. **Logistic Regression modeling** for attrition drivers  
4. **SQL-based KPI validation** to ensure metric consistency  
5. **Power BI dashboard development** for leadership reporting  

---

## **Attrition Modeling (Logistic Regression)**

- Prepared features for binary classification  
- Trained a **Logistic Regression** model  
- Identified statistically significant attrition drivers  
- Interpreted results from a **business perspective**  

> *Note: Modeling was used for analytical insight, not production deployment.*

---

## **Core KPIs Tracked**

1. **Total Employees**  
2. **Active Employees**  
3. **Attrited Employees**  
4. **Attrition Rate (%)**  
5. **Average Monthly Income**  
6. **Average Employee Tenure (Years)**  

---

## **Dashboard Overview**

<img src="https://raw.githubusercontent.com/priyankadatacodes/hr-employee-attrition-analysis/main/dashboard/employee_attrition_dashboard_image.png" width="100%">

The dashboard provides:
- Attrition overview
- Department and role-level analysis
- Compensation and tenure insights
- Work condition impact (overtime, travel)

---

## **Key Insights**

- **Total Employees:** **1,470**  
- **Attrited Employees:** **237**  
- **Overall Attrition Rate:** **16.12%**  
- Higher attrition among **entry-level and junior employees**  
- **Lower income bands** show disproportionately higher attrition  
- Employees **below 35 years** have higher turnover risk  
- **Sales** and **R&D** departments contribute the highest attrition  
- Frequent **business travel** is linked with higher attrition  
- **Overtime + long commute** increases attrition likelihood  
- Attrition decreases with **higher job level, income, and tenure**

---

## **Business Impact**

- Enables early identification of **high-risk employee segments**  
- Supports **data-driven retention planning**  
- Helps reduce hiring and training costs  
- Improves workforce stability and continuity  

---

## **Recommendations**

### **Short-Term**
- Strengthen onboarding and mentorship for early-career employees  
- Review compensation for low-income, high-attrition roles  
- Monitor overtime and workload distribution  

### **Long-Term**
- Optimize business travel policies  
- Launch targeted engagement programs for Sales and R&D teams  
- Track employee satisfaction as an early attrition signal  
- Maintain regular attrition monitoring dashboards  

---

## **Final Takeaway**

Employee attrition is driven by a combination of **career stage, compensation, workload, and work conditions**.  
By identifying high-risk segments early, organizations can take **proactive retention actions** instead of reacting after employees leave.

This project demonstrates how **data analytics can directly support HR strategy and leadership decisions**.

---

## **Author**

**Priyanka Lakra**  
**Data Analyst | Python | SQL | Power BI**  

---

## **About Me**

I am an aspiring **Data Analyst** with hands-on experience in **Python, SQL, and Power BI**, focused on building **business-driven, end-to-end analytics projects**.

My approach emphasizes:
- **Data quality and validation**
- **KPI governance**
- **Clear business communication**

Through this project, I have demonstrated the ability to:
- Follow an **industry-standard analytics workflow**
- Perform **EDA and KPI validation**
- Use **SQL for metric cross-verification**
- Translate analysis into **actionable business insights**
- Design dashboards that support **management decision-making**
