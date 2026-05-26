# 💳 Credit Card Customer Segmentation & Revenue Insights

### Transforming Raw Transaction Data into Actionable Banking Intelligence

![Dashboard](Dashboard.png)

---

# 📌 Project Overview

This project focuses on analyzing credit card transaction behavior to uncover customer spending patterns, revenue concentration, and behavioral segmentation insights using SQL Server and Tableau.

Banks generate massive amounts of transaction-level data every day. However, most traditional banking strategies still rely primarily on total spending volume instead of understanding how customers actually behave.

This project demonstrates how transaction-level analytics can be transformed into actionable business intelligence for:

- Customer segmentation
- Revenue optimization
- Geographic targeting
- Spending behavior analysis
- Business strategy development
- Data-driven decision-making

The project uses SQL-based analytical pipelines combined with Tableau dashboard visualization to identify high-value customer groups, dominant spending categories, geographic revenue concentration, and behavioral patterns across different customer segments.

---

# 🎯 Business Problem

Traditional banking segmentation often treats customers with similar spending totals as identical customers.

However, two customers spending the same amount may behave completely differently.

For example:

- One customer may spend heavily on travel and entertainment.
- Another may spend primarily on bills, groceries, and fuel.

Although their total spending is similar, their needs, preferences, and likely responses to marketing strategies are completely different.

Without behavioral segmentation:

- Marketing becomes inefficient
- Reward programs become misaligned
- High-value behavioral segments remain unidentified
- Revenue opportunities are lost

This project addresses that challenge by applying behavior-based segmentation using transaction-level credit card data.

---

# 🛠️ Tools & Technologies

## Technologies Used

- SQL Server
- Tableau
- CSV / Excel Data Sources
- Business Analytics
- Data Visualization
- Customer Segmentation
- Data Aggregation
- Behavioral Analytics

---

# 📂 Dataset Information

## Dataset Source

Kaggle Credit Card Transaction Dataset

## Dataset Size

| Metric | Value |
|---|---|
| Total Transactions | 26,052 |
| Total Cities | 986 |
| Total Revenue | ₹4.07 Billion |
| Avg Spend Per Transaction | ₹156,412 |
| Time Period | Oct 2022 – Jan 2024 |

---

# 📊 Key Business Questions

This project was designed to answer the following business and analytical questions:

- Is portfolio revenue concentrated across specific geographic locations?
- Which customer value segments contribute the most revenue?
- What spending categories dominate customer transaction behavior?
- Does customer spending remain stable over time?
- How does spending behavior vary across different card types?
- Do premium cardholders truly generate the highest overall revenue?
- How should banks optimize targeting and segmentation strategies using behavioral data?
---

# 🧹 Data Preparation & Cleaning

Before analysis, the dataset was validated and cleaned using SQL Server.

## Cleaning Steps

- Removed null values
- Validated transaction-level integrity
- Verified schema structure
- Converted dates into monthly periods
- Created segmentation logic
- Prepared KPI calculations
- Aggregated category and geographic metrics

## SQL Cleaning Example

```sql
SELECT *
FROM dbo.credit_card_transactions
WHERE city IS NOT NULL
AND transaction_date IS NOT NULL
AND card_type IS NOT NULL
AND exp_type IS NOT NULL
AND amount IS NOT NULL;
```

---

# 📈 Key Performance Indicators (KPIs)

The following KPIs were developed to evaluate overall portfolio performance.

| KPI | Value |
|---|---|
| Total Revenue | ₹4.07B |
| Total Transactions | 26,052 |
| Avg Spend per Transaction | ₹156K |
| Cities Covered | 986 |

---

# 🏗️ Analytical Methodology

The project follows a structured six-stage analytics pipeline.

## Stage 1 — Data Cleaning
Validated and cleaned raw transaction records.

## Stage 2 — SQL Aggregation
Generated revenue metrics by city, category, and time.

## Stage 3 — KPI Development
Created portfolio-level performance indicators.

