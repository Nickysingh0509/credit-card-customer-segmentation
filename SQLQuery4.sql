-- ================================================
-- SECTION 4: CATEGORY CONTRIBUTION
-- Feeds: Spending Contribution by Category (Bar Chart)
-- ================================================

SELECT 
    exp_type,
    SUM(amount) AS total_revenue,
    (SUM(amount) * 100.0 / SUM(SUM(amount)) OVER()) AS contribution_percentage
FROM dbo.credit_card_transcations
GROUP BY exp_type
ORDER BY total_revenue DESC;