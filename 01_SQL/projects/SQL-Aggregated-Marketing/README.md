# SQL Aggregated Marketing Portfolio

**Overview:**  
A collection of SQL exercises and mini-projects completed in DBeaver, analyzing marketing data from Facebook and Google Ads.
The work demonstrates:

Data aggregation

KPI calculation

Practical SQL skills for marketing analytics

**Key Metrics Analyzed:**  
- Spend – total advertising spend
- Impressions – total ad impressions
- Clicks – total clicks
- Conversions / Value – total conversion value
- CTR (Click-Through Rate) – SUM(clicks) / SUM(impressions) * 100
- CPC (Cost per Click) – SUM(spend) / SUM(clicks)
- CPM (Cost per Thousand Impressions) – SUM(spend) * 1000 / SUM(impressions)
- ROMI (Return on Marketing Investment) – (SUM(value) - SUM(spend)) / SUM(spend)
- Month-over-month changes per UTM campaign 

**SQL Skills Applied:**  
- CTEs (Common Table Expressions) for modular queries  
- Aggregation by date, campaign, and UTM parameters  
- Window functions (`LAG`) for month-over-month comparison  
- Null handling using `COALESCE`  
- Conditional logic with `CASE` to prevent division by zero  
- Regex extraction (`substring`) for URL parameters  

**Folder Structure:**
- [01_facebook_ads_spend_clicks/](01_facebook_ads_spend_clicks/README.md) – Raw Facebook Ads data: spend, impressions, clicks, and basic metrics
- [02_facebook_ads_campaign_metrics/](02_facebook_ads_campaign_metrics/README.md) – Aggregated Facebook Ads metrics per campaign (CPC, CPM, CTR, ROMI)
- 03_facebook_google_campaign_aggregation/ – Combined Facebook & Google Ads campaign-level aggregation
- 04_facebook_google_utm_metrics/ – UTM parameter-level metrics for both platforms
- 05_facebook_google_utm_monthly_metrics/ – Month-over-month analysis of UTM campaigns

Each folder contains a README.md explaining the scripts, SQL logic, and calculated metrics in detail.