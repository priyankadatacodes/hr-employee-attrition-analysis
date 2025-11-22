# Employee Attrition Analysis & Prediction

## Project Overview
This end-to-end data analytics project analyzes HR employee attrition to identify drivers and forecast risk, supporting actionable HR interventions. It integrates SQL analytics, Python EDA, predictive modeling, and Power BI dashboards for a complete solution.

## Objective
- Identify key attrition drivers
- Segment employees by risk/demographics
- Predict employee attrition
- Deliver actionable business insights for HR


## Dataset
- Source: [Kaggle HR Analytics Dataset](https://www.kaggle.com/datasets/pavansubhasht/ibm-hr-analytics-attrition-dataset)
- Records: 1470
- Features: Age, Department, JobRole, MonthlyIncome, JobSatisfaction, YearsAtCompany, Attrition

## Tools & Technologies
- **Database:** MySQL
- **Python:** pandas, numpy, seaborn, matplotlib, sklearn, SQLAlchemy, pymysql, joblib
- **Dashboard:** Power BI
- **Version Control:** Git / GitHub

## Key Analysis Steps
1. **Data Loading & Cleaning**  
   - Clean missing values, drop irrelevant columns
2. **EDA**  
   - Histograms, countplots, boxplots, heatmaps, stacked barplots
3. **SQL Analytics**  
   - Aggregate metrics, attrition by segment, multi-dimensional analysis, business insights
4. **Feature Engineering & Modeling**  
   - Encode variables, train-test split, scale features, logistic regression prediction
5. **Insights & Recommendations**  
   - Attrition rate: 16.12%
   - Highest risk: young, lower tenure/income, R&D, tech roles, males/singles
   - Key predictors: tenure, total experience, stock options, manager/role years
   - Strategic HR actions for retention

## Power BI Integration
- Interactive dashboards: attrition, department/job heatmaps, salary breakdowns, KPI panels  
- Python-exported CSVs imported for dynamic visuals

## Predictive Model
- Logistic Regression (accuracy ~85-87%)
- Model and scaler saved for direct deployment with Python/Power BI.

## Business Insights Summary
- 16% attrition, concentrated among junior, low-income, R&D, technician roles
- Lowest scores on environment satisfaction among leavers
- Most at-risk: employees with fewer promotions, low stock options, short tenure
- Recommend targeted growth programs, engagement initiatives, and support for new/junior staff

## How to Run
1. Clone repo
2. `pip install -r requirements.txt`
3. Run Python notebooks for analysis/modeling
4. Use SQL scripts for analytics
5. Open dashboard in Power BI

## Outcome
- Comprehensive HR attrition reporting
- Deployed predictive model
- Ready-to-present visuals and recommendations
- Fully reproducible analytics workflow

---