## Stage 4 — Behavioral Analysis
Analyzed customer spending behavior across multiple dimensions.

## Stage 5 — Customer Segmentation
Classified customers into value-based groups.

## Stage 6 — Dashboard Visualization
Integrated insights into a Tableau dashboard for decision-making.

---

# 🧠 SQL Analysis Performed

## 1️⃣ Portfolio KPI Calculation

```sql
SELECT
SUM(amount) AS total_revenue,
COUNT(*) AS total_transactions,
AVG(CAST(amount AS DECIMAL(18,2))) AS avg_spend_per_transaction,
COUNT(DISTINCT city) AS total_cities
FROM dbo.credit_card_transactions;
```

---

## 2️⃣ Revenue by City

```sql
SELECT city,
SUM(amount) AS total_revenue
FROM dbo.credit_card_transactions
GROUP BY city
ORDER BY total_revenue DESC;
```

### Key Finding

Revenue is heavily concentrated in a few metropolitan cities.

Top revenue-generating cities:

- Greater Mumbai
- Bengaluru
- Ahmedabad
- Delhi

---

## 3️⃣ Monthly Spending Trend

```sql
SELECT FORMAT(transaction_date,'yyyy-MM') AS month,
SUM(amount) AS total_revenue
FROM dbo.credit_card_transactions
GROUP BY FORMAT(transaction_date,'yyyy-MM')
ORDER BY month;
```

### Key Finding

Monthly revenue remains highly stable over time, supporting predictable forecasting and financial planning.

---

## 4️⃣ Category Contribution Analysis

```sql
SELECT exp_type,
SUM(amount) AS total_revenue,
(SUM(amount)*100.0 / SUM(SUM(amount)) OVER())
AS contribution_pct
FROM dbo.credit_card_transactions
GROUP BY exp_type
ORDER BY total_revenue DESC;
```

### Key Finding

Essential categories dominate spending behavior.

| Category | Contribution |
|---|---|
| Bills | 22.26% |
| Food | 20.24% |
| Fuel | 19.37% |
| Entertainment | 17.83% |
| Grocery | 17.63% |
| Travel | 2.68% |

---

## 5️⃣ Card Type Behavior

```sql
SELECT
FORMAT(transaction_date,'yyyy-MM') AS month,
card_type,
SUM(amount) AS total_spend
FROM dbo.credit_card_transactions
GROUP BY FORMAT(transaction_date,'yyyy-MM'), card_type
ORDER BY month, card_type;
```

### Key Finding

Premium cardholders spend more individually, but Gold and Silver card users collectively generate higher aggregate revenue.

---

## 6️⃣ Customer Segmentation

```sql
CASE
WHEN amount >= 100000 THEN 'High Value'
WHEN amount BETWEEN 50000 AND 99999 THEN 'Medium Value'
ELSE 'Low Value'
END
```

### Segmentation Results

| Segment | Customer % | Revenue % |
|---|---|---|
| High Value | 20% | 37.5% |
| Medium Value | 30.1% | 38.0% |
| Low Value | 49.9% | 24.5% |

---

# 📌 Dashboard Overview

## Tableau Dashboard

The dashboard integrates:

- Revenue analysis
- Geographic concentration
- Customer segmentation
- Category contribution
- Monthly trends
- Card-type analysis
- Geo-tier insights

### Dashboard Features

✅ KPI Overview  
✅ Revenue by City  
✅ Monthly Spending Trend  
✅ Customer Segmentation  
✅ Category Analysis  
✅ Card-Type Behavior  
✅ Geo-Tier Analysis  

---

# 🔍 Key Insights

## 📍 Geographic Revenue Concentration

Revenue is highly concentrated across a few major metro cities.

This suggests that banks should prioritize these locations for:

- Marketing campaigns
- Customer acquisition
- Retention strategies
- Product investment

---

## 👥 Medium-Value Customers Are Critical

One of the most important findings:

