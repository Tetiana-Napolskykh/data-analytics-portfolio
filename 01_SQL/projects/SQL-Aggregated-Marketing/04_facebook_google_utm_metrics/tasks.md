# Facebook & Google Ads UTM Metrics

**Goal:**  
Aggregate advertising metrics from Facebook and Google campaigns and extract UTM campaign parameters to calculate key KPIs per date and campaign.

**Task:**  
1. Use data from the following tables:  
   - `facebook_ads_basic_daily`  
   - `google_ads_basic_daily`  
2. In a CTE, combine data from these tables to get:  
   - `ad_date` — ad display date  
   - `url_parameters` — URL with campaign UTM parameters  
   - `spend`, `impressions`, `reach`, `clicks`, `leads`, `value` — metrics per campaign/adset  
   - Use `COALESCE` to replace nulls with 0  
3. From the CTE, create a result table:  
   - `ad_date`  
   - `utm_campaign` — extract `utm_medium` from `url_parameters` using `substring` and regex, convert to lowercase; if `nan`, then set NULL  
   - Aggregate metrics per `ad_date` and `utm_campaign`:  
     - total spend  
     - total impressions  
     - total clicks  
     - total conversion value  
   - Calculate KPIs per date and campaign: CTR, CPC, CPM, ROMI using `CASE` to avoid division by zero  
4. Group by `ad_date` and `utm_campaign` and order by `ad_date`.

