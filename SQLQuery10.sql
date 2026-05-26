-- DATA CLEANING
SELECT *
FROM dbo.credit_card_transcations
WHERE city IS NOT NULL
  AND transaction_date IS NOT NULL
  AND card_type IS NOT NULL
  AND exp_type IS NOT NULL
  AND amount IS NOT NULL;



 