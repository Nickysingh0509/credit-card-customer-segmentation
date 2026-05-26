-- ================================================
-- SECTION 2: REVENUE BY CITY
-- Feeds: Top Cities Driving Revenue (Tableau bar chart)
-- ================================================

-- Objective:
-- Identify top revenue-generating cities to understand geographic concentration
USE credit_card_project;
GO

SELECT 
    city,
    SUM(amount) AS total_revenue
FROM dbo.credit_card_transcations
GROUP BY city
ORDER BY total_revenue DESC;


SELECT * 
FROM dbo.credit_card_transcations;

