-- ================================================
-- SECTION 7: DOMINANT CATEGORY BY GEO TIER
-- ================================================

WITH tier_category AS (
    SELECT 
        geo_tier,
        exp_type,
        SUM(amount) AS total_spend
    FROM dbo.credit_card_transcations
    GROUP BY geo_tier, exp_type
),

ranked AS (
    SELECT 
        *,
        RANK() OVER (PARTITION BY geo_tier ORDER BY total_spend DESC) AS rnk
    FROM tier_category
)

SELECT 
    geo_tier,
    exp_type AS dominant_category,
    total_spend
FROM ranked
WHERE rnk = 1
ORDER BY total_spend DESC;