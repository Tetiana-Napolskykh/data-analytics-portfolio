## SQL Metrics Explanation

This SQL calculates aggregated Facebook Ads metrics per campaign and date.  

### Selected fields:
- `ad_date`, `campaign_id` — grouping fields
- `SUM(spend)` — total spend
- `SUM(value)` — total conversion value
- `SUM(impressions)` — total impressions
- `SUM(clicks)` — total clicks

### Calculated metrics:
- **CPC (Cost per Click)** = `SUM(spend) / SUM(clicks)`  
- **CPM (Cost per Mille)** = `SUM(spend) * 1000 / SUM(impressions)`  
- **CTR (Click-Through Rate, %)** = `SUM(clicks) * 100 / SUM(impressions)`  
- **ROMI (Return on Marketing Investment)** = `(SUM(value) - SUM(spend)) / SUM(spend)`

### SQL commands used and why:
- `SELECT` — to choose columns and calculated metrics  
- `FROM` — to specify the source table  
- `WHERE impressions > 0 AND clicks > 0` — avoid division by zero for rows  
- `GROUP BY ad_date, campaign_id` — aggregate metrics per campaign per date  
- `ROUND(..., 2)` — round results to 2 decimal places  
- `::numeric` — cast to numeric type for accurate division  
- `NULLIF(..., 0)` — prevent division by zero at group level

This ensures safe, accurate calculation of campaign-level metrics even if some rows have zero impressions or clicks.