Medium-value customers contribute slightly more total revenue than high-value customers.

This challenges the assumption that only premium customers matter.

---

## 🛒 Essential Categories Dominate Spending

Most spending comes from:

- Bills
- Food
- Fuel
- Grocery

This indicates predictable and recurring spending behavior.

---

## 💳 Basic Card Users Generate Major Revenue

Although premium customers spend more individually:

Gold and Silver users collectively generate higher portfolio revenue due to their larger customer base.

---

## 📈 Revenue Stability

Monthly revenue remains stable around ₹200M+.

This enables:

- Better forecasting
- Stable financial planning
- Reliable campaign scheduling

---

# 💼 Business Impact

The project demonstrates how behavioral segmentation can improve:

- Marketing efficiency
- Revenue optimization
- Customer targeting
- Product personalization
- Strategic decision-making

Even a 5–10% improvement in targeting efficiency within a ₹4B+ portfolio can generate substantial financial impact.

---

# ✅ Strategic Recommendations

## 🎯 Behavior-Based Marketing

Move away from uniform targeting and focus on customer behavior patterns.

---

## 💰 Essential Category Rewards

Design cashback and rewards programs around:

- Bills
- Food
- Fuel

instead of focusing heavily on travel.

---

## 🏙️ Geographic Prioritization

Concentrate marketing investment in top-performing metro cities.

---

## 👥 Focus on Medium-Value Customers

Medium-value customers are a major revenue driver and should receive dedicated engagement strategies.

---

## ⚡ Real-Time Segmentation

Build dynamic segmentation systems using live transaction feeds.

---

# ⚠️ Limitations

- No demographic attributes
- No real-time customer tracking
- Static historical dataset
- Simulated Kaggle dataset
- No marketing campaign linkage
- Rule-based segmentation only

---

# 🚀 Future Enhancements

## Machine Learning Segmentation

Apply clustering algorithms such as:

- K-Means
- DBSCAN

for advanced behavioral segmentation.

---

## Real-Time Data Integration

Integrate live transaction streams for dynamic segmentation.

---

## Predictive Analytics

Develop models for:

- Customer churn prediction
- Lifetime value prediction
- High-value customer forecasting

---

## Personalized Recommendation Engine

Build customer-level personalized reward and offer systems.

---

# 📷 Dashboard Preview

![Dashboard](Dashboard.png)

---

# 📁 Repository Structure

```text
credit-card-customer-segmentation/
│
├── Dashboard.png
├── README.md
├── credit_card_analysis.twbx
├── SQLQuery1.sql
├── SQLQuery2.sql
├── SQLQuery3.sql
├── SQLQuery4.sql
├── SQLQuery5.sql
├── SQLQuery6.sql
├── SQLQuery7.sql
├── SQLQuery10.sql
├── SQLQuery11.sql
├── revenue_by_city.csv
├── monthly_trend.csv
├── category_details.csv
├── customer_segmentation.csv
├── dominant_category.csv
├── Credit-Card-Customer-Segmentation-and-Revenue-Insights-for-ICICI-Bank.pptx
└── Kumari_Nicky_Final_Report.pdf
```

---

# 🎓 Academic Context

California State University, Sacramento  
MSBA 500 — Business Intelligence Capstone

Prepared By:
### Kumari Nicky

---

# 📌 Conclusion

This project demonstrates that customer behavior is more important than simply total spending volume.

Customers with similar spending levels may behave completely differently, and those behavioral differences directly influence revenue potential.

By combining SQL analytics and Tableau visualization, this project transforms raw transaction-level data into actionable business intelligence that supports more effective banking strategies and customer targeting.

---

# ⭐ Final Takeaway

Behavioral segmentation transforms transaction data from simple records into strategic business intelligence.

The true value is not just in collecting data —
it is in understanding customer behavior and using those insights to drive smarter decisions.
# credit-card-customer-segmentation
SQL and Tableau project analyzing credit card customer segmentation, revenue concentration, and spending behavior.
