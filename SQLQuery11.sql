 -- CITY LEVEL REVENUE
 -- Data Preparation (Aggregation)
SELECT 
    city,
    SUM(amount) AS total_revenue
FROM dbo.credit_card_transcations
GROUP BY city
ORDER BY total_revenue DESC;