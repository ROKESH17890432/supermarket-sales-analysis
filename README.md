# 🛒 Supermarket Sales Data Analysis & Dashboard

## 📌 Project Overview
Analysed a supermarket sales dataset with 1,000 records 
from 3 branches to identify top-performing product 
categories, monthly revenue trends and customer purchase 
patterns.

## 🛠️ Tools Used
- Python (Pandas) — Data cleaning & analysis
- MySQL — SQL queries & business insights
- Excel — Interactive dashboard & visualization

## 📊 Dataset
- Source: Supermarket Sales Dataset (CSV)
- Records: 1,000 rows | 19 columns
- Branches: Yangon, Naypyitaw, Mandalay

## 🔍 Key Steps
### 1. Data Cleaning (Pandas)
- Checked missing values and duplicates
- Fixed date column format using pd.to_datetime()
- Added Month and Day columns for trend analysis
- Standardised column names for SQL compatibility

### 2. SQL Analysis (MySQL)
- GROUP BY — Revenue by product line
- CTE — Top branch by revenue
- Window Functions — Product line rankings
- Customer purchase pattern analysis

### 3. Excel Dashboard
- Pivot Table 1 — Revenue by Product Line (Bar Chart)
- Pivot Table 2 — Monthly Revenue Trend (Line Chart)
- Pivot Table 3 — Payment Method Split (Pie Chart)

## 📈 Key Insights
- Food & Beverages was the top revenue category
- January had the highest monthly sales
- Branch A (Yangon) was the best performing branch
- Female Members had the highest average spend
- Ewallet was the most popular payment method

## 📁 Files
| File | Description |
|------|-------------|
| sales_analysis.ipynb | Python Pandas cleaning & analysis |
| sales_project.sql | MySQL queries |
| supermarket_dashboard.xlsx | Excel dashboard |
