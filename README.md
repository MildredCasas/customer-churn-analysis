# Customer Churn Intelligence System

**Tools:** SQL Server · Power BI · DAX  
**Dataset:** AdventureWorks2025 — 19,119 customers

## Business Problem
AdventureWorks has no visibility into which customers 
are about to churn, making it impossible to take 
proactive retention actions.

## Solution
Built an end-to-end RFM (Recency, Frequency, Monetary) 
analysis system that segments customers by churn risk 
and quantifies revenue at stake.

## Key Results
-  Identified **$4M+** in revenue at risk from HIGH RISK segment
-  **5,369 customers** (28% of base) classified as HIGH RISK
-  LOYAL customers spend **14x more** than HIGH RISK ($10,277 vs $759)
-  Identified **972 high-value ex-loyal customers** as prime reactivation targets (high spend history + critical recency decline)

## Technical Architecture
SQL Server → Power Query → Power BI (DAX)

## SQL Techniques Used
- CTEs (Common Table Expressions)
- Window Functions (NTILE, LAG, SUM OVER)
- Stored Procedures
- RFM Scoring Methodology

## Dashboard Pages
1. **Executive Summary** — KPIs, revenue at risk, segment distribution
2. **RFM Analysis** — Score breakdown, segment comparison
3. **Customer Detail** — Actionable customer-level view *(in progress)*

## Files
- `/sql/01_rfm_base.sql` — Complete RFM query with CTEs
- `/dashboards/Customer_Churn_Dashboard.pbix` — Power BI file
