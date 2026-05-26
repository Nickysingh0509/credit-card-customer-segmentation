-- ================================================
-- SECTION 6: CUSTOMER SEGMENTATION 
-- ================================================

WITH segmented AS (
    SELECT 
        amount,
        CASE 
            WHEN amount >= 100000 THEN 'High Value'
            WHEN amount BETWEEN 50000 AND 99999 THEN 'Medium Value'
            ELSE 'Low Value'
        END AS segment
    FROM dbo.credit_card_transcations
),

agg AS (
    SELECT 
        segment,
        COUNT(*) AS transaction_count,
        SUM(amount) AS total_revenue
    FROM segmented
    GROUP BY segment
),

final AS (
    SELECT 
        segment,
        transaction_count,
        total_revenue,
        transaction_count * 1.0 / SUM(transaction_count) OVER() AS customer_pct,
        total_revenue * 1.0 / SUM(total_revenue) OVER() AS revenue_pct
    FROM agg
)

SELECT 
    segment,
    customer_pct,
    revenue_pct,
    revenue_pct / customer_pct AS revenue_per_customer_index
FROM final
ORDER BY revenue_per_customer_index DESC;