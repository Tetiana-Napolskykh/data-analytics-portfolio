# Facebook & Google Ads Monthly UTM Metrics

**Goal:**  
Aggregate Facebook and Google ad data on a monthly level, calculate key KPIs per UTM campaign, and compute month-over-month differences for CPC, CTR, and ROMI.

**Task:**  
1. Use the CTE from the previous homework as `CTE_1` with the following fields:  
   - `ad_date`  
   - `url_parameters`  
   - `spend`, `impressions`, `reach`, `clicks`, `leads`, `value`  
2. Create a second CTE (`CTE_2`) to calculate:  
   - `ad_month` — first day of the month from `ad_date`  
   - `utm_campaign` — extract `utm_campaign` from `url_parameters`, convert to lowercase, set `NULL` if `'nan'`  
   - Aggregate metrics per month and campaign: total spend, total impressions, total clicks, total conversion value  
   - KPIs: CTR, CPC, CPM, ROMI using `CASE` to avoid division by zero  
3. In the final query, add columns for month-over-month % differences for CPC, CTR, and ROMI using `LAG()` over each `utm_campaign`.  
4. Group and order by `ad_month`.
