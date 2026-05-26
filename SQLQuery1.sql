USE credit_card_project;
GO

-- =====================================================
-- SECTION 1: KPI SUMMARY
-- Feeds: KPI cards in Tableau
-- =====================================================

-- Objective:
-- KPI values are used for high-level portfolio understanding
-- and are visualized in Tableau for business reporting.

SELECT
    SUM(amount) AS total_revenue,
    COUNT(*) AS total_transactions,
    AVG(CAST(amount AS DECIMAL(18,2))) AS avg_spend_per_transaction,
    COUNT(DISTINCT city) AS total_cities
FROM dbo.credit_card_transcations;