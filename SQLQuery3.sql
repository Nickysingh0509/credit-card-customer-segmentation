-- ================================================
-- SECTION 3: MONTHLY TREND (SEASONALITY)
-- Feeds: Monthly Spending Trend (Line Chart)
-- ================================================

SELECT 
    FORMAT(transaction_date, 'yyyy-MM') AS month,
    SUM(amount) AS total_revenue
FROM dbo.credit_card_transcations
GROUP BY FORMAT(transaction_date, 'yyyy-MM')
ORDER BY month;