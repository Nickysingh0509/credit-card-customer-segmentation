-- ================================================
-- SECTION 5 (UPDATED): CARD TYPE BEHAVIOR OVER TIME
-- Feeds: Spending Behavior Across Card Types Over Time
-- ================================================

SELECT 
    FORMAT(transaction_date, 'yyyy-MM') AS month,
    card_type,
    SUM(amount) AS total_spend
FROM dbo.credit_card_transcations
GROUP BY 
    FORMAT(transaction_date, 'yyyy-MM'),
    card_type
ORDER BY 
    month, card_type;