# Methodology — RFM Analysis

## What is RFM?
RFM is a proven customer segmentation framework used by 
retail, telecom, and e-commerce companies worldwide.

| Dimension | Definition | Business Signal |
|---|---|---|
| **Recency (R)** | Days since last purchase | Recent buyers are more likely to buy again |
| **Frequency (F)** | Number of orders placed | Frequent buyers have stronger brand loyalty |
| **Monetary (M)** | Total revenue generated | High spenders have higher retention value |

## Scoring Methodology
Each dimension is scored 1-5 using SQL `NTILE(5)`:
- **Score 1** = worst performance (most days inactive, 
  fewest orders, lowest spend)
- **Score 5** = best performance (most recent, most orders, 
  highest spend)

## Segmentation Logic
```sql
CASE
    WHEN r_score <= 2 AND f_score <= 2 THEN 'HIGH RISK'
    WHEN r_score <= 3 AND f_score <= 3 THEN 'MEDIUM RISK'
    ELSE 'LOYAL'
END
```

## Why R and F for segmentation?
Recency and Frequency are the strongest predictors of 
future purchase behavior. Monetary is used for prioritization 
within segments, not for initial classification.

## Reference Date
Used `MAX(OrderDate)` from the dataset (2025-06-29) instead 
of `GETDATE()` to ensure accurate recency calculations 
for historical data analysis.

## Reactivation Target Definition
Customers classified as LOYAL with r_score = 1:
- Were previously high-value customers (LOYAL classification)
- Have not purchased in the longest time (r_score = 1)
- Represent the highest ROI for win-back campaigns