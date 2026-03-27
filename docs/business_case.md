Business Case: Customer Churn Intelligence System.

===

## Problem Statement

AdventureWorks has no visibility into which customers
are about to stop purchasing. Without early warning signals,
the sales and retention teams cannot take proactive action,
resulting in silent revenue loss.

## Business Questions Answered

* Which customers are at highest risk of churning?
* How much revenue is at stake if no action is taken?
* Which ex-loyal customers are worth a reactivation campaign?
* How does customer value differ across risk segments?

## Financial Impact Identified

|Segment|Customers|Revenue at Stake|
|-|-|-|
|HIGH RISK|5,369|$4,077,465|
|MEDIUM RISK|2,251|$965,173|
|LOYAL|11,499|$118,174,182|
|**TOTAL**|**19,119**|**$123,216,820**|

## Key Finding

LOYAL customers spend **14x more** than HIGH RISK customers
($10,277 vs $759 average). Retaining one loyal customer
is equivalent to acquiring 14 high-risk customers.

## Recommended Actions

1. **Immediate**: Contact 5,369 HIGH RISK customers with
   retention offers before revenue is lost
2. **Priority**: Launch win-back campaign for 972 ex-loyal
   customers with r\_score = 1 — highest ROI reactivation targets
3. **Ongoing**: Monitor weekly RFM scores to detect
   early churn signals before they become critical
