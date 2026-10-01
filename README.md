# Employee Attrition Analysis & Prediction

![Python](https://img.shields.io/badge/Python-Pandas-150458?logo=python)
![SQL](https://img.shields.io/badge/SQL-MySQL-orange?logo=mysql)
![EDA](https://img.shields.io/badge/EDA-Insights-informational)
![Machine Learning](https://img.shields.io/badge/ML-Logistic%20Regression-success)
![Power BI](https://img.shields.io/badge/Power%20BI-Dashboard-F2C811?logo=powerbi\&logoColor=black)

## Executive Summary

End-to-end **HR analytics project** focused on employee attrition, workforce patterns, attrition drivers, and high-risk employee segments.

The project combines **Python, MySQL, Exploratory Data Analysis, Logistic Regression, and Power BI** to move from data validation and analysis to predictive insight and management reporting.

### Business Question

> **Why are employees leaving, which employee segments face higher attrition risk, and where should retention efforts be focused?**

---

## 1. Business Problem

Employee attrition affects workforce stability, productivity, recruitment costs, and organizational knowledge.

The objective of this project is to analyze employee-level HR data to:

* Measure employee attrition
* Identify key attrition drivers
* Analyze attrition across departments, roles, income, tenure, and work conditions
* Identify high-risk employee segments
* Validate KPIs using SQL
* Build an interactive Power BI dashboard
* Support data-driven retention planning

---

## 2. Dataset

**Dataset:** IBM HR Analytics Employee Attrition Dataset
**Domain:** Human Resources Analytics
**Granularity:** Individual employee-level records
**Target Variable:** `Attrition` — Yes / No

The analysis uses employee-level attributes to investigate relationships between attrition and factors such as compensation, job level, tenure, overtime, travel, age, and department.

---

## 3. Analytical Hypotheses

The analysis was structured around four initial hypotheses:

* **H1:** Attrition is higher among early-career and junior-level employees
* **H2:** Lower compensation is associated with higher attrition
* **H3:** Overtime and frequent business travel increase attrition risk
* **H4:** Attrition decreases with higher job level and longer tenure

These hypotheses guided the exploratory and statistical analysis.

---

## 4. Tech Stack

| Tool                    | Purpose                                        |
| ----------------------- | ---------------------------------------------- |
| **Python / Pandas**     | Data cleaning, validation, EDA, modeling       |
| **MySQL / SQL**         | KPI validation and metric cross-verification   |
| **Logistic Regression** | Attrition-driver analysis                      |
| **Power BI**            | Interactive dashboard and management reporting |
| **Excel**               | Preliminary data review                        |

---

## 5. Analytics Workflow

```text
Raw HR Data
     ↓
Data Validation & Cleaning
     ↓
Exploratory Data Analysis
     ↓
KPI Calculation
     ↓
Logistic Regression
     ↓
SQL KPI Validation
     ↓
Power BI Dashboard
     ↓
Business Insights & Retention Actions
```

The project follows an end-to-end workflow covering data preparation, exploratory analysis, predictive modeling, SQL validation, and dashboard reporting.

---

## 6. Data Preparation

Python was used for:

* Schema and data-type validation
* Missing-value checks
* Duplicate checks
* Data-integrity validation
* Data preparation for SQL and Power BI

The cleaned dataset was then used for downstream analysis and reporting.

---

## 7. Exploratory Data Analysis

EDA was used to analyze attrition patterns across:

* Age
* Income
* Job level
* Job role
* Department
* Tenure
* Overtime
* Business travel
* Work conditions

The analysis focused on identifying employee segments associated with higher observed attrition.

---

## 8. Attrition Modeling

### Logistic Regression

A **Logistic Regression** model was developed for binary attrition analysis.

The modeling workflow included:

* Preparing features for binary classification
* Training the Logistic Regression model
* Identifying statistically significant attrition drivers
* Interpreting model results from a business perspective

The model was used for **analytical insight rather than production deployment**.

---

## 9. SQL Analysis & KPI Validation

MySQL was used to independently validate key attrition metrics and cross-check analytical results.

### Core KPIs

1. Total Employees
2. Active Employees
3. Attrited Employees
4. Attrition Rate
5. Average Monthly Income
6. Average Employee Tenure

This SQL layer provides an additional validation step between the analytical dataset and dashboard reporting.

---

## 10. Power BI Dashboard

The final reporting layer is an interactive **Power BI employee attrition dashboard**.

### Dashboard Coverage

* Overall attrition overview
* Department-level analysis
* Role-level analysis
* Compensation analysis
* Tenure analysis
* Overtime impact
* Business travel analysis

The dashboard is designed for management-level monitoring of employee attrition patterns and workforce risk.

### Dashboard Preview

![Employee Attrition Dashboard](https://raw.githubusercontent.com/priyankadatacodes/hr-employee-attrition-analysis/main/dashboard/employee_attrition_dashboard.png)

---

## 11. Key Findings

### Workforce Overview

| Metric                 |     Result |
| ---------------------- | ---------: |
| Total Employees        |  **1,470** |
| Attrited Employees     |    **237** |
| Overall Attrition Rate | **16.12%** |

### Attrition Patterns

* Higher attrition among **entry-level and junior employees**
* **Lower income bands** show disproportionately higher attrition
* Employees **below 35 years** show higher observed turnover
* **Sales** and **R&D** contribute the highest attrition
* Frequent **business travel** is associated with higher attrition
* **Overtime combined with long commute** is associated with higher attrition
* Attrition decreases with higher **job level, income, and tenure**

---

## 12. Business Impact

The analysis provides HR and leadership teams with:

* Identification of high-risk employee segments
* Data-driven retention planning
* Better understanding of attrition drivers
* Support for workforce stability initiatives
* A repeatable framework for monitoring employee attrition

---

## 13. Retention Recommendations

### Short-Term

* Strengthen onboarding and mentorship for early-career employees
* Review compensation for low-income, high-attrition roles
* Monitor overtime and workload distribution

### Long-Term

* Optimize business travel policies
* Develop targeted engagement programs for Sales and R&D
* Track employee satisfaction as an early attrition signal
* Maintain regular attrition monitoring dashboards

---

## 14. Project Structure

```text
hr-employee-attrition-analysis/
│
├── dashboard/
│   └── employee_attrition.png
│
├── data/
│
├── notebook/
│   ├── 01_*.ipynb
│   ├── 02_*.ipynb
│   └── 03_modeling_logistic_regression.ipynb
│
├── outputs/
│
├── sql/
│
├── requirements.txt
├── .gitignore
└── README.md
```

The repository contains dedicated folders for the dashboard, data, notebooks, outputs, and SQL analysis.

---

## 15. Skills Demonstrated

### Data Analytics

* Exploratory Data Analysis
* HR Analytics
* Attrition Analysis
* KPI Development
* Business Insight Generation

### Python

* Pandas
* Data Cleaning
* Data Validation
* Exploratory Analysis
* Logistic Regression

### SQL

* MySQL
* KPI Validation
* Metric Cross-Verification
* Analytical Queries

### Business Intelligence

* Power BI
* DAX
* Interactive Dashboards
* Management Reporting

### Business Analysis

* Hypothesis-driven analysis
* Attrition-driver analysis
* Employee risk segmentation
* Retention recommendations

---

## 16. Limitations

* The analysis is based on the **IBM HR Analytics Employee Attrition Dataset**.
* Logistic Regression is used for analytical insight rather than production deployment.
* Observed relationships should be interpreted as associations within the dataset rather than proof of causation.
* Retention recommendations are based on the patterns identified in the available employee-level data.

---

## 17. Future Improvements

Potential extensions include:

* Advanced machine-learning models
* Model performance comparison
* Employee-level risk scoring
* Explainable ML using feature importance / SHAP
* Automated HR analytics pipelines
* More detailed employee engagement analysis
* Automated Power BI reporting

---

## 18. Author

**Priyanka Lakra**
Data Analyst | Python · SQL · Power BI

**Portfolio:** [bloomindata.in](https://www.bloomindata.in/)

**GitHub:** [priyankadatacodes](https://github.com/priyankadatacodes)

---

## License

This project is available under the repository's existing license.
