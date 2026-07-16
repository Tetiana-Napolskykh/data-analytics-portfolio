## Folder 01: Facebook Ads Spend & Clicks

### Overview
This folder contains a simple SQL query to analyze **daily Facebook Ads data** for spend and clicks.  
The purpose of this exercise is to calculate basic metrics and ensure proper handling of zero values in the data.

### SQL Explanation
SELECT – choose columns to display:
- ad_date – the date of the ad
- spend – total spend for the day
- clicks – total clicks for the day
- fild – calculated metric (spend / clicks), i.e., cost per click per row

FROM – source table: public.facebook_ads_basic_daily
WHERE – filter rows:
- clicks > 0 ensures we only calculate metrics where clicks exist, preventing division by zero

ORDER BY – sort results:
- ad_date DESC sorts the data by date from most recent to oldest

### Key Metric
- fild = spend / clicks

Represents the cost per click for each row in the dataset
Calculated only when clicks > 0