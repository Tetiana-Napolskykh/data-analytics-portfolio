# Facebook & Google Ads Campaign Aggregation

**Goal:**  
Aggregate advertising campaign data from Facebook and Google to calculate key metrics per campaign and date.

**Task:**  
1. Use data from the following tables:  
   - `facebook_ads_basic_daily`  
   - `facebook_adset`  
   - `facebook_campaign`  
   - `google_ads_basic_daily`  
2. In a CTE, combine data from these tables to get:  
   - `ad_date` — ad display date  
   - `campaign_name` — campaign name  
   - `spend`, `impressions`, `reach`, `clicks`, `leads`, `value` — campaign and adset metrics  
   - add a column indicating the source (`facebook` or `google`)  
3. From the combined CTE, aggregate data per `ad_date` and `campaign_name`:  
   - total spend  
   - total impressions  
   - total clicks  
   - total conversion value  
4. Group by `ad_date` and `campaign_name` and order by `ad_date` descending.