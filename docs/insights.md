# Key Insights: Customer Churn Analysis

## Executive Summary
Analysis of 19,119 AdventureWorks customers using RFM 
methodology revealed significant churn risk concentration 
and a clear reactivation opportunity.

## Finding 1: Revenue Concentration Risk
$118M (96%) of total revenue comes from LOYAL customers 
who represent only 60% of the base. This concentration 
means losing even a fraction of loyal customers 
has disproportionate revenue impact.

## Finding 2: High Risk Segment
- **5,369 customers** (28% of base) classified as HIGH RISK
- **$4.08M** in revenue at immediate risk
- Average spend of only **$759** vs $10,277 for LOYAL
- These customers have both low recency AND low frequency

## Finding 3: The Reactivation Opportunity
**972 ex-loyal customers** show a unique pattern:
- Previously classified as LOYAL (high frequency + high spend)
- Now have r_score = 1 (longest inactivity in the dataset)
- They know the brand, spent well historically, 
  and went silent, highest ROI win-back targets

## Finding 4: Score Distribution
NTILE(5) creates perfectly balanced score groups (~3,824 
customers each). The segmentation logic identifies that:
- Scores 1-2 on BOTH R and F = HIGH RISK (simultaneous signals)
- Score 3 on both = MEDIUM RISK (early warning zone)
- All others = LOYAL (strong recency OR frequency signal)

## Finding 5: Value Gap
The 14x value difference between LOYAL and HIGH RISK 
customers means a retention investment of up to $9,518 
per customer (the value gap) is financially justified 
before a win-back campaign becomes unprofitable.

## Recommended Next Steps
1. Export HIGH RISK customer list to CRM
2. Prioritize 972 reactivation targets for personal outreach
3. Set up weekly automated RFM refresh via SQL stored procedure
4. Build alert system when customers drop from LOYAL to 
   MEDIUM RISK (early intervention is more effective